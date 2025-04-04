### Guillotine
``` rust
pub struct Guillotine {
    width: u16,
    height: u16,
    pub free_rects: Vec<Rect>,
}

impl Guillotine {
    fn new(width: u16, height: u16) -> Self {
        Self {
            width,
            height,
            free_rects: vec![Rect::new(0, 0, width, height)],
        }
    }
    
    fn split(fw: u16, fh: u16, fx: u16, fy: u16, w: u16, h: u16) -> (Rect, Rect) {
        if fw - w < fh - h {
            (
                Rect::new(fx, fy + h, fw, fh - h),
                Rect::new(fx + w, fy, fw - w, h),
            )
        } else {
            (
                Rect::new(fx + w, fy, fw - w, fh),
                Rect::new(fx, fy + h, w, fh - h),
            )
        }
    }

    fn pack_all(&mut self, rects: &[(u16, u16)]) -> Vec<Option<(u16, u16)>> {
        let mut indexed_rects = rects
            .iter()
            .enumerate()
            .map(|(i, &(w, h))| (i, w, h))
            .collect::<Vec<_>>();
        indexed_rects.sort_unstable_by_key(|&(_, w, h)| std::cmp::Reverse(w as u32 * h as u32));
        let mut rects = vec![None; indexed_rects.len()];
        for (i, w, h) in indexed_rects {
            let r = self.pack(w, h);
            rects[i] = r;
        }
        rects
    }

    fn pack(&mut self, w: u16, h: u16) -> Option<(u16, u16)> {
        assert_ne!(w, 0, "width was 0");
        assert_ne!(h, 0, "height was 0");
        let min_fr = self.free_rects.iter_mut().enumerate().min_by_key(|(_, f)| {
            let (_, _, fw, fh) = f.xywh();
            if fw < w || fh < h {
                u32::MAX
            } else {
                ((fw - w) as u32 * h as u32).min((fh - h) as u32 * w as u32)
            }
        });
        if let Some((i, min_fr)) = min_fr {
            let (x, y, fw, fh) = min_fr.xywh();
            if w <= fw && h <= fh {
                use std::cmp::Ordering::*;
                match (w.cmp(&fw), h.cmp(&fh)) {
                    (_, Greater) | (Greater, _) => unreachable!(),
                    (Less, Less) => {
                        let (big, small) = Self::split(fw, fh, x, y, w, h);
                        *min_fr = small;
                        self.free_rects.push(big);
                    }
                    (Less, Equal) => {
                        *min_fr = Rect::new(x + w, y, fw - w, fh);
                    }
                    (Equal, Less) => {
                        *min_fr = Rect::new(x, y + h, fw, fh - h);
                    }
                    (Equal, Equal) => {
                        self.free_rects.remove(i);
                    }
                };
                Some((x, y))
            } else {
                None
            }
        } else {
            None
        }
    }

    fn reset(&mut self) {
        self.free_rects = vec![Rect::new(0, 0, self.width, self.height)];
    }

    fn resize(&mut self, width: u16, height: u16) {
        let (fw, fh) = (width, height);
        let (w, h) = (self.width, self.height);
        assert!(fw >= w && fh >= h);
        if fw == w && fh == h {
            return;
        }
        let (big, small) = Self::split(fw, fh, 0, 0, w, h);
        self.free_rects.push(small);
        self.free_rects.push(big);
        self.width = fw;
        self.height = fh;
    }

    fn width(&self) -> u16 {
        self.width
    }

    fn height(&self) -> u16 {
        self.height
    }
}
```
### Complex Guillotine with Unpacking and Merging
``` rust
pub trait Packer: Sized {
    fn new(width: u16, height: u16) -> Self;
    fn pack(&mut self, w: u16, h: u16) -> Option<(u16, u16)>;
    fn pack_all(&mut self, rects: &[(u16, u16)]) -> Vec<Option<(u16, u16)>>;
    fn growing_pack_all_with<F: Fn(u16, u16) -> (u16, u16)>(
        &mut self,
        rects: &[(u16, u16)],
        growth_fn: F,
    ) -> Vec<(u16, u16)> {
        let mut maybe_packed = self.pack_all(rects);
        let mut packed = maybe_packed.iter().filter_map(|&p| p).collect::<Vec<_>>();
        while packed.len() != maybe_packed.len() {
            let (w, h) = growth_fn(self.width(), self.height());
            assert!(
                w > self.width() || h > self.height(),
                "growth fn didn't grow packer"
            );
            assert!(
                w >= self.width() && h >= self.height(),
                "growth fn can't shrink packer"
            );
            *self = Self::new(w, h);
            maybe_packed = self.pack_all(rects);
            packed = maybe_packed.iter().filter_map(|&p| p).collect::<Vec<_>>();
        }
        packed
    }
    fn growing_pack_all(&mut self, rects: &[(u16, u16)], growth_factor: f32) -> Vec<(u16, u16)> {
        assert!(growth_factor > 1.0, "growth factor must be more than 1");
        self.growing_pack_all_with(rects, |w: u16, h: u16| {
            (
                (w as f32 * growth_factor).ceil() as u16,
                (h as f32 * growth_factor).ceil() as u16,
            )
        })
    }
    #[allow(unused)]
    fn unpack(&mut self, x: u16, y: u16, w: u16, h: u16) {
        panic!("unpacking not supported for this packer")
    }
    #[allow(unused)]
    fn reset(&mut self);
    fn resize(&mut self, width: u16, height: u16);
    fn width(&self) -> u16;
    fn height(&self) -> u16;
    fn grow(&mut self, factor: f32) {
        self.resize(
            (self.width() as f32 * factor).ceil() as u16,
            (self.height() as f32 * factor).ceil() as u16,
        );
    }
}

pub struct Guillotine {
    width: u16,
    height: u16,
    pub free_rects: Vec<Rect>, // FIXME: remove pub, it was for testing
}

#[derive(PartialEq, Eq, Clone, Copy)]
enum AdjRect {
    North(usize),
    East(usize),
    South(usize),
    West(usize),
    NorthShorter(usize),
    EastShorter(usize),
    SouthShorter(usize),
    WestShorter(usize),
    NorthLonger(usize),
    EastLonger(usize),
    SouthLonger(usize),
    WestLonger(usize),
}

impl AdjRect {
    fn idx(self) -> usize {
        match self {
            AdjRect::North(i)
            | AdjRect::East(i)
            | AdjRect::South(i)
            | AdjRect::West(i)
            | AdjRect::NorthShorter(i)
            | AdjRect::EastShorter(i)
            | AdjRect::SouthShorter(i)
            | AdjRect::WestShorter(i)
            | AdjRect::NorthLonger(i)
            | AdjRect::EastLonger(i)
            | AdjRect::SouthLonger(i)
            | AdjRect::WestLonger(i) => i,
        }
    }

    fn is_eq(self) -> bool {
        matches!(
            self,
            AdjRect::North(_) | AdjRect::East(_) | AdjRect::South(_) | AdjRect::West(_)
        )
    }
}

impl Guillotine {
    fn split(fw: u16, fh: u16, x: u16, y: u16, w: u16, h: u16) -> (Rect, Rect) {
        // more free space on top
        if fh - h > fw - w {
            (
                Rect::new(x, y + h, fw, fh - h), // wide top
                Rect::new(x + w, y, fw - w, h),  // narrow right
            )
        } else {
            (
                Rect::new(x + w, y, fw - w, fh), // tall right
                Rect::new(x, y + h, w, fh - h),  // short top
            )
        }
    }

    fn find_adjacent(&self, x: u16, y: u16, w: u16, h: u16) -> [Option<AdjRect>; 4] {
        let (mut north, mut east, mut south, mut west) = (None, None, None, None);
        for (i, fr) in self.free_rects.iter().enumerate() {
            let (fx, fy, fw, fh) = fr.xywh();
            if fx == x && fy == y + h {
                north = Some(match fw.cmp(&w) {
                    Ordering::Less => AdjRect::NorthShorter(i),
                    Ordering::Equal => AdjRect::North(i),
                    Ordering::Greater => AdjRect::NorthLonger(i),
                });
            } else if fx == x + w && fy == y {
                east = Some(match fh.cmp(&h) {
                    Ordering::Less => AdjRect::EastShorter(i),
                    Ordering::Equal => AdjRect::East(i),
                    Ordering::Greater => AdjRect::EastLonger(i),
                });
            } else if fx == x && fy + fh == y {
                south = Some(match fw.cmp(&w) {
                    Ordering::Less => AdjRect::SouthShorter(i),
                    Ordering::Equal => AdjRect::South(i),
                    Ordering::Greater => AdjRect::SouthLonger(i),
                });
            } else if fx + fw == x && fy == y {
                west = Some(match fh.cmp(&h) {
                    Ordering::Less => AdjRect::WestShorter(i),
                    Ordering::Equal => AdjRect::West(i),
                    Ordering::Greater => AdjRect::WestLonger(i),
                });
            }
            if north.is_some() && east.is_some() && south.is_some() && west.is_some() {
                break;
            }
        }
        [north, east, south, west]
    }

    fn find_biggest_adjacent(&self, x: u16, y: u16, w: u16, h: u16) -> Option<AdjRect> {
        self.find_adjacent(x, y, w, h)
            .into_iter()
            .max_by_key(|idx| {
                idx.map(|i| {
                    (if matches!(
                        i,
                        AdjRect::North(_)
                            | AdjRect::NorthLonger(_)
                            | AdjRect::NorthShorter(_)
                            | AdjRect::South(_)
                            | AdjRect::SouthLonger(_)
                            | AdjRect::SouthShorter(_)
                    ) {
                        self.free_rects[i.idx()].wh().1 as u32
                    } else {
                        self.free_rects[i.idx()].wh().0 as u32
                    }) + (if i.is_eq() { u32::MAX / 2 } else { 0 })
                })
                .unwrap_or(0)
            })
            .unwrap()
    }

    /// finds adjacent rects and merges with biggest one `(by area)`\
    /// keeps doing this until everything is fully merged `(greedy)`
    fn merge_impl(&mut self, free_rect_idx: usize, remove: &mut Vec<usize>) {
        let (x, y, w, h) = self.free_rects[free_rect_idx].xywh();
        assert_ne!(w, 0, "width was 0");
        assert_ne!(h, 0, "height was 0");
        let adj = self.find_biggest_adjacent(x, y, w, h);
        let mut merge_eq = |i: usize, merged: Rect, free_rects: &mut Vec<Rect>| {
            free_rects[free_rect_idx] = merged;
            remove.push(i);
        };
        let merge_ne = |i: usize, merged: Rect, left_out: Rect, free_rects: &mut [Rect]| {
            free_rects[free_rect_idx] = left_out;
            free_rects[i] = merged;
        };
        if let Some(adj) = adj {
            let calc_score = |a: Rect, b: Rect| 1.0 / (a.aspect() * b.aspect());
            let score = calc_score(self.free_rects[free_rect_idx], self.free_rects[adj.idx()]);
            let (fw, fh) = self.free_rects[adj.idx()].wh();
            match adj {
                AdjRect::North(i) | AdjRect::East(i) | AdjRect::South(i) | AdjRect::West(i) => {
                    merge_eq(
                        i,
                        match adj {
                            AdjRect::North(_) => Rect::new(x, y, w, h + fh),
                            AdjRect::East(_) => Rect::new(x, y, w + fw, h),
                            AdjRect::South(_) => Rect::new(x, y - fh, w, fh + h),
                            AdjRect::West(_) => Rect::new(x - fw, y, fw + w, h),
                            _ => unreachable!(),
                        },
                        &mut self.free_rects,
                    );
                    self.merge_impl(free_rect_idx, remove);
                }
                AdjRect::NorthShorter(i)
                | AdjRect::EastShorter(i)
                | AdjRect::SouthShorter(i)
                | AdjRect::WestShorter(i)
                | AdjRect::NorthLonger(i)
                | AdjRect::EastLonger(i)
                | AdjRect::SouthLonger(i)
                | AdjRect::WestLonger(i) => {
                    let (merged, left_out) = match adj {
                        AdjRect::NorthShorter(_) => {
                            (Rect::new(x, y, fw, h + fh), Rect::new(x + fw, y, w - fw, h))
                        }
                        AdjRect::EastShorter(_) => {
                            (Rect::new(x, y, w + fw, fh), Rect::new(x, y + fh, w, h - fh))
                        }
                        AdjRect::SouthShorter(_) => (
                            Rect::new(x, y - fh, fw, h + fh),
                            Rect::new(x + fw, y, w - fw, h),
                        ),
                        AdjRect::WestShorter(_) => (
                            Rect::new(x - fw, y, w + fw, fh),
                            Rect::new(x, y + fh, w, h - fh),
                        ),
                        AdjRect::NorthLonger(_) => (
                            Rect::new(x, y, w, h + fh),
                            Rect::new(x + w, y + h, fw - w, fh),
                        ),
                        AdjRect::EastLonger(_) => (
                            Rect::new(x, y, w + fw, h),
                            Rect::new(x + w, y + h, fw, fh - h),
                        ),
                        AdjRect::SouthLonger(_) => (
                            Rect::new(x, y - fh, w, h + fh),
                            Rect::new(x + w, y - fh, fw - w, fh),
                        ),
                        AdjRect::WestLonger(_) => (
                            Rect::new(x - fw, y, w + fw, h),
                            Rect::new(x - fw, y + h, fw, fh - h),
                        ),
                        _ => unreachable!(),
                    };
                    let new_score = calc_score(merged, left_out);
                    if new_score > score {
                        merge_ne(i, merged, left_out, &mut self.free_rects);
                        self.merge_impl(free_rect_idx, remove);
                        self.merge_impl(i, remove);
                    }
                }
            }
        };
    }

    fn merge(&mut self, free_rect_idx: usize) {
        let mut rm = Vec::new();
        self.merge_impl(free_rect_idx, &mut rm);
        rm.sort_unstable_by(|a, b| b.cmp(a));
        for i in rm {
            self.free_rects.swap_remove(i);
        }
    }
}

impl Packer for Guillotine {
    fn new(width: u16, height: u16) -> Self {
        Self {
            width,
            height,
            free_rects: vec![Rect::new(0, 0, width, height)],
        }
    }

    /// O(n * r), n is free rect count, r is rects.len()
    fn pack_all(&mut self, rects: &[(u16, u16)]) -> Vec<Option<(u16, u16)>> {
        let mut indexed_rects = rects
            .iter()
            .enumerate()
            .map(|(i, &(w, h))| (i, w, h))
            .collect::<Vec<_>>();
        indexed_rects.sort_unstable_by_key(|&(_, w, h)| std::cmp::Reverse(w as u32 * h as u32));
        let mut rects = vec![None; indexed_rects.len()];
        for (i, w, h) in indexed_rects {
            let r = self.pack(w, h);
            rects[i] = r;
        }
        rects
    }

    /// O(n), n is free rect count
    fn pack(&mut self, w: u16, h: u16) -> Option<(u16, u16)> {
        assert_ne!(w, 0, "width was 0");
        assert_ne!(h, 0, "height was 0");
        let min_fr = self.free_rects.iter_mut().enumerate().min_by_key(|(_, f)| {
            let (fw, fh) = f.wh();
            if fw < w || fh < h {
                u32::MAX
            } else {
                let (w, h) = (w as f32, h as f32);
                let (dw, dh) = (fw as f32 - w, fh as f32 - h);
                (4e8 / ((dw.max(h) / dw.min(h)) * (dh.max(w) / dh.min(w)))) as u32
            }
        });
        if let Some((i, min_fr)) = min_fr {
            let (x, y, fw, fh) = min_fr.xywh();
            if w <= fw && h <= fh {
                use std::cmp::Ordering::*;
                match (w.cmp(&fw), h.cmp(&fh)) {
                    (_, Greater) | (Greater, _) => unreachable!(),
                    (Less, Less) => {
                        let (big, small) = Self::split(fw, fh, x, y, w, h);
                        *min_fr = small;
                        self.free_rects.push(big);
                    }
                    (Less, Equal) => {
                        *min_fr = Rect::new(x + w, y, fw - w, fh);
                    }
                    (Equal, Less) => {
                        *min_fr = Rect::new(x, y + h, fw, fh - h);
                    }
                    (Equal, Equal) => {
                        self.free_rects.swap_remove(i);
                    }
                };
                Some((x, y))
            } else {
                None
            }
        } else {
            None
        }
    }

    fn unpack(&mut self, x: u16, y: u16, w: u16, h: u16) {
        self.free_rects.push(Rect::new(x, y, w, h));
        self.merge(self.free_rects.len() - 1);
    }

    fn reset(&mut self) {
        self.free_rects = vec![Rect::new(0, 0, self.width, self.height)];
    }

    fn resize(&mut self, width: u16, height: u16) {
        let (fw, fh) = (width, height);
        let (w, h) = (self.width, self.height);
        assert!(fw >= w && fh >= h);
        if fw == w && fh == h {
            return;
        }
        self.width = fw;
        self.height = fh;
        let (big, small) = Self::split(fw, fh, 0, 0, w, h);
        self.free_rects.push(small);
        self.merge(self.free_rects.len() - 2);
        self.free_rects.push(big);
        self.merge(self.free_rects.len() - 1);
    }

    fn width(&self) -> u16 {
        self.width
    }

    fn height(&self) -> u16 {
        self.height
    }
}
```

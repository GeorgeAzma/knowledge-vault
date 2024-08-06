``` rust
impl RectPacker {
    pub fn new(size: u32) -> Self {
        Self {
            size,
            empty_spaces: vec![(0, 0, size, size)],
        }
    }

    pub fn pack(&mut self, mut w: u32, mut h: u32) -> Option<(u32, u32, u32, u32)> {
		for i in 0..self.empty_spaces.len() {
		    let (ex, ey, ew, eh) = self.empty_spaces[i];
		    if w <= ew && h <= eh || h <= ew && w <= eh {
		        if (ew - w) * (eh - h) > (ew - h) * (eh - w) {
		            std::mem::swap(&mut w, &mut h); // Rotate
		        }
		        return if w < ew && h < eh {
		            if ew - w < eh - h {
		                self.empty_spaces[i] = (ex + w, ey, ew - w, h);
		                self.empty_spaces.push((ex, ey + h, ew, eh - h))
		            } else {
		                self.empty_spaces[i] = (ex, ey + h, w, eh - h);
		                self.empty_spaces.push((ex + w, ey, ew - w, eh))
		            }
		            Some((ex, ey, w, h))
		        } else if h == eh {
		            self.empty_spaces[i] = (ex + w, ey, ew - w, eh);
		            Some((ex, ey, w, h))
		        } else if w == ew {
		            self.empty_spaces[i] = (ex, ey + h, ew, eh - h);
		            Some((ex, ey, w, h))
		        } else {
		            self.empty_spaces.swap_remove(i);
		            Some((ex, ey, w, h))
		        };
		    }
	    }
	    None 
    }

    pub fn reset(&mut self) {
        self.empty_spaces = vec![(0, 0, self.size, self.size)];
    }
}
```








### Faster Version
``` rust
pub struct RectPacker {
    width: u32,
    height: u32,
    empty_spaces: Vec<(u32, u32, u32, u32)>,
}

impl RectPacker {
    pub fn new(width: u32, height: u32) -> Self {
        Self {
            width,
            height,
            empty_spaces: vec![(0, 0, width, height)],
            last_sort: 0,
        }
    }

    pub fn pack(&mut self, mut w: u32, mut h: u32) -> Option<(u32, u32, u32, u32)> {
        let mut start_i = 0;

        let space = self.empty_spaces.binary_search_by(|(_, _, ew, eh)| {
            let cmp_wh = ew.cmp(&w).then(eh.cmp(&h));
            if cmp_wh == std::cmp::Ordering::Equal {
                return std::cmp::Ordering::Equal;
            }

            let cmp_hw = ew.cmp(&h).then(eh.cmp(&w));
            if cmp_hw == std::cmp::Ordering::Equal {
                std::mem::swap(&mut w, &mut h);
                return std::cmp::Ordering::Equal;
            }

            if cmp_wh == std::cmp::Ordering::Greater || cmp_hw == std::cmp::Ordering::Greater {
                return std::cmp::Ordering::Greater;
            }

            std::cmp::Ordering::Less
        });
        if let Ok(space) = space {
            let (ex, ey, _, _) = self.empty_spaces[space];
            self.empty_spaces.remove(space);
            return Some((ex, ey, w, h));
        } else if let Err(space) = space {
            start_i = space;
        }

        let len = self.empty_spaces.len();
        let mut search = |start, end| {
            for i in start..end {
                let (ex, ey, ew, eh) = self.empty_spaces[i];

                if w <= ew && h <= eh || h <= ew && w <= eh {
                    if (ew - w) * (eh - h) > (ew - h) * (eh - w) {
                        std::mem::swap(&mut w, &mut h); // Rotate
                    }

                    return if w < ew && h < eh {
                        if ew - w < eh - h {
                            self.empty_spaces[i] = (ex + w, ey, ew - w, h);
                            self.empty_spaces.push((ex, ey + h, ew, eh - h));
                        } else {
                            self.empty_spaces[i] = (ex, ey + h, w, eh - h);
                            self.empty_spaces.push((ex + w, ey, ew - w, eh));
                        }
                        Some((ex, ey, w, h))
                    } else if h == eh {
                        self.empty_spaces[i] = (ex + w, ey, ew - w, eh);
                        Some((ex, ey, w, h))
                    } else if w == ew {
                        self.empty_spaces[i] = (ex, ey + h, ew, eh - h);
                        Some((ex, ey, w, h))
                    } else {
                        self.empty_spaces.swap_remove(i);
                        Some((ex, ey, w, h))
                    };
                }
            }
            None
        };

        if let Some(space) = search(start_i, len) {
            return Some(space);
        } else {
            return search(0, start_i);
        }
    }

    pub fn reset(&mut self) {
        self.empty_spaces = vec![(0, 0, self.width, self.height)];
    }

    // Note: not a perfect resize
    pub fn resize(&mut self, width: u32, height: u32) {
        assert!(width >= self.width && height >= self.height);
        if width == self.width && height == self.height {
            return;
        }
        let (big, small) = if width - self.width < height - self.height {
            (
                (0, self.height, width, height - self.height),
                (self.width, 0, width - self.width, self.height),
            )
        } else {
            (
                (self.width, 0, width - self.width, height),
                (0, self.height, self.width, height - self.height),
            )
        };
        self.empty_spaces.push(big);
        self.empty_spaces.push(small);
        self.width = width;
        self.height = height;
    }
}
```

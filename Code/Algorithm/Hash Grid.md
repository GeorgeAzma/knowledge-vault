youtu.be/rSKMYc1CQHE?t=1445
### Steps
- Split space into a grid
> [!tip] grid size should be average size of an object `radius for circle`
- `hash()` grid coordinates
- Mod the Hash with `objects.len()`
- That will be the key of the Cell
- Have a list where you assign each object with its cell's key `(object_id, cell_key)`
- Sort that list by key, call this list `keys`
- Have `cells` list which tells you where start of each cell group in `keys` is
- Populate `cells` by looping over `keys` and checking where key is different
#### Finding Nearby Objects
- Get `keys` of current and neighboring cells
- Lookup `keys` start index for that cell in `cells` using a cell key
- Iterate `keys` from that start index till a different cell key
- Use `object_id` from the keys to know which objects are nearby
### Code
``` Rust
pub struct HashGrid {
    cell_size: f32,
    point_cell_keys: Vec<(u32, u32)>,
    cell_start_indices: Vec<u32>,
}

impl HashGrid {
    pub fn new(points: &Vec<(f32, f32)>, cell_size: f32) -> Self {
        if points.len() == 0 {
            return Self {
                cell_size,
                point_cell_keys: Vec::new(),
                cell_start_indices: Vec::new(),
            };
        }

        let mut point_cell_keys = Vec::new();
        let mut cell_start_indices = Vec::new();
        point_cell_keys.resize(points.len(), Default::default());
        cell_start_indices.resize(points.len(), u32::MAX);

        for (i, &(x, y)) in points.iter().enumerate() {
            let (cx, cy) = Self::to_cell_coord(x, y, cell_size);
            let key = Self::cell_key(cx, cy, points.len() as u32);
            point_cell_keys[i] = (i as u32, key);
        }

        point_cell_keys.sort_unstable_by_key(|e| e.1);

        let (_, mut last_key) = point_cell_keys[0];
        cell_start_indices[last_key as usize] = 0;
        for i in 1..point_cell_keys.len() {
            let (_, key) = point_cell_keys[i];
            if last_key != key {
                cell_start_indices[key as usize] = i as u32;
            }
            last_key = key;
        }

        Self {
            cell_size,
            point_cell_keys,
            cell_start_indices,
        }
    }

    fn to_cell_coord(x: f32, y: f32, cell_size: f32) -> (i32, i32) {
        ((x / cell_size) as i32, (y / cell_size) as i32)
    }

    fn cell_key(cx: i32, cy: i32, size: u32) -> u32 {
        (cx as u32)
            .wrapping_mul(15823)
            .wrapping_add((cy as u32).wrapping_mul(9737333))
            % size
    }

    pub fn find(&self, x: f32, y: f32) -> Vec<u32> {
        if self.point_cell_keys.len() == 0 {
            return Vec::new();
        }

        let mut indices = Vec::new();
        for i in -1..=1 {
            for j in -1..=1 {
                let (cx, cy) = Self::to_cell_coord(x, y, self.cell_size);
                let (cx, cy) = (cx + i, cy + j);
                let key = Self::cell_key(cx, cy, self.point_cell_keys.len() as u32);
                let start = self.cell_start_indices[key as usize];
                if start == u32::MAX {
                    continue;
                }
                for i in start as usize..self.point_cell_keys.len() {

                    let (point_idx, cell_key) = self.point_cell_keys[i];
                    if cell_key != key {
                        break;
                    }
                    indices.push(point_idx);
                }
            }
        }
        indices
    }
}

```
- rebuild hash grid every frame
- 12 bytes overhead per object

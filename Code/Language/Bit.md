### Precedence
- ()
- ~ -
- * / %
- + -
- << >>
- &
- ^
- |
### Tricks
- `wrapped` multiply `u8x4` using `u32`
``` rust
let v = u32::from_le_bytes(rgba) as u64;
let s = ((v & 0xFF00_FF00) << 32) | (v & 0x00FF_00FF);
let h = (s.wrapping_mul(0x0300_0700_0005_000B_u64) >> 56) as u8
// v = aa_bb_gg_rr
// s = aa_00_gg_00 << 32 | 00_bb_00_rr =
//   = aa_00_gg_00_00_bb_00_rr
//   = rr + (bb << 16) + (gg << 40) + (aa << 56)
// h = (0300_0000_0000_0000 * s +
//           0700_0000_0000 * s +
//                0005_0000 * s +
//                     000B * s) >> 56 & 63 =
//   = ((3 << 56) * (rr + (bb << 16) + (gg << 40) + (aa << 56)) + 
//      (7 << 40) * (rr + (bb << 16) + (gg << 40) + (aa << 56)) +
//      (5 << 16) * (rr + (bb << 16) + (gg << 40) + (aa << 56)) +
//       11       * (rr + (bb << 16) + (gg << 40) + (aa << 56))) >> 56 =
//                          multiply element-wise
//   = ((3rr << 56 + (3bb << 72) + (3gg << 96) + (3aa << 112)) + 
//      (7rr << 40 + (7bb << 56) + (7gg << 80) + (7aa << 96)) +
//      (5rr << 16 + (5bb << 16) + (5gg << 56) + (5aa << 72)) +
//      (11rr + (11bb << 16) + (11gg << 40) + (11aa << 56))) >> 56 =
//                          eliminate overflows
//   = (3rr << 56 + 
//     (7rr << 40 + (7bb << 56)) +
//     (5rr << 16 + (5bb << 16) + (5gg << 56)) +
//     (11rr + (11bb << 16) + (11gg << 40) + (11aa << 56))) >> 56 =
//                               bitshift
//   = 3rr + 
//    (7rr >> 16 + 7bb) +
//    (5rr >> 40 + (5bb >> 40) + 5gg) +
//    (11rr >> 56 + (11bb >> 40) + (11gg >> 16) + 11aa) =
//                          eliminate underflows
//   = 3rr + 7bb + 5gg + 11aa
```

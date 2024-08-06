Used for simplifying [[Boolean Algebra]] by hand
### How It Works
- Input $n$ length bitfield **A** and **B** (or $2n$ **A** split in 2)
> [!example] For 4 bit multiplication **A** is 1st 4 bit number **B** is 2nd
- layout A/B bits as cols/rows in a table
- Sort cols/rows such that only 1 bit changes between neighbors using [[Gray Code]]
- Fill output cells using inputs A/B
> [!example] For `1^0=1` so cell at $A=1,B=0$ would be $1$
- Join adjacent 1s `called minterms` using a power of 2 width/length rectangle
> [!note] You can go over edges
- Bits that stay constant across rectangle are **AND**ed
- Do that for all rectangles and join them with **OR**
- Final output is output of the **ORs**
> [!example] ![[Karnaugh Map.webp]]
> Here in 1st rectangle $C$ and $A'$ are constant, in 2nd $B$ and $A$
> So final output is $A'C+AB$

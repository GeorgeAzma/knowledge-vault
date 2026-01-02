### [[Skeletal Structure]]
### ASCII
- **Molecular formula** `C2H6O`
- **Condensed structural** `CH3CH2OH` shows groups, but omits [[Bond]][[s]]
- **ASCII bond art** `H-C=C-H`
    - **Placeholders**
        - `R` any generic organic group
        - `R', R", R'''` different organic groups
        - `X` electronegative atom or functional group `F, Cl, Br, I`
        - `Y,Z` other substituents/functional groups/atoms; used when multiple different groups are present
        - `Ar` [[Aromatic Ring]]
- **SMILES** `Simplified Molecular Input Line Entry System` computer readable. `CCO` (ethanol), `c1ccccc1` (benzene)
- **InChI** `IUPAC International Chemical Identifier` `InChI=1S/C2H6O/c1-2-3/h3H,2H2,1H3`
- **SMARTS** like SMILES but for substructure pattern matching. `[CX4][OH]` alcohol group
### File Formats
- **XYZ** atom list with 3D coords `C 0.000 0.000 0.000`
- **PDB / CIF** crystallographic protein structures `ATOM 1 C ALA A 1 0.000 0.000 0.000`
- **MOL / SDF** Chemical file formats for software (RDKit, Avogadro, etc.). contains atom block + bond block
scientific naming scheme for chemical compounds
used along with common names 
`prefixes + infix + root word + suffixes`
# Organic Naming

| Priority |    Fn Group     |     Prefix     |  Suffix  |    Pattern     |           Note           |
| :------: | :-------------: | :------------: | :------: | :------------: | :----------------------: |
|    1     | carboxylic acid |    carboxy     | oic acid |  `R-C(=O)OH`   |                          |
|    2     |      ester      | alkoxycarbonyl |   oate   | `R-C(=O)-O-R'` |                          |
|    3     |      amide      |     amido      |  amide   | `R-C(=O)-NH2`  |                          |
|    4     |     nitrile     |    nitrile     |  cyano   |    `R-C≡N`     |                          |
|    5     |    aldehyde     |    formyle     |    al    |   `R-C(=O)H`   |                          |
|    6     |     ketone      |      oxo       |   one    |  `R-C(=O)-R'`  |                          |
|    7     |     alcohol     |    hydroxy     |    ol    |     `R-OH`     |                          |
|    8     |      amine      |     amino      |  amine   |    `R-NH2`     |                          |
|    9     |     alkene      |                |   ene    |   `R-C=C-R'`   |                          |
|    10    |     alkyne      |                |   yne    |   `R-C≡C-R'`   |                          |
|    11    |   [[alkane]]    |                |   ane    |   `R-CH2-R'`   | default functional group |
|    12    |    [[alkyl]]    |                |    yl    | `R–(CH2)ₙ–CH3` |        [[alkyl]]         |
|    12    |     fluoro      |     fluoro     |          |     `R-F`      |       [[halogen]]        |
|    12    |     chloro      |     chloro     |          |     `R-C`      |       [[halogen]]        |
|    12    |      bromo      |     bromo      |          |     `R-B`      |       [[halogen]]        |
|    12    |      iodo       |      iodo      |          |     `R-I`      |                          |

| Prefixes | Carbons |
| -------- | ------- |
| meth     | 1       |
| eth      | 2       |
| prop     | 3       |
| but      | 4       |
| pent     | 5       |
| hex      | 6       |
| hept     | 7       |
| oct      | 8       |
| non      | 9       |
| dec      | 10      |
1. find longest carbon chain
- if tied, one with most substituents
2. `prefix = prefixes[carbon_count]`
3. add `bonds[max_C_to_C_bonds] suffix`
4. `suffix = highest priority functional group`

``` python
# suffix used when it's main group (highest priority functional group)
# > Example: [CH3-CH2-OH -> ethanol]
# * "eth-" C-C (2 carbon chain)
# * "-an-" C-C (single bonds)
# * "-ol " -OH (alcohol)

# prefix used when it's not main group 
# meaning it's substituent or not the highest priority functional group
# > Example: OH
#            |
#        CH3-C-COOH
# * "2-hydroxy-" OH- (OH attached to 2nd carbon on main chain)
#                    (from left or right, whichever's smaller)
#                    (OH isn't on main group/chain, since
#                     COOH fn group exists (carboxylic acid)
#                     which has higher priority)
# * "prop-     " C-C-C (3 carbon chain)
# * "-an-      " C-C   (single bonds)
# * "-oic acid " -COOH (carboxilic acid is main group 
#                       because it has highest priority)

```
# Inorganic Naming
``` python
numerical_prefix = {
     1: "mono",  # rarely used in first element
     2: "di",
     3: "tri",
     4: "tetra",
     5: "penta",
     6: "hexa",
     7: "hepta",
     8: "octa",
     9: "nona",
    10: "deca"
}

# Oxidation state (Roman numerals)
# Example: FeCl2 → iron(II) chloride
oxidation_state = {
    "+1": "I",
    "+2": "II",
    "+3": "III",
    "+4": "IV",
    "+5": "V",
    "+6": "VI",
    "+7": "VII"
}

# Common anions (binary)
binary_anions = {
     "H": "hydride",
     "F": "fluoride",
    "Cl": "chloride",
    "Br": "bromide",
     "I": "iodide",
     "O": "oxide",
     "S": "sulfide",
     "N": "nitride",
     "P": "phosphide",
     "C": "carbide"
}

# Common polyatomic ions
polyatomic_ions = {
     "OH": "hydroxide",
     "CN": "cyanide",
    "NO3": "nitrate",
    "NO2": "nitrite",
    "SO4": "sulfate",
    "SO3": "sulfite",
    "CO3": "carbonate",
    "PO4": "phosphate",
    "NH4": "ammonium",
}

# Hydrates
# Example: CuSO4·5H2O → copper(II) sulfate pentahydrate
hydrate_suffix = "hydrate"

# Ligands (alphabetical order in naming, anionic ligands end with -o)
ligands = {
    "H2O": "aqua",
    "NH3": "ammine",
    "CO": "carbonyl",
    "NO": "nitrosyl",
    "OH-": "hydroxo",
    "CN-": "cyano",
    "Cl-": "chloro",
    "Br-": "bromo",
    "I-": "iodo",
    "O2-": "oxo",
    "SO4^2-": "sulfato",
    "NO2-": "nitrito"
}

# Coordination complex naming:
# [ligands][metal(oxidation)][anion/cation]
# Example: [Cu(NH3)4]SO4 → tetraamminecopper(II) sulfate

# Binary ionic compound
# [metal] [nonmetal-ide]
# NaCl -> sodium chloride

# Binary covalent (nonmetals)
# [prefix+first element] [prefix+second element-ide]
# CO2 -> carbon dioxide

# Polyatomic ionic
# [cation] [polyatomic anion]
# CaCO3 -> calcium carbonate

# Acids (aqueous binary)
# hydro + [anion stem] + ic acid
# HCl(aq) -> hydrochloric acid

# Oxoacids
# ate → ic acid, ite → ous acid
# H2SO4 -> sulfuric acid
# H2SO3 -> sulfurous acid
```
### Rules
- `TODO:` https://en.wikipedia.org/wiki/IUPAC_nomenclature_of_chemistry
- **additive** when `1+` atom is added to existing structure `hydro+carbon`
- **subtractive** when `1+` atom is removed to existing structure `dehydro+carbon`
- **remove double vowels** when followed by a vowel in heterocyclic names `tetrazole`
- **remove double vowels** for multiplicative prefixes `pentaoxyde → pentoxyde`
### Typography
- **lowercase = common elements** `unless in title, or beginning`
- **trademarked = capital + ® or ™** `Tylenol®, Aspirin™`

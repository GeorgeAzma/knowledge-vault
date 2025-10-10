scientific naming scheme for chemical compounds
used along with common names 
`prefixes + infix + root word + suffixes`
### Naming
``` python
prefixes = {
    1:"meth",
    2:"eth", 
    3:"prop",
    4:"but", 
    5:"pent",
    6:"hex", 
    7:"hept",
    8:"oct",
    9:"non",
    10:"dec"
}

# suffix used when it's main group (highest priority functional group)
# example: [CH3-CH2-OH -> ethanol]
# * "eth-" C-C (2 carbon chain)
# * "-an-" C-C (single bonds)
# * "-ol " -OH (alcohol)

# prefix used when it's not main group 
# meaning it's substituent or not the highest priority functional group
# example: OH
#          |
#      CH3-C-COOH
# * "2-hydroxy-" OH- (OH attached to 2nd carbon on main chain)
#                    (from left or right, whichever's smaller)
#                    (OH isn't on main group/chain, since
#                     COOH fn group exists (carboxylic acid)
#                     which has higher priority)
# * "prop-     " C-C-C (3 carbon chain)
# * "-an-      " C-C   (single bonds)
# * "-oic acid " -COOH (carboxilic acid is main group 
#                       because it has highest priority)

functional_groups = {
    "carboxylic_acid": {
        "suffix": "oic acid",
        "prefix": "carboxy",
        "priority": 1,
        "pattern": ["COOH"]
    },
    "ester": {
        "suffix": "oate",
        "prefix": "alkoxycarbonyl",
        "priority": 2,
        "pattern": ["COOR"]
    },
    "amide": {
        "suffix": "amide",
        "prefix": "amido",
        "priority": 3,
        "pattern": ["CONH2"]
    },
    "nitrile": {
        "suffix": "nitrile",
        "prefix": "cyano",
        "priority": 4,
        "pattern": ["C≡N"]
    },
    "aldehyde": {
        "suffix": "al",
        "prefix": "formyl",
        "priority": 5,
        "pattern": ["CHO"]
    },
    "ketone": {
        "suffix": "one",
        "prefix": "oxo",
        "priority": 6,
        "pattern": ["C=O"]
    },
    "alcohol": {
        "suffix": "ol",
        "prefix": "hydroxy",
        "priority": 7,
        "pattern": ["OH"]
    },
    "amine": {
        "suffix": "amine",
        "prefix": "amino",
        "priority": 8,
        "pattern": ["NH2"]
    },
    "alkene": {
        "suffix": "ene",
        "prefix": None,
        "priority": 9,
        "pattern": ["C=C"]
    },
    "alkyne": {
        "suffix": "yne",
        "prefix": None,
        "priority": 10,
        "pattern": ["C≡C"]
    },
    "alkane": {
        "suffix": "ane",
        "prefix": None,
        "priority": 11,
        "pattern": []  # default if no other functional group
    },
    # Common substituents (always prefixes)
    "methyl": {"suffix": None, "prefix": "methyl", "priority": 12},
    "ethyl": {"suffix": None, "prefix": "ethyl", "priority": 12},
    "propyl": {"suffix": None, "prefix": "propyl", "priority": 12},
    "fluoro": {"suffix": None, "prefix": "fluoro", "priority": 12},
    "chloro": {"suffix": None, "prefix": "chloro", "priority": 12},
    "bromo": {"suffix": None, "prefix": "bromo", "priority": 12},
    "iodo": {"suffix": None, "prefix": "iodo", "priority": 12},
    "hydroxy": {"suffix": None, "prefix": "hydroxy", "priority": 12},
    "oxo": {"suffix": None, "prefix": "oxo", "priority": 12},
    "amino": {"suffix": None, "prefix": "amino", "priority": 12},
}

bonds = {1:"ane",2:"ene",3:"yne"}

def iupac_name():
    if functional_groups:
    else if 

# 1. find longest carbon chain
# 1.1 if tied, one with most substituents
# 2. prefix = prefixes[carbon_count]
# 3. add bonds[max_carbon2carbon_bonds] suffix
# 4. suffix = highest priority functional group
# 5. 
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
### Polymer Categories

|       Class       |     Type      | Structure Pattern                | Monomer <br>Example                    | Description                     | Common<br>Examples  | Code |
| :---------------: | :-----------: | :------------------------------- | :------------------------------------- | :------------------------------ | :------------------ | ---- |
|      **PE**       |  polyolefin   | `[-CH2-CH2-]n`                   | ethene                                 | saturated hydrocarbon chain     | LDPE, HDPE          | 7    |
|      **PP**       |  polyolefin   | `[-CH(CH3)-CH2-]n`               | propene                                | methyl-substituted polyethylene | PP rigid containers | 5    |
|      **PVC**      |  halogenated  | `[-CH2-CH(Cl)-]n`                | vinyl chloride                         | chloro-substituted polyethylene | pipes, cards        | 3    |
|      **PS**       |   aromatic    | `[-CH2-CH(Ph)-]n`                | styrene                                | phenyl-substituted              | foam, cups          | 6    |
|      **PET**      |   polyester   | `[-O-CH2-CH2-O-CO-Ph-CO-]n`      | ethylene glycol +<br>terephthalic acid | condensation polymer            | bottles, fibers     | 1    |
|      **PC**       | polycarbonate | `[-O-Ph-C(CH3)2-Ph-O-CO-]n`      | bisphenol-A +<br>phosgene              | carbonate ester linkages        | lenses, housings    | 7    |
| **PA**<br>`Nylon` |   polyamide   | `[-NH-(CH2)x-NH-CO-(CH2)y-CO-]n` | diamine + diacid                       | amide linkages                  | textiles, gears     | 7    |
|      **PU**       | polyurethane  | `[-O-CO-NH-]n`                   | polyol + diisocyanate                  | urethane linkages               | foams, elastomers   | 7    |
|     **PMMA**      |    acrylic    | `[-CH2-C(CH3)(COOCH3)-]n`        | methyl methacrylate                    | ester of methacrylic acid       | acrylic glass       | 7    |
|      **POM**      |  polyacetal   | `[-CH2-O-]n`                     | formaldehyde                           | oxymethylene repeat             | mechanical parts    | 7    |
|     **PTFE**      | fluoropolymer | `[-CF2-CF2-]n`                   | tetrafluoroethene                      | fully fluorinated carbon        | Teflon              | 7    |
### Monomer Naming Patterns

|     Monomer Class     | Pattern                          | Examples                      | Notes                                  |
| :-------------------: | :------------------------------- | :---------------------------- | :------------------------------------- |
|       **Vinyl**       | `CH2=CH-R`                       | vinyl chloride, vinyl acetate | forms vinyl polymers `PVC, PVA`        |
|      **Acrylic**      | `CH2=CH-COOR`                    | MMA → PMMA                    | side-chain ester controls rigidity     |
|      **Olefin**       | `CH2=CHR`                        | ethene, propene               | saturated polymers; high crystallinity |
|       **Diene**       | `CH2=CH-CH=CH2`                  | butadiene                     | elastomers `SBR, NBR`                  |
| **Condensation Pair** | diol + diacid / diamine + diacid | PET, Nylon                    | step-growth polymerization             |
#### Rule  
monomer name → add prefix **poly-** → describe repeat unit  
- ethene → **poly**ethylene  
- styrene → **poly**styrene  
- methyl methacrylate → **poly**(methyl methacrylate)

Use parentheses when monomer name is >1 word.
### Structural Features

| Feature     |               Symbol               | Meaning         | Effect                                |
| :---------- | :--------------------------------: | :-------------- | :------------------------------------ |
| branching   |        side CH₃/CH₂ groups         | irregularity    | ↓ density, ↑ flexibility              |
| tacticity   | isotactic / syndiotactic / atactic | stereochemistry | controls crystallinity                |
| crosslinks  |          `-C-C-` bridges           | permanent bonds | thermoset behavior                    |
| aromaticity |            phenyl rings            | rigidity        | ↑ Tg, brittleness                     |
| halogens    |               Cl, F                | polarity        | flame resistance, chemical resistance |

### Thermoplastic vs Thermoset

| Type | Description | Examples | Behavior |
| :--: | :---------- | :------- | :-------- |
| **Thermoplastic** | melts + reprocess | PE, PP, PET, PA | linear or lightly branched |
| **Thermoset** | cures + permanent | epoxy, phenolic, PU (crosslinked) | network polymers that do not melt |

### Additives (Modify Properties)

| Category | Example | Purpose |
| :------ | :------ | :------- |
| plasticizers | phthalates | soften PVC |
| stabilizers | UV absorbers | prevent photo-degradation |
| flame retardants | brominated, phosphorus | slow combustion |
| fillers | talc, glass fibers | strength, stiffness |
| pigments | TiO₂, carbon black | color, UV protection |

# Naming Rules (Polymer Specific)

### 1. **Use polymer class names**
- polyolefin, polyester, polyamide, etc.

### 2. **Use repeat-unit naming**
IUPAC: name the smallest repeating structure in brackets  
`poly[oxy(1,2-ethanediyl)]` = polyethylene oxide

### 3. **Use “poly-” + monomer**
Simplest common name.  
`poly(vinyl chloride)` not **polyvinyl chloride**

### 4. **Side groups listed before main chain**
`poly(1-chloroethylene)` = PVC

### 5. **Copolymers**
| Type | Pattern | Example |
|------|---------|---------|
| random | poly(A-co-B) | SBR: styrene-butadiene |
| block | poly(A-b-B) | SBS block rubber |
| graft | poly(A-g-B) | impact-modified PS |

# Example Walkthroughs

### Identify polymer from monomer

``` python
monomer = "CH2=CHCl"  # vinyl chloride
polymer = "poly(vinyl chloride)"  # PVC
repeat_unit = "[-CH2-CH(Cl)-]n"

monomer_1 = "ethylene glycol"        # HO-CH2-CH2-OH
monomer_2 = "terephthalic acid"      # HOOC-Ph-COOH

polymer = "poly(ethylene terephthalate)"
repeat_unit = "[-O-CH2-CH2-O-CO-Ph-CO-]n"
class_type = "polyester"
```
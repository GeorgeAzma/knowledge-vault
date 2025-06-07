### Logic Gates
- `AND, OR, XOR`
- `NOT, NAND, NOR, XNOR`
- `IMPLIES` if `A` then `B` (`!A | B`)
- `NIMPLIES` if `A` then `!B` (`A & !B`)
- `MAJ` `1` if majority inputs are `1`
### Components
- `MUX` multiplexer, selects inputs via input index
- `DMUX` demultiplexer, sets output at input index to `1`
##### Flip-Flop
changes only when clock ticks `rising/falling edge of clock signal`
- `D Flip-Flop` stores input `D` when clocked
- `T Flip-Flop` toggles output if `T=1` when clocked
- `JK Flip-Flop` like `SR` but `J=1,K=1` toggles output when clocked
### Latch
changes only when enable pin is active
- `D Latch` stores input `D` when enabled
- `SR Latch` set-reset latch when enabled `only S or R can be on`

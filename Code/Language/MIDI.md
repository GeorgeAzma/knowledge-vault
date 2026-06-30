https://midi.org/summary-of-midi-1-0-messages
``` rust
// midi message
message: &[u8]

let status = message[0]; // always 1xxxxxxx, so ignore 1st bit
let data = &message[1..]; // always 0xxxxxxx, so ignore 1st bit

let kind = (status & 0b0111_0000) >> 4;
let channel = status & 0b0000_1111; // 0-15 channels

match kind {
    0b000 /* note off */ | 0b001 /* note on */ => {
        let state = kind & 0b001; // off/on
        let note = data[0]; // midi note
        let velocity = data[1]; // 0-127
    },
    0b010 /* polyphonic aftertouch */ => {
        // pressure for each key while pressing it
        // useful for wind instruments, violin...
        for [note, pressure] in data.iter().array_chunks::<2>() {
            let note = data[0]; // midi note
            let pressure = data[1]; // 0-127
        }
    },
    0b011 /* control change */ => {
        let con = data[0]; // controller number (id for midi input)
        match con {
            0 /* pitch bend */ => {},
            1 /* modulation */ => {},
            7 /* volume */ => {},
            10 /* pan */ => {},
            64 /* sustain pedal */ => {},
            _ => {},
        }
        let val = data[1]; // 0-127
    },
    0b100 /* program change */ => { // unused nowadays
        let program = data[0]; // 0-127, instruments/fx
    },
    0b101 /* channel aftertouch */ => {
        // pressure for highest pressure key while pressing it
        // useful for wind instruments, violin...
        let pressure = data[0]; // 0-127
    },
    0b110 /* pitch bend change */ => {
        let val = (data[0] as u16 | (data[1] as u16) << 7) as i16 - 8192; // [-8192; 8191]
    },
    0b111 /* system message */ => {},
    _ => {},
}
```

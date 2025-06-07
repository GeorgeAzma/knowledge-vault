---
aliases:
    - Verilog
    - VHD
---
# Verilog
### Examples
``` verilog
- reg [7:0] a = 8'b10101010;  // 8-bit register
- wire y; // has no state, only output like XOR gate
- input x // module input, can't assign vals in module, defaults to wire
- assign y = a[0] ^ a[1];
- forever #10 clk = ~clk; // toggle clock every 10 time units (reg clk = 0;)
- initial // execs at time=0 or after delay, useful for testbenches, not synthed
- begin /* block */ end
- parameter WIDTH = 4;         // compile-time constant
- always @(a or b) $display("a/b val changed: %b/%b", a, b);  // event-driven always block
- always @(posedge clk) // update when clock is turning on
- always @(negedge clk) // update when clock is turning off
- always @(*) // anything changed
- module // reusable hardware component
- $finish // stop simulating
- `define MSG "hello verilog" // macro
- if (a[0]) $display("LSB is 1");
- for (int i = 0; i < WIDTH; i = i + 1) $display("bit %d: %b", i, a[i]);
- cnt = cnt + 1 // cnt updated immediately (blocks next statements)
- cnt <= cnt + 1 // cnt updated async (like on clock updates can happen async)
- integer cnt = 1;
- real f = 3.1415;
- function automatic // fn with auto recreated local vars for each call
- logic // system verilog exclusive, replaces wire/reg, more powerful

function automatic [3:0] add(input [3:0] x, input [3:0] y);
    add = x + y;
endfunction
initial $display("Sum: %d", add(3, 5));  // Call function

// Generate Blocks
generate
    if (WIDTH == 4) begin
        initial $display("4-bit mode enabled");
    end else begin
        initial $display("4-bit mode disabled");
    end
endgenerate
```
### Testbench Example
``` verilog
module xor_gate(input a, b, output y);
    assign y = a ^ b;
endmodule

module tb_xor;
    reg a, b;
    wire y;

    // instantiate XOR gate
    xor_gate xrg (.a(a), .b(b), .y(y));

    initial begin
        $monitor("time=%0t a=%b b=%b y=%b", $time, a, b, y);
        // test cases
        a = 0; b = 0; #10;
        a = 0; b = 1; #10;
        a = 1; b = 0; #10;
        a = 1; b = 1; #10;
        $stop;
    end
endmodule
```
### Compiling
``` bash
vlog MyTopVerilog.sv
# simulate
vsim work.MyTopVerilog
```
## Code Types
### 1. Structural `Gate-Level Modeling`
``` verilog
module full_adder (input a, input b, input cin, output sum, output cout);
  wire w1, w2, w3;
  
  xor (w1, a, b);
  xor (sum, w1, cin);
  and (w2, w1, cin);
  and (w3, a, b);
  or (cout, w2, w3);
endmodule
```
### 2. Dataflow
``` verilog
module full_adder (input a, input b, input cin, output sum, output cout);
  assign sum  = a ^ b ^ cin;
  assign cout = (a & b) | (b & cin) | (a & cin);
endmodule
```
### 3. Behavioural
``` verilog
module d_ff (input clk, input d, output reg q);
  always @(posedge clk) // async
    q <= d;
endmodule
```

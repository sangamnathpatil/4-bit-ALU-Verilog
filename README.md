# 4-Bit ALU Using Verilog HDL

A simple 4-bit Arithmetic Logic Unit (ALU) designed and verified using Verilog HDL.

## Overview

This project implements a 4-bit ALU that performs arithmetic, logical, and shift operations based on a 3-bit select input.

The design includes:

* 4-bit inputs `A` and `B`
* 3-bit operation select `S`
* 4-bit output `Y`
* Carry flag
* Borrow flag
* Zero flag
* Verilog testbench for functional verification
* VCD waveform generation for simulation analysis

## ALU Operations

| S   | Operation   | Description |
| --- | ----------- | ----------- |
| 000 | ADD         | A + B       |
| 001 | SUB         | A - B       |
| 010 | AND         | A & B       |
| 011 | OR          | A | B       |
| 100 | XOR         | A ^ B       |
| 101 | XNOR        | ~(A ^ B)    |
| 110 | LEFT SHIFT  | A << 1      |
| 111 | RIGHT SHIFT | A >> 1      |

## Flags

### Carry

The `carry` output indicates a carry generated during addition.

### Borrow

The `borrow` output is set when `A < B` during subtraction.

### Zero

The `zero` flag is set when the ALU output is:

```text
Y = 0000
```

## Project Structure

```text
alu-4bit-verilog/
│
├── rtl/
│   └── alu_4bit.v
│
├── tb/
│   └── alu_4bit_tb.v
│
└── waveform/
    └── waveform.png
```

## Simulation

The design can be simulated using Icarus Verilog and GTKWave.

### Compile

```bash
iverilog -o alu_sim rtl/alu_4bit.v tb/alu_4bit_tb.v
```

### Run

```bash
vvp alu_sim
```

### View waveform

```bash
gtkwave alu_4bit.vcd
```

## Verification

The testbench verifies:

* Normal addition
* Addition with carry
* Normal subtraction
* Subtraction with borrow
* Zero result
* AND operation
* OR operation
* XOR operation
* XNOR operation
* Left shift
* Right shift

## Tools Used

* Verilog HDL
* Icarus Verilog
* GTKWave
* Git
* GitHub

## Learning Outcomes

Through this project, I practiced:

* Combinational logic design
* Verilog `always @(*)` blocks
* `case` statements
* Arithmetic operations and flags
* Testbench development
* Simulation and waveform analysis
* Basic RTL project organization


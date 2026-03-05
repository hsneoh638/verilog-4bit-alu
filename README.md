# Verilog 4-bit ALU

A simple 4-bit ALU written in Verilog with testbench simulation using Icarus Verilog + GTKWave.

## Features
- 3-bit opcode control
- Operations: ADD, SUB, AND, OR, XOR, NOT(A), Shift Left, Shift Right
- Output flags: carry, zero

## Project Structure
- `src/alu.v` : ALU RTL
- `tb/alu_tb.v` : Testbench
- `docs/waveform.png` : Simulation waveform screenshot

## Simulation (Windows / PowerShell)
From repo root:

```powershell
iverilog -o alu_tb src/alu.v tb/alu_tb.v
mkdir sim
vvp alu_tb
gtkwave sim/alu.vcd

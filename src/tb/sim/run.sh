#!/usr/bin/env bash
set -e

mkdir -p sim
iverilog -g2012 -o sim/alu_tb src/alu.v tb/alu_tb.v
vvp sim/alu_tb
echo "Waveform generated: sim/alu.vcd"

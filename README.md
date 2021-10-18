# Randsack - True Random Number Generator(s)

[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)

## Overview

Randsack is a test chip for trying out random number generators and PUFs.

### IP Blocks

- `dtop` - Digital top sea of gates containing control logic and digital peripherals.
- `dgpio` - GPIO peripheral.
- `collapsering_macro` - Trimmable collapsing ring oscillators for generating random numbers with a configurable output divider.  See `ip/randsack/sch/collapsering.sch` xschem schematic for design.
- `ringosc_macro` - Trimmable ring oscillator.

### TODO

- GPIO peripheral for easier IO from the CPU.
- Serializer block to output high rate data.
- PWM block for generating audio.
- LFSR block to take a seed value from the TRNG and generate high rate data.
- SHA block.

## Methodology, Implementation, and SPICE simulation

The more analog-like blocks like the ring oscillators are designed using stdcells in xschem and then simulated with ngspice.

Due to limited time all blocks are synthesized using the standard openlane flow instead of hand layout.  The resulting netlist is inspected to ensure minimal modifications by the tools.  The resulting extracted spice file is then simulated.

Unfortunately the process to do backannotated timing sims (SDF) doesn't appear simple.  Hope is the small macros are small and that any delays are tiny and don't cause issues.

All simulations are performed at tt/ff/ss corners to ensure reasonable performance across PVT.

A bunch of knobs are built into the design to minimize risk.  All blocks feature many trim bits and output dividers in case performance ends up being too fast for the synthesized digital control blocks.

## Test Busses

The output of the oscillator blocks can be muxed to output GPIOs for debug.  GPIOs are limited to ~60 MHz so the internal clock dividers should be used.

## References

- Sample project [README](docs/source/index.rst) containing instructions on how to setup the chip environment.

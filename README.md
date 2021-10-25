# Randsack - True Random Number Generator(s)

[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)

## Overview

Randsack is a test chip for trying out random number generators and PUFs.

### IP Blocks and Instances

- `digitalcore_macro` - Digital top sea of gates containing control logic and digital peripherals.
    - `gpio0` - Wishbone 32-bit GPIO peripheral
    - `uart0` - Wishbone UART peripheral
    - `ring0` - Ring oscillator controller for collapsing ring.
    - `ring1` - Ring oscillator controller for free running ring oscillator.
- `collapsering_macro` - Trimmable collapsing ring oscillators for generating random numbers with a configurable output divider.  See `ip/randsack/sch/collapsering.sch` xschem schematic for design.
- `ringosc_macro` - Trimmable ring oscillator.

All custom IP blocks are in located in the `ip/randsack/` directory.  Third party IP is in the `ip/third_party/` directory.

### TODO

- Serializer block to output high rate data.
- PWM block for generating audio.
- LFSR block to take a seed value from the TRNG and generate high rate data.
- SHA block.

## Methodology, Implementation, and SPICE simulation

The more analog-like blocks like the ring oscillators are designed using stdcells in xschem and simulated with ngspice.

Due to limited time all blocks are synthesized using the standard openlane flow instead of hand layout.  The resulting netlist is inspected to ensure minimal modifications by the tools.  The resulting extracted spice file is then simulated.

Unfortunately the process to do backannotated timing sims (SDF) doesn't appear simple.  Hope is the small macros are small and that any delays are tiny and don't cause issues.

All simulations are performed at tt/ff/ss corners to ensure reasonable performance across PVT.

A bunch of knobs are built into the design to minimize risk.  All blocks feature many trim bits and output dividers in case performance ends up being too fast for the synthesized digital control blocks.

## Test Busses

The output of the oscillator blocks can be muxed to output GPIOs for debug.  GPIOs are limited to ~60 MHz so the internal clock dividers should be used.

## Hardening Macros

Use the `mpw-3` tag in the https://github.com/efabless/OpenLane.git repo.  As of this time the Docker Hub repo is missing the `mpw-3` tag so manually set the openlane tag to `master` which currently points to the same commit.  See `envsetup` for required environment vars.

All the `*_macro` blocks need to be hardened first before finally hardening the `user_project_wrapper` macro.

## DV

See the `verilog/dv/randsack*` directories for RTL/GL testbenches.

## References

- Sample project [README](docs/source/index.rst) containing instructions on how to setup the chip environment.

// AUTO GENERATED - DO NOT MODIFY THIS FILE
//
// icgen generated file
// input:        /home/harrison/workspace/randsack_b1/verilog/dv/randsack_netlists.vp
// input sha256: 69bfeb9ab416b17a3aa71032524b1346d84ac593ce7bc4c85622ac033583cfb8
// output:       /home/harrison/workspace/randsack_b1/verilog/dv/randsack_netlists.v
// ran at:       2022-01-01T21:01:53-08:00
// icgen ver:    19e3b7c
//
// AUTO GENERATED - DO NOT MODIFY THIS FILE

// SPDX-FileCopyrightText: 2020 Efabless Corporation
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
// SPDX-License-Identifier: Apache-2.0


// Include caravel global defines for the number of the user project IO pads
`include "defines.v"
`define USE_POWER_PINS

`ifdef GL
    // Assume default net type to be wire because GL netlists don't have the wire definitions
    `default_nettype wire
    `include "gl/user_project_wrapper.v"
    `include "gl/digitalcore_macro.v"
    // TODO(hdpham): Add better collapsering sim model.
    `include "collapsering_macro.v"
    `include "ringosc_macro.v"
    `include "collapsering.v"
    `include "ring_osc2x13.v"
`else
    `include "user_project_wrapper.v"
    `include "digitalcore_macro.v"
    `include "collapsering_macro.v"
    `include "ringosc_macro.v"
    `include "ring_control.v"
    `include "pwm_wb.v"
    `include "picorv32_wb/gpio32_wb.v"
    `include "picorv32_wb/simpleuart_div16_wb.v"
    `include "verilog-wishbone/rtl/wb_mux_29.v"
`endif

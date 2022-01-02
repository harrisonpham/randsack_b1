// AUTO GENERATED - DO NOT MODIFY THIS FILE
//
// icgen generated file
// input:        /home/harrison/workspace/randsack_b1/verilog/rtl/user_project_wrapper.vp
// input sha256: 3eb560ab9e07f72ebeb845904cd251fda711d990a9f25341b5208aac06b3824a
// output:       /home/harrison/workspace/randsack_b1/verilog/rtl/user_project_wrapper.v
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


`default_nettype none
/*
 *-------------------------------------------------------------
 *
 * user_project_wrapper
 *
 * This wrapper enumerates all of the pins available to the
 * user for the user project.
 *
 * An example user project is provided in this wrapper.  The
 * example should be removed and replaced with the actual
 * user project.
 *
 *-------------------------------------------------------------
 */

module user_project_wrapper #(
  parameter BITS = 32
) (
`ifdef USE_POWER_PINS
  inout vdda1,  // User area 1 3.3V supply
  inout vdda2,  // User area 2 3.3V supply
  inout vssa1,  // User area 1 analog ground
  inout vssa2,  // User area 2 analog ground
  inout vccd1,  // User area 1 1.8V supply
  inout vccd2,  // User area 2 1.8v supply
  inout vssd1,  // User area 1 digital ground
  inout vssd2,  // User area 2 digital ground
`endif

  // Wishbone Slave ports (WB MI A)
  input wb_clk_i,
  input wb_rst_i,
  input wbs_stb_i,
  input wbs_cyc_i,
  input wbs_we_i,
  input [3:0] wbs_sel_i,
  input [31:0] wbs_dat_i,
  input [31:0] wbs_adr_i,
  output wbs_ack_o,
  output [31:0] wbs_dat_o,

  // Logic Analyzer Signals
  input  [127:0] la_data_in,
  output [127:0] la_data_out,
  input  [127:0] la_oenb,

  // IOs
  input  [`MPRJ_IO_PADS-1:0] io_in,
  output [`MPRJ_IO_PADS-1:0] io_out,
  output [`MPRJ_IO_PADS-1:0] io_oeb,

  // Analog (direct connection to GPIO pad---use with caution)
  // Note that analog I/O is not available on the 7 lowest-numbered
  // GPIO pads, and so the analog_io indexing is offset from the
  // GPIO indexing by 7 (also upper 2 GPIOs do not have analog_io).
  inout [`MPRJ_IO_PADS-10:0] analog_io,

  // Independent clock (on independent integer divider)
  input   user_clock2,

  // User maskable interrupt signals
  output [2:0] user_irq
);

/*--------------------------------------*/
/* User project is instantiated  here   */
/*--------------------------------------*/

  wire ring0_clk;
  wire ring0_start;
  wire [27:0] ring0_trim_a;
  wire [27:0] ring0_trim_b;
  wire [2:0] ring0_clkmux;

  wire ring1_clk;
  wire ring1_start;
  wire [25:0] ring1_trim_a;
  wire [2:0] ring1_clkmux;

  wire [21:0] ring2_clk;
  wire ring2_start;
  wire [27:0] ring2_trim_a;
  wire [27:0] ring2_trim_b;
  wire [2:0] ring2_clkmux;

digitalcore_macro digitalcore (
`ifdef USE_POWER_PINS
  .vccd1(vccd1),  // User area 1 1.8V power
  .vssd1(vssd1),  // User area 1 digital ground
`endif

  .wb_clk_i(wb_clk_i),
  .wb_rst_i(wb_rst_i),

  // MGMT SoC Wishbone Slave
  .wbs_cyc_i(wbs_cyc_i),
  .wbs_stb_i(wbs_stb_i),
  .wbs_we_i(wbs_we_i),
  .wbs_sel_i(wbs_sel_i),
  .wbs_adr_i(wbs_adr_i),
  .wbs_dat_i(wbs_dat_i),
  .wbs_ack_o(wbs_ack_o),
  .wbs_dat_o(wbs_dat_o),

  // Logic Analyzer
  .la_data_in(la_data_in),
  .la_data_out(la_data_out),
  .la_oenb (la_oenb),

  // IO Pads
  .io_in (io_in),
  .io_out(io_out),
  .io_oeb(io_oeb),

  // IRQ
  .irq(user_irq),

  // ring0 collapsering macro
  .ring0_clk(ring0_clk),
  .ring0_start(ring0_start),
  .ring0_trim_a(ring0_trim_a),
  .ring0_trim_b(ring0_trim_b),
  .ring0_clkmux(ring0_clkmux),

  // ring1 ringosc macro
  .ring1_clk(ring1_clk),
  .ring1_start(ring1_start),
  .ring1_trim_a(ring1_trim_a),
  .ring1_clkmux(ring1_clkmux),

  // ring2 (controls 2-9)
      .ring2_clk(ring2_clk[0]),
      .ring3_clk(ring2_clk[1]),
      .ring4_clk(ring2_clk[2]),
      .ring5_clk(ring2_clk[3]),
      .ring6_clk(ring2_clk[4]),
      .ring7_clk(ring2_clk[5]),
      .ring8_clk(ring2_clk[6]),
      .ring9_clk(ring2_clk[7]),
      .ring10_clk(ring2_clk[8]),
      .ring11_clk(ring2_clk[9]),
      .ring12_clk(ring2_clk[10]),
      .ring13_clk(ring2_clk[11]),
      .ring14_clk(ring2_clk[12]),
      .ring15_clk(ring2_clk[13]),
      .ring16_clk(ring2_clk[14]),
      .ring17_clk(ring2_clk[15]),
      .ring18_clk(ring2_clk[16]),
      .ring19_clk(ring2_clk[17]),
      .ring20_clk(ring2_clk[18]),
      .ring21_clk(ring2_clk[19]),
      .ring22_clk(ring2_clk[20]),
    .ring2_start(ring2_start),
  .ring2_trim_a(ring2_trim_a),
  .ring2_trim_b(ring2_trim_b),
  .ring2_clkmux(ring2_clkmux)
);

collapsering_macro ring0 (
`ifdef USE_POWER_PINS
  .vccd1(vccd1),  // User area 1 1.8V power
  .vssd1(vssd1),  // User area 1 digital ground
`endif

  .clk_out(ring0_clk),
  .start(ring0_start),
  .trim_a(ring0_trim_a),
  .trim_b(ring0_trim_b),
  .clkmux(ring0_clkmux)
);

ringosc_macro ring1 (
`ifdef USE_POWER_PINS
  .vccd1(vccd1),  // User area 1 1.8V power
  .vssd1(vssd1),  // User area 1 digital ground
`endif

  .clk_out(ring1_clk),
  .start(ring1_start),
  .trim_a(ring1_trim_a),
  .clkmux(ring1_clkmux)
);

      collapsering_macro ring2 (
    `ifdef USE_POWER_PINS
      .vccd1(vccd1),  // User area 1 1.8V power
      .vssd1(vssd1),  // User area 1 digital ground
    `endif

      .clk_out(ring2_clk[0]),
      .start(ring2_start),
      .trim_a(ring2_trim_a),
      .trim_b(ring2_trim_b),
      .clkmux(ring2_clkmux)
    );
        ringosc_macro ring3 (
    `ifdef USE_POWER_PINS
      .vccd1(vccd1),  // User area 1 1.8V power
      .vssd1(vssd1),  // User area 1 digital ground
    `endif

      .clk_out(ring2_clk[1]),
      .start(ring2_start),
      .trim_a(ring2_trim_a),
      .clkmux(ring2_clkmux)
    );
        collapsering_macro ring4 (
    `ifdef USE_POWER_PINS
      .vccd1(vccd1),  // User area 1 1.8V power
      .vssd1(vssd1),  // User area 1 digital ground
    `endif

      .clk_out(ring2_clk[2]),
      .start(ring2_start),
      .trim_a(ring2_trim_a),
      .trim_b(ring2_trim_b),
      .clkmux(ring2_clkmux)
    );
        ringosc_macro ring5 (
    `ifdef USE_POWER_PINS
      .vccd1(vccd1),  // User area 1 1.8V power
      .vssd1(vssd1),  // User area 1 digital ground
    `endif

      .clk_out(ring2_clk[3]),
      .start(ring2_start),
      .trim_a(ring2_trim_a),
      .clkmux(ring2_clkmux)
    );
        collapsering_macro ring6 (
    `ifdef USE_POWER_PINS
      .vccd1(vccd1),  // User area 1 1.8V power
      .vssd1(vssd1),  // User area 1 digital ground
    `endif

      .clk_out(ring2_clk[4]),
      .start(ring2_start),
      .trim_a(ring2_trim_a),
      .trim_b(ring2_trim_b),
      .clkmux(ring2_clkmux)
    );
        ringosc_macro ring7 (
    `ifdef USE_POWER_PINS
      .vccd1(vccd1),  // User area 1 1.8V power
      .vssd1(vssd1),  // User area 1 digital ground
    `endif

      .clk_out(ring2_clk[5]),
      .start(ring2_start),
      .trim_a(ring2_trim_a),
      .clkmux(ring2_clkmux)
    );
        collapsering_macro ring8 (
    `ifdef USE_POWER_PINS
      .vccd1(vccd1),  // User area 1 1.8V power
      .vssd1(vssd1),  // User area 1 digital ground
    `endif

      .clk_out(ring2_clk[6]),
      .start(ring2_start),
      .trim_a(ring2_trim_a),
      .trim_b(ring2_trim_b),
      .clkmux(ring2_clkmux)
    );
        ringosc_macro ring9 (
    `ifdef USE_POWER_PINS
      .vccd1(vccd1),  // User area 1 1.8V power
      .vssd1(vssd1),  // User area 1 digital ground
    `endif

      .clk_out(ring2_clk[7]),
      .start(ring2_start),
      .trim_a(ring2_trim_a),
      .clkmux(ring2_clkmux)
    );
        collapsering_macro ring10 (
    `ifdef USE_POWER_PINS
      .vccd1(vccd1),  // User area 1 1.8V power
      .vssd1(vssd1),  // User area 1 digital ground
    `endif

      .clk_out(ring2_clk[8]),
      .start(ring2_start),
      .trim_a(ring2_trim_a),
      .trim_b(ring2_trim_b),
      .clkmux(ring2_clkmux)
    );
        ringosc_macro ring11 (
    `ifdef USE_POWER_PINS
      .vccd1(vccd1),  // User area 1 1.8V power
      .vssd1(vssd1),  // User area 1 digital ground
    `endif

      .clk_out(ring2_clk[9]),
      .start(ring2_start),
      .trim_a(ring2_trim_a),
      .clkmux(ring2_clkmux)
    );
        collapsering_macro ring12 (
    `ifdef USE_POWER_PINS
      .vccd1(vccd1),  // User area 1 1.8V power
      .vssd1(vssd1),  // User area 1 digital ground
    `endif

      .clk_out(ring2_clk[10]),
      .start(ring2_start),
      .trim_a(ring2_trim_a),
      .trim_b(ring2_trim_b),
      .clkmux(ring2_clkmux)
    );
        ringosc_macro ring13 (
    `ifdef USE_POWER_PINS
      .vccd1(vccd1),  // User area 1 1.8V power
      .vssd1(vssd1),  // User area 1 digital ground
    `endif

      .clk_out(ring2_clk[11]),
      .start(ring2_start),
      .trim_a(ring2_trim_a),
      .clkmux(ring2_clkmux)
    );
        collapsering_macro ring14 (
    `ifdef USE_POWER_PINS
      .vccd1(vccd1),  // User area 1 1.8V power
      .vssd1(vssd1),  // User area 1 digital ground
    `endif

      .clk_out(ring2_clk[12]),
      .start(ring2_start),
      .trim_a(ring2_trim_a),
      .trim_b(ring2_trim_b),
      .clkmux(ring2_clkmux)
    );
        ringosc_macro ring15 (
    `ifdef USE_POWER_PINS
      .vccd1(vccd1),  // User area 1 1.8V power
      .vssd1(vssd1),  // User area 1 digital ground
    `endif

      .clk_out(ring2_clk[13]),
      .start(ring2_start),
      .trim_a(ring2_trim_a),
      .clkmux(ring2_clkmux)
    );
        collapsering_macro ring16 (
    `ifdef USE_POWER_PINS
      .vccd1(vccd1),  // User area 1 1.8V power
      .vssd1(vssd1),  // User area 1 digital ground
    `endif

      .clk_out(ring2_clk[14]),
      .start(ring2_start),
      .trim_a(ring2_trim_a),
      .trim_b(ring2_trim_b),
      .clkmux(ring2_clkmux)
    );
        ringosc_macro ring17 (
    `ifdef USE_POWER_PINS
      .vccd1(vccd1),  // User area 1 1.8V power
      .vssd1(vssd1),  // User area 1 digital ground
    `endif

      .clk_out(ring2_clk[15]),
      .start(ring2_start),
      .trim_a(ring2_trim_a),
      .clkmux(ring2_clkmux)
    );
        collapsering_macro ring18 (
    `ifdef USE_POWER_PINS
      .vccd1(vccd1),  // User area 1 1.8V power
      .vssd1(vssd1),  // User area 1 digital ground
    `endif

      .clk_out(ring2_clk[16]),
      .start(ring2_start),
      .trim_a(ring2_trim_a),
      .trim_b(ring2_trim_b),
      .clkmux(ring2_clkmux)
    );
        ringosc_macro ring19 (
    `ifdef USE_POWER_PINS
      .vccd1(vccd1),  // User area 1 1.8V power
      .vssd1(vssd1),  // User area 1 digital ground
    `endif

      .clk_out(ring2_clk[17]),
      .start(ring2_start),
      .trim_a(ring2_trim_a),
      .clkmux(ring2_clkmux)
    );
        collapsering_macro ring20 (
    `ifdef USE_POWER_PINS
      .vccd1(vccd1),  // User area 1 1.8V power
      .vssd1(vssd1),  // User area 1 digital ground
    `endif

      .clk_out(ring2_clk[18]),
      .start(ring2_start),
      .trim_a(ring2_trim_a),
      .trim_b(ring2_trim_b),
      .clkmux(ring2_clkmux)
    );
        ringosc_macro ring21 (
    `ifdef USE_POWER_PINS
      .vccd1(vccd1),  // User area 1 1.8V power
      .vssd1(vssd1),  // User area 1 digital ground
    `endif

      .clk_out(ring2_clk[19]),
      .start(ring2_start),
      .trim_a(ring2_trim_a),
      .clkmux(ring2_clkmux)
    );
        collapsering_macro ring22 (
    `ifdef USE_POWER_PINS
      .vccd1(vccd1),  // User area 1 1.8V power
      .vssd1(vssd1),  // User area 1 digital ground
    `endif

      .clk_out(ring2_clk[20]),
      .start(ring2_start),
      .trim_a(ring2_trim_a),
      .trim_b(ring2_trim_b),
      .clkmux(ring2_clkmux)
    );
  
endmodule	// user_project_wrapper

`default_nettype wire

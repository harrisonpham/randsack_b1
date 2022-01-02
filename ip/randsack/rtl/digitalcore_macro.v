// AUTO GENERATED - DO NOT MODIFY THIS FILE
//
// icgen generated file
// input:        /home/harrison/workspace/randsack_b1/ip/randsack/rtl/digitalcore_macro.vp
// input sha256: 726505653e41d53d355f9ad611424ca66f2fe21c85f8f662701250650388f696
// output:       /home/harrison/workspace/randsack_b1/ip/randsack/rtl/digitalcore_macro.v
// ran at:       2022-01-01T21:01:53-08:00
// icgen ver:    19e3b7c
//
// AUTO GENERATED - DO NOT MODIFY THIS FILE

// Randsack digital top.
//
// SPDX-FileCopyrightText: (c) 2021 Harrison Pham <harrison@harrisonpham.com>
// SPDX-License-Identifier: Apache-2.0
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


module digitalcore_macro (
`ifdef USE_POWER_PINS
  inout vccd1,
  inout vssd1,
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

  // IRQ
  output [2:0] irq,

  // ring0 collapsering macro
  input ring0_clk,
  output ring0_start,
  output [27:0] ring0_trim_a,
  output [27:0] ring0_trim_b,
  output [2:0] ring0_clkmux,

  // ring1 collapsering macro
  input ring1_clk,
  output ring1_start,
  output [25:0] ring1_trim_a,
  output [2:0] ring1_clkmux,

  // ring2-9
      input  ring2_clk,
      input  ring3_clk,
      input  ring4_clk,
      input  ring5_clk,
      input  ring6_clk,
      input  ring7_clk,
      input  ring8_clk,
      input  ring9_clk,
      input  ring10_clk,
      input  ring11_clk,
      input  ring12_clk,
      input  ring13_clk,
      input  ring14_clk,
      input  ring15_clk,
      input  ring16_clk,
      input  ring17_clk,
      input  ring18_clk,
      input  ring19_clk,
      input  ring20_clk,
      input  ring21_clk,
      input  ring22_clk,
    output ring2_start,
  output [27:0] ring2_trim_a,
  output [27:0] ring2_trim_b,
  output [2:0] ring2_clkmux
);

  // Filter wishbone accesses from Caravel.
  parameter DTOP_MASK    = 32'hff00_0000;
  parameter DTOP_ADDR    = 32'h3000_0000;

  // Peripherals.
  parameter GPIO0_ADDR_MASK   = 32'hffff_ff00;
  parameter GPIO0_BASE_ADDR   = 32'h3000_0000;
  parameter PWM0_ADDR_MASK    = 32'hffff_ff00;
  parameter PWM0_BASE_ADDR    = 32'h3000_1000;
  parameter PWM1_ADDR_MASK    = 32'hffff_ff00;
  parameter PWM1_BASE_ADDR    = 32'h3000_1100;
  parameter PWM2_ADDR_MASK    = 32'hffff_ff00;
  parameter PWM2_BASE_ADDR    = 32'h3000_1200;
  parameter PWM3_ADDR_MASK    = 32'hffff_ff00;
  parameter PWM3_BASE_ADDR    = 32'h3000_1300;
  parameter UART0_ADDR_MASK   = 32'hffff_ff00;
  parameter UART0_BASE_ADDR   = 32'h3000_2000;
  parameter RING0_ADDR_MASK   = 32'hffff_ff00;
  parameter RING0_BASE_ADDR   = 32'h3000_3000;
  parameter RING1_ADDR_MASK   = 32'hffff_ff00;
  parameter RING1_BASE_ADDR   = 32'h3000_3100;

      parameter RING2_ADDR_MASK   = 32'hffff_ff00;
    parameter RING2_BASE_ADDR   = 32'h30003200;
      parameter RING3_ADDR_MASK   = 32'hffff_ff00;
    parameter RING3_BASE_ADDR   = 32'h30003300;
      parameter RING4_ADDR_MASK   = 32'hffff_ff00;
    parameter RING4_BASE_ADDR   = 32'h30003400;
      parameter RING5_ADDR_MASK   = 32'hffff_ff00;
    parameter RING5_BASE_ADDR   = 32'h30003500;
      parameter RING6_ADDR_MASK   = 32'hffff_ff00;
    parameter RING6_BASE_ADDR   = 32'h30003600;
      parameter RING7_ADDR_MASK   = 32'hffff_ff00;
    parameter RING7_BASE_ADDR   = 32'h30003700;
      parameter RING8_ADDR_MASK   = 32'hffff_ff00;
    parameter RING8_BASE_ADDR   = 32'h30003800;
      parameter RING9_ADDR_MASK   = 32'hffff_ff00;
    parameter RING9_BASE_ADDR   = 32'h30003900;
      parameter RING10_ADDR_MASK   = 32'hffff_ff00;
    parameter RING10_BASE_ADDR   = 32'h30003a00;
      parameter RING11_ADDR_MASK   = 32'hffff_ff00;
    parameter RING11_BASE_ADDR   = 32'h30003b00;
      parameter RING12_ADDR_MASK   = 32'hffff_ff00;
    parameter RING12_BASE_ADDR   = 32'h30003c00;
      parameter RING13_ADDR_MASK   = 32'hffff_ff00;
    parameter RING13_BASE_ADDR   = 32'h30003d00;
      parameter RING14_ADDR_MASK   = 32'hffff_ff00;
    parameter RING14_BASE_ADDR   = 32'h30003e00;
      parameter RING15_ADDR_MASK   = 32'hffff_ff00;
    parameter RING15_BASE_ADDR   = 32'h30003f00;
      parameter RING16_ADDR_MASK   = 32'hffff_ff00;
    parameter RING16_BASE_ADDR   = 32'h30004000;
      parameter RING17_ADDR_MASK   = 32'hffff_ff00;
    parameter RING17_BASE_ADDR   = 32'h30004100;
      parameter RING18_ADDR_MASK   = 32'hffff_ff00;
    parameter RING18_BASE_ADDR   = 32'h30004200;
      parameter RING19_ADDR_MASK   = 32'hffff_ff00;
    parameter RING19_BASE_ADDR   = 32'h30004300;
      parameter RING20_ADDR_MASK   = 32'hffff_ff00;
    parameter RING20_BASE_ADDR   = 32'h30004400;
      parameter RING21_ADDR_MASK   = 32'hffff_ff00;
    parameter RING21_BASE_ADDR   = 32'h30004500;
      parameter RING22_ADDR_MASK   = 32'hffff_ff00;
    parameter RING22_BASE_ADDR   = 32'h30004600;
  
  // Filter addresses from Caravel since we want to be absolutely sure it is
  // selecting us before letting it access the arbiter.  This is mostly needed
  // because the wb_intercon.v implementation in Caravel doesn't corrently
  // filter the wb_cyc_i signal to slaves.
  wire wbs_addr_sel;
  assign wbs_addr_sel = (wbs_adr_i & DTOP_MASK) == DTOP_ADDR;

    wb_mux_29 interconnect (
    .wbs0_adr_o(gpio_adr_i),
    .wbs0_dat_i(gpio_dat_o),
    .wbs0_dat_o(gpio_dat_i),
    .wbs0_we_o(gpio_we_i),
    .wbs0_sel_o(gpio_sel_i),
    .wbs0_stb_o(gpio_stb_i),
    .wbs0_ack_i(gpio_ack_o),
    .wbs0_err_i(1'b0),
    .wbs0_rty_i(1'b0),
    .wbs0_cyc_o(gpio_cyc_i),
    .wbs0_addr(GPIO0_BASE_ADDR),
    .wbs0_addr_msk(GPIO0_ADDR_MASK),

    .wbs1_adr_o(pwm_adr_i[0]),
    .wbs1_dat_i(pwm_dat_o[0]),
    .wbs1_dat_o(pwm_dat_i[0]),
    .wbs1_we_o(pwm_we_i[0]),
    .wbs1_sel_o(pwm_sel_i[0]),
    .wbs1_stb_o(pwm_stb_i[0]),
    .wbs1_ack_i(pwm_ack_o[0]),
    .wbs1_err_i(1'b0),
    .wbs1_rty_i(1'b0),
    .wbs1_cyc_o(pwm_cyc_i[0]),
    .wbs1_addr(PWM0_BASE_ADDR),
    .wbs1_addr_msk(PWM0_ADDR_MASK),

    .wbs2_adr_o(pwm_adr_i[1]),
    .wbs2_dat_i(pwm_dat_o[1]),
    .wbs2_dat_o(pwm_dat_i[1]),
    .wbs2_we_o(pwm_we_i[1]),
    .wbs2_sel_o(pwm_sel_i[1]),
    .wbs2_stb_o(pwm_stb_i[1]),
    .wbs2_ack_i(pwm_ack_o[1]),
    .wbs2_err_i(1'b0),
    .wbs2_rty_i(1'b0),
    .wbs2_cyc_o(pwm_cyc_i[1]),
    .wbs2_addr(PWM1_BASE_ADDR),
    .wbs2_addr_msk(PWM1_ADDR_MASK),

    .wbs3_adr_o(pwm_adr_i[2]),
    .wbs3_dat_i(pwm_dat_o[2]),
    .wbs3_dat_o(pwm_dat_i[2]),
    .wbs3_we_o(pwm_we_i[2]),
    .wbs3_sel_o(pwm_sel_i[2]),
    .wbs3_stb_o(pwm_stb_i[2]),
    .wbs3_ack_i(pwm_ack_o[2]),
    .wbs3_err_i(1'b0),
    .wbs3_rty_i(1'b0),
    .wbs3_cyc_o(pwm_cyc_i[2]),
    .wbs3_addr(PWM2_BASE_ADDR),
    .wbs3_addr_msk(PWM2_ADDR_MASK),

    .wbs4_adr_o(pwm_adr_i[3]),
    .wbs4_dat_i(pwm_dat_o[3]),
    .wbs4_dat_o(pwm_dat_i[3]),
    .wbs4_we_o(pwm_we_i[3]),
    .wbs4_sel_o(pwm_sel_i[3]),
    .wbs4_stb_o(pwm_stb_i[3]),
    .wbs4_ack_i(pwm_ack_o[3]),
    .wbs4_err_i(1'b0),
    .wbs4_rty_i(1'b0),
    .wbs4_cyc_o(pwm_cyc_i[3]),
    .wbs4_addr(PWM3_BASE_ADDR),
    .wbs4_addr_msk(PWM3_ADDR_MASK),

    .wbs5_adr_o(uart_adr_i),
    .wbs5_dat_i(uart_dat_o),
    .wbs5_dat_o(uart_dat_i),
    .wbs5_we_o(uart_we_i),
    .wbs5_sel_o(uart_sel_i),
    .wbs5_stb_o(uart_stb_i),
    .wbs5_ack_i(uart_ack_o),
    .wbs5_err_i(1'b0),
    .wbs5_rty_i(1'b0),
    .wbs5_cyc_o(uart_cyc_i),
    .wbs5_addr(UART0_BASE_ADDR),
    .wbs5_addr_msk(UART0_ADDR_MASK),

    .wbs6_adr_o(ring0_adr_i),
    .wbs6_dat_i(ring0_dat_o),
    .wbs6_dat_o(ring0_dat_i),
    .wbs6_we_o(ring0_we_i),
    .wbs6_sel_o(ring0_sel_i),
    .wbs6_stb_o(ring0_stb_i),
    .wbs6_ack_i(ring0_ack_o),
    .wbs6_err_i(1'b0),
    .wbs6_rty_i(1'b0),
    .wbs6_cyc_o(ring0_cyc_i),
    .wbs6_addr(RING0_BASE_ADDR),
    .wbs6_addr_msk(RING0_ADDR_MASK),

    .wbs7_adr_o(ring1_adr_i),
    .wbs7_dat_i(ring1_dat_o),
    .wbs7_dat_o(ring1_dat_i),
    .wbs7_we_o(ring1_we_i),
    .wbs7_sel_o(ring1_sel_i),
    .wbs7_stb_o(ring1_stb_i),
    .wbs7_ack_i(ring1_ack_o),
    .wbs7_err_i(1'b0),
    .wbs7_rty_i(1'b0),
    .wbs7_cyc_o(ring1_cyc_i),
    .wbs7_addr(RING1_BASE_ADDR),
    .wbs7_addr_msk(RING1_ADDR_MASK),

          .wbs8_adr_o(ring2_adr_i[0]),
      .wbs8_dat_i(ring2_dat_o[0]),
      .wbs8_dat_o(ring2_dat_i[0]),
      .wbs8_we_o(ring2_we_i[0]),
      .wbs8_sel_o(ring2_sel_i[0]),
      .wbs8_stb_o(ring2_stb_i[0]),
      .wbs8_ack_i(ring2_ack_o[0]),
      .wbs8_err_i(1'b0),
      .wbs8_rty_i(1'b0),
      .wbs8_cyc_o(ring2_cyc_i[0]),
      .wbs8_addr(RING2_BASE_ADDR),
      .wbs8_addr_msk(RING2_ADDR_MASK),
          .wbs9_adr_o(ring2_adr_i[1]),
      .wbs9_dat_i(ring2_dat_o[1]),
      .wbs9_dat_o(ring2_dat_i[1]),
      .wbs9_we_o(ring2_we_i[1]),
      .wbs9_sel_o(ring2_sel_i[1]),
      .wbs9_stb_o(ring2_stb_i[1]),
      .wbs9_ack_i(ring2_ack_o[1]),
      .wbs9_err_i(1'b0),
      .wbs9_rty_i(1'b0),
      .wbs9_cyc_o(ring2_cyc_i[1]),
      .wbs9_addr(RING3_BASE_ADDR),
      .wbs9_addr_msk(RING3_ADDR_MASK),
          .wbs10_adr_o(ring2_adr_i[2]),
      .wbs10_dat_i(ring2_dat_o[2]),
      .wbs10_dat_o(ring2_dat_i[2]),
      .wbs10_we_o(ring2_we_i[2]),
      .wbs10_sel_o(ring2_sel_i[2]),
      .wbs10_stb_o(ring2_stb_i[2]),
      .wbs10_ack_i(ring2_ack_o[2]),
      .wbs10_err_i(1'b0),
      .wbs10_rty_i(1'b0),
      .wbs10_cyc_o(ring2_cyc_i[2]),
      .wbs10_addr(RING4_BASE_ADDR),
      .wbs10_addr_msk(RING4_ADDR_MASK),
          .wbs11_adr_o(ring2_adr_i[3]),
      .wbs11_dat_i(ring2_dat_o[3]),
      .wbs11_dat_o(ring2_dat_i[3]),
      .wbs11_we_o(ring2_we_i[3]),
      .wbs11_sel_o(ring2_sel_i[3]),
      .wbs11_stb_o(ring2_stb_i[3]),
      .wbs11_ack_i(ring2_ack_o[3]),
      .wbs11_err_i(1'b0),
      .wbs11_rty_i(1'b0),
      .wbs11_cyc_o(ring2_cyc_i[3]),
      .wbs11_addr(RING5_BASE_ADDR),
      .wbs11_addr_msk(RING5_ADDR_MASK),
          .wbs12_adr_o(ring2_adr_i[4]),
      .wbs12_dat_i(ring2_dat_o[4]),
      .wbs12_dat_o(ring2_dat_i[4]),
      .wbs12_we_o(ring2_we_i[4]),
      .wbs12_sel_o(ring2_sel_i[4]),
      .wbs12_stb_o(ring2_stb_i[4]),
      .wbs12_ack_i(ring2_ack_o[4]),
      .wbs12_err_i(1'b0),
      .wbs12_rty_i(1'b0),
      .wbs12_cyc_o(ring2_cyc_i[4]),
      .wbs12_addr(RING6_BASE_ADDR),
      .wbs12_addr_msk(RING6_ADDR_MASK),
          .wbs13_adr_o(ring2_adr_i[5]),
      .wbs13_dat_i(ring2_dat_o[5]),
      .wbs13_dat_o(ring2_dat_i[5]),
      .wbs13_we_o(ring2_we_i[5]),
      .wbs13_sel_o(ring2_sel_i[5]),
      .wbs13_stb_o(ring2_stb_i[5]),
      .wbs13_ack_i(ring2_ack_o[5]),
      .wbs13_err_i(1'b0),
      .wbs13_rty_i(1'b0),
      .wbs13_cyc_o(ring2_cyc_i[5]),
      .wbs13_addr(RING7_BASE_ADDR),
      .wbs13_addr_msk(RING7_ADDR_MASK),
          .wbs14_adr_o(ring2_adr_i[6]),
      .wbs14_dat_i(ring2_dat_o[6]),
      .wbs14_dat_o(ring2_dat_i[6]),
      .wbs14_we_o(ring2_we_i[6]),
      .wbs14_sel_o(ring2_sel_i[6]),
      .wbs14_stb_o(ring2_stb_i[6]),
      .wbs14_ack_i(ring2_ack_o[6]),
      .wbs14_err_i(1'b0),
      .wbs14_rty_i(1'b0),
      .wbs14_cyc_o(ring2_cyc_i[6]),
      .wbs14_addr(RING8_BASE_ADDR),
      .wbs14_addr_msk(RING8_ADDR_MASK),
          .wbs15_adr_o(ring2_adr_i[7]),
      .wbs15_dat_i(ring2_dat_o[7]),
      .wbs15_dat_o(ring2_dat_i[7]),
      .wbs15_we_o(ring2_we_i[7]),
      .wbs15_sel_o(ring2_sel_i[7]),
      .wbs15_stb_o(ring2_stb_i[7]),
      .wbs15_ack_i(ring2_ack_o[7]),
      .wbs15_err_i(1'b0),
      .wbs15_rty_i(1'b0),
      .wbs15_cyc_o(ring2_cyc_i[7]),
      .wbs15_addr(RING9_BASE_ADDR),
      .wbs15_addr_msk(RING9_ADDR_MASK),
          .wbs16_adr_o(ring2_adr_i[8]),
      .wbs16_dat_i(ring2_dat_o[8]),
      .wbs16_dat_o(ring2_dat_i[8]),
      .wbs16_we_o(ring2_we_i[8]),
      .wbs16_sel_o(ring2_sel_i[8]),
      .wbs16_stb_o(ring2_stb_i[8]),
      .wbs16_ack_i(ring2_ack_o[8]),
      .wbs16_err_i(1'b0),
      .wbs16_rty_i(1'b0),
      .wbs16_cyc_o(ring2_cyc_i[8]),
      .wbs16_addr(RING10_BASE_ADDR),
      .wbs16_addr_msk(RING10_ADDR_MASK),
          .wbs17_adr_o(ring2_adr_i[9]),
      .wbs17_dat_i(ring2_dat_o[9]),
      .wbs17_dat_o(ring2_dat_i[9]),
      .wbs17_we_o(ring2_we_i[9]),
      .wbs17_sel_o(ring2_sel_i[9]),
      .wbs17_stb_o(ring2_stb_i[9]),
      .wbs17_ack_i(ring2_ack_o[9]),
      .wbs17_err_i(1'b0),
      .wbs17_rty_i(1'b0),
      .wbs17_cyc_o(ring2_cyc_i[9]),
      .wbs17_addr(RING11_BASE_ADDR),
      .wbs17_addr_msk(RING11_ADDR_MASK),
          .wbs18_adr_o(ring2_adr_i[10]),
      .wbs18_dat_i(ring2_dat_o[10]),
      .wbs18_dat_o(ring2_dat_i[10]),
      .wbs18_we_o(ring2_we_i[10]),
      .wbs18_sel_o(ring2_sel_i[10]),
      .wbs18_stb_o(ring2_stb_i[10]),
      .wbs18_ack_i(ring2_ack_o[10]),
      .wbs18_err_i(1'b0),
      .wbs18_rty_i(1'b0),
      .wbs18_cyc_o(ring2_cyc_i[10]),
      .wbs18_addr(RING12_BASE_ADDR),
      .wbs18_addr_msk(RING12_ADDR_MASK),
          .wbs19_adr_o(ring2_adr_i[11]),
      .wbs19_dat_i(ring2_dat_o[11]),
      .wbs19_dat_o(ring2_dat_i[11]),
      .wbs19_we_o(ring2_we_i[11]),
      .wbs19_sel_o(ring2_sel_i[11]),
      .wbs19_stb_o(ring2_stb_i[11]),
      .wbs19_ack_i(ring2_ack_o[11]),
      .wbs19_err_i(1'b0),
      .wbs19_rty_i(1'b0),
      .wbs19_cyc_o(ring2_cyc_i[11]),
      .wbs19_addr(RING13_BASE_ADDR),
      .wbs19_addr_msk(RING13_ADDR_MASK),
          .wbs20_adr_o(ring2_adr_i[12]),
      .wbs20_dat_i(ring2_dat_o[12]),
      .wbs20_dat_o(ring2_dat_i[12]),
      .wbs20_we_o(ring2_we_i[12]),
      .wbs20_sel_o(ring2_sel_i[12]),
      .wbs20_stb_o(ring2_stb_i[12]),
      .wbs20_ack_i(ring2_ack_o[12]),
      .wbs20_err_i(1'b0),
      .wbs20_rty_i(1'b0),
      .wbs20_cyc_o(ring2_cyc_i[12]),
      .wbs20_addr(RING14_BASE_ADDR),
      .wbs20_addr_msk(RING14_ADDR_MASK),
          .wbs21_adr_o(ring2_adr_i[13]),
      .wbs21_dat_i(ring2_dat_o[13]),
      .wbs21_dat_o(ring2_dat_i[13]),
      .wbs21_we_o(ring2_we_i[13]),
      .wbs21_sel_o(ring2_sel_i[13]),
      .wbs21_stb_o(ring2_stb_i[13]),
      .wbs21_ack_i(ring2_ack_o[13]),
      .wbs21_err_i(1'b0),
      .wbs21_rty_i(1'b0),
      .wbs21_cyc_o(ring2_cyc_i[13]),
      .wbs21_addr(RING15_BASE_ADDR),
      .wbs21_addr_msk(RING15_ADDR_MASK),
          .wbs22_adr_o(ring2_adr_i[14]),
      .wbs22_dat_i(ring2_dat_o[14]),
      .wbs22_dat_o(ring2_dat_i[14]),
      .wbs22_we_o(ring2_we_i[14]),
      .wbs22_sel_o(ring2_sel_i[14]),
      .wbs22_stb_o(ring2_stb_i[14]),
      .wbs22_ack_i(ring2_ack_o[14]),
      .wbs22_err_i(1'b0),
      .wbs22_rty_i(1'b0),
      .wbs22_cyc_o(ring2_cyc_i[14]),
      .wbs22_addr(RING16_BASE_ADDR),
      .wbs22_addr_msk(RING16_ADDR_MASK),
          .wbs23_adr_o(ring2_adr_i[15]),
      .wbs23_dat_i(ring2_dat_o[15]),
      .wbs23_dat_o(ring2_dat_i[15]),
      .wbs23_we_o(ring2_we_i[15]),
      .wbs23_sel_o(ring2_sel_i[15]),
      .wbs23_stb_o(ring2_stb_i[15]),
      .wbs23_ack_i(ring2_ack_o[15]),
      .wbs23_err_i(1'b0),
      .wbs23_rty_i(1'b0),
      .wbs23_cyc_o(ring2_cyc_i[15]),
      .wbs23_addr(RING17_BASE_ADDR),
      .wbs23_addr_msk(RING17_ADDR_MASK),
          .wbs24_adr_o(ring2_adr_i[16]),
      .wbs24_dat_i(ring2_dat_o[16]),
      .wbs24_dat_o(ring2_dat_i[16]),
      .wbs24_we_o(ring2_we_i[16]),
      .wbs24_sel_o(ring2_sel_i[16]),
      .wbs24_stb_o(ring2_stb_i[16]),
      .wbs24_ack_i(ring2_ack_o[16]),
      .wbs24_err_i(1'b0),
      .wbs24_rty_i(1'b0),
      .wbs24_cyc_o(ring2_cyc_i[16]),
      .wbs24_addr(RING18_BASE_ADDR),
      .wbs24_addr_msk(RING18_ADDR_MASK),
          .wbs25_adr_o(ring2_adr_i[17]),
      .wbs25_dat_i(ring2_dat_o[17]),
      .wbs25_dat_o(ring2_dat_i[17]),
      .wbs25_we_o(ring2_we_i[17]),
      .wbs25_sel_o(ring2_sel_i[17]),
      .wbs25_stb_o(ring2_stb_i[17]),
      .wbs25_ack_i(ring2_ack_o[17]),
      .wbs25_err_i(1'b0),
      .wbs25_rty_i(1'b0),
      .wbs25_cyc_o(ring2_cyc_i[17]),
      .wbs25_addr(RING19_BASE_ADDR),
      .wbs25_addr_msk(RING19_ADDR_MASK),
          .wbs26_adr_o(ring2_adr_i[18]),
      .wbs26_dat_i(ring2_dat_o[18]),
      .wbs26_dat_o(ring2_dat_i[18]),
      .wbs26_we_o(ring2_we_i[18]),
      .wbs26_sel_o(ring2_sel_i[18]),
      .wbs26_stb_o(ring2_stb_i[18]),
      .wbs26_ack_i(ring2_ack_o[18]),
      .wbs26_err_i(1'b0),
      .wbs26_rty_i(1'b0),
      .wbs26_cyc_o(ring2_cyc_i[18]),
      .wbs26_addr(RING20_BASE_ADDR),
      .wbs26_addr_msk(RING20_ADDR_MASK),
          .wbs27_adr_o(ring2_adr_i[19]),
      .wbs27_dat_i(ring2_dat_o[19]),
      .wbs27_dat_o(ring2_dat_i[19]),
      .wbs27_we_o(ring2_we_i[19]),
      .wbs27_sel_o(ring2_sel_i[19]),
      .wbs27_stb_o(ring2_stb_i[19]),
      .wbs27_ack_i(ring2_ack_o[19]),
      .wbs27_err_i(1'b0),
      .wbs27_rty_i(1'b0),
      .wbs27_cyc_o(ring2_cyc_i[19]),
      .wbs27_addr(RING21_BASE_ADDR),
      .wbs27_addr_msk(RING21_ADDR_MASK),
          .wbs28_adr_o(ring2_adr_i[20]),
      .wbs28_dat_i(ring2_dat_o[20]),
      .wbs28_dat_o(ring2_dat_i[20]),
      .wbs28_we_o(ring2_we_i[20]),
      .wbs28_sel_o(ring2_sel_i[20]),
      .wbs28_stb_o(ring2_stb_i[20]),
      .wbs28_ack_i(ring2_ack_o[20]),
      .wbs28_err_i(1'b0),
      .wbs28_rty_i(1'b0),
      .wbs28_cyc_o(ring2_cyc_i[20]),
      .wbs28_addr(RING22_BASE_ADDR),
      .wbs28_addr_msk(RING22_ADDR_MASK),
    
    .wbm_adr_i(wbs_adr_i),
    .wbm_dat_i(wbs_dat_i),
    .wbm_dat_o(wbs_dat_o),
    .wbm_we_i(wbs_we_i & wbs_addr_sel),
    .wbm_sel_i(wbs_sel_i),
    .wbm_stb_i(wbs_stb_i & wbs_addr_sel),
    .wbm_ack_o(wbs_ack_o),
    .wbm_err_o(),
    .wbm_rty_o(),
    .wbm_cyc_i(wbs_cyc_i & wbs_addr_sel)
  );

  // GPIO signals.
  wire [31:0] gpio_adr_i;
  wire [31:0] gpio_dat_i;
  wire [3:0] gpio_sel_i;
  wire gpio_we_i;
  wire gpio_cyc_i;
  wire gpio_stb_i;
  wire gpio_ack_o;
  wire [31:0] gpio_dat_o;

  wire [31:0] gpio_in;
  wire [31:0] gpio_out;
  wire [31:0] gpio_oeb;

  gpio32_wb gpio0 (
    .wb_clk_i(wb_clk_i),
    .wb_rst_i(wb_rst_i),

    .wb_dat_i(gpio_dat_i),
    .wb_adr_i(gpio_adr_i),
    .wb_sel_i(gpio_sel_i),
    .wb_cyc_i(gpio_cyc_i),
    .wb_stb_i(gpio_stb_i),
    .wb_we_i(gpio_we_i),

    .wb_dat_o(gpio_dat_o),
    .wb_ack_o(gpio_ack_o),

    .gpio_in(gpio_in),
    .gpio_out(gpio_out),
    .gpio_oeb(gpio_oeb)
  );

  // PWM controllers.
  wire [31:0] pwm_adr_i[4];
  wire [31:0] pwm_dat_i[4];
  wire [3:0] pwm_sel_i[4];
  wire pwm_we_i[4];
  wire pwm_cyc_i[4];
  wire pwm_stb_i[4];
  wire pwm_ack_o[4];
  wire [31:0] pwm_dat_o[4];

  wire pwm_out[4];

  genvar i;
  generate
    for (i = 0; i < 4; i = i + 1) begin : pwms
      pwm_wb pwm (
        .wb_clk_i(wb_clk_i),
        .wb_rst_i(wb_rst_i),

        .wb_stb_i(pwm_stb_i[i]),
        .wb_cyc_i(pwm_cyc_i[i]),
        .wb_we_i(pwm_we_i[i]),
        .wb_sel_i(pwm_sel_i[i]),
        .wb_dat_i(pwm_dat_i[i]),
        .wb_adr_i(pwm_adr_i[i]),

        .wb_ack_o(pwm_ack_o[i]),
        .wb_dat_o(pwm_dat_o[i]),

        .pwm_out(pwm_out[i])
      );
    end
  endgenerate

  // UART signals.
  wire [31:0] uart_adr_i;
  wire [31:0] uart_dat_i;
  wire [3:0] uart_sel_i;
  wire uart_we_i;
  wire uart_cyc_i;
  wire uart_stb_i;
  wire uart_ack_o;
  wire [31:0] uart_dat_o;

  wire uart_enabled;
  wire uart_tx;
  wire uart_rx;

  simpleuart_div16_wb  #(
    .BASE_ADR(UART0_BASE_ADDR)
  ) uart0 (
    .wb_clk_i(wb_clk_i),
    .wb_rst_i(wb_rst_i),

    .wb_adr_i(uart_adr_i),
    .wb_dat_i(uart_dat_i),
    .wb_sel_i(uart_sel_i),
    .wb_we_i(uart_we_i),
    .wb_cyc_i(uart_cyc_i),

    .wb_stb_i(uart_stb_i),
    .wb_ack_o(uart_ack_o),
    .wb_dat_o(uart_dat_o),

    .uart_enabled(uart_enabled),
    .ser_tx(uart_tx),
    .ser_rx(uart_rx)
  );

  // RING0 signals.
  wire [31:0] ring0_adr_i;
  wire [31:0] ring0_dat_i;
  wire [3:0] ring0_sel_i;
  wire ring0_we_i;
  wire ring0_cyc_i;
  wire ring0_stb_i;
  wire ring0_ack_o;
  wire [31:0] ring0_dat_o;
  wire ring0_test_en;
  wire ring0_test_out;

  ring_control #(
    .CLKMUX_BITS(3),
    .TRIM_BITS(28)
  ) ring0 (
    .wb_clk_i(wb_clk_i),
    .wb_rst_i(wb_rst_i),

    .wb_stb_i(ring0_stb_i),
    .wb_cyc_i(ring0_cyc_i),
    .wb_we_i(ring0_we_i),
    .wb_sel_i(ring0_sel_i),
    .wb_dat_i(ring0_dat_i),
    .wb_adr_i(ring0_adr_i),

    .wb_ack_o(ring0_ack_o),
    .wb_dat_o(ring0_dat_o),

    .ring_clk(ring0_clk),
    .ring_start(ring0_start),
    .ring_trim_a(ring0_trim_a),
    .ring_trim_b(ring0_trim_b),
    .ring_clkmux(ring0_clkmux),

    .test_en(ring0_test_en),
    .test_out(ring0_test_out)
  );

  // RING1 signals.
  wire [31:0] ring1_adr_i;
  wire [31:0] ring1_dat_i;
  wire [3:0] ring1_sel_i;
  wire ring1_we_i;
  wire ring1_cyc_i;
  wire ring1_stb_i;
  wire ring1_ack_o;
  wire [31:0] ring1_dat_o;
  wire ring1_test_en;
  wire ring1_test_out;

  ring_control #(
    .CLKMUX_BITS(3),
    .TRIM_BITS(26)
  ) ring1 (
    .wb_clk_i(wb_clk_i),
    .wb_rst_i(wb_rst_i),

    .wb_stb_i(ring1_stb_i),
    .wb_cyc_i(ring1_cyc_i),
    .wb_we_i(ring1_we_i),
    .wb_sel_i(ring1_sel_i),
    .wb_dat_i(ring1_dat_i),
    .wb_adr_i(ring1_adr_i),

    .wb_ack_o(ring1_ack_o),
    .wb_dat_o(ring1_dat_o),

    .ring_clk(ring1_clk),
    .ring_start(ring1_start),
    .ring_trim_a(ring1_trim_a),
    .ring_trim_b(),
    .ring_clkmux(ring1_clkmux),

    .test_en(ring1_test_en),
    .test_out(ring1_test_out)
  );

  // RING[2-9] signals.
  wire [31:0] ring2_adr_i[21];
  wire [31:0] ring2_dat_i[21];
  wire [3:0] ring2_sel_i[21];
  wire ring2_we_i[21];
  wire ring2_cyc_i[21];
  wire ring2_stb_i[21];
  wire ring2_ack_o[21];
  wire [31:0] ring2_dat_o[21];

  wire [20:0] ring2_clk_bus;
      assign ring2_clk_bus[0] = ring2_clk;
      assign ring2_clk_bus[1] = ring3_clk;
      assign ring2_clk_bus[2] = ring4_clk;
      assign ring2_clk_bus[3] = ring5_clk;
      assign ring2_clk_bus[4] = ring6_clk;
      assign ring2_clk_bus[5] = ring7_clk;
      assign ring2_clk_bus[6] = ring8_clk;
      assign ring2_clk_bus[7] = ring9_clk;
      assign ring2_clk_bus[8] = ring10_clk;
      assign ring2_clk_bus[9] = ring11_clk;
      assign ring2_clk_bus[10] = ring12_clk;
      assign ring2_clk_bus[11] = ring13_clk;
      assign ring2_clk_bus[12] = ring14_clk;
      assign ring2_clk_bus[13] = ring15_clk;
      assign ring2_clk_bus[14] = ring16_clk;
      assign ring2_clk_bus[15] = ring17_clk;
      assign ring2_clk_bus[16] = ring18_clk;
      assign ring2_clk_bus[17] = ring19_clk;
      assign ring2_clk_bus[18] = ring20_clk;
      assign ring2_clk_bus[19] = ring21_clk;
      assign ring2_clk_bus[20] = ring22_clk;
  
  // ring2 controls the start, trim, reset for ring2-9
  ring_control ring2 (
    .wb_clk_i(wb_clk_i),
    .wb_rst_i(wb_rst_i),

    .wb_stb_i(ring2_stb_i[0]),
    .wb_cyc_i(ring2_cyc_i[0]),
    .wb_we_i(ring2_we_i[0]),
    .wb_sel_i(ring2_sel_i[0]),
    .wb_dat_i(ring2_dat_i[0]),
    .wb_adr_i(ring2_adr_i[0]),

    .wb_ack_o(ring2_ack_o[0]),
    .wb_dat_o(ring2_dat_o[0]),

    .ring_clk(ring2_clk_bus[0]),
    .ring_start(ring2_start),
    .ring_trim_a(ring2_trim_a),
    .ring_trim_b(ring2_trim_b),
    .ring_clkmux(ring2_clkmux),

    .test_en(),
    .test_out()
  );

  genvar j;
  generate
    for (j = 1; j < 21; j = j + 1) begin : ring2s
      ring_control ring2 (
        .wb_clk_i(wb_clk_i),
        .wb_rst_i(wb_rst_i),

        .wb_stb_i(ring2_stb_i[j]),
        .wb_cyc_i(ring2_cyc_i[j]),
        .wb_we_i(ring2_we_i[j]),
        .wb_sel_i(ring2_sel_i[j]),
        .wb_dat_i(ring2_dat_i[j]),
        .wb_adr_i(ring2_adr_i[j]),

        .wb_ack_o(ring2_ack_o[j]),
        .wb_dat_o(ring2_dat_o[j]),

        .ring_clk(ring2_clk_bus[j]),
        .ring_start(),
        .ring_trim_a(),
        .ring_trim_b(),
        .ring_clkmux(),

        .test_en(),
        .test_out()
      );
    end
  endgenerate

  // Connect up external ports.
  assign gpio_in = io_in[37:6];
  assign uart_rx = io_in[35];

  assign io_out[5:0] = 6'b0;
  assign io_out[37:6] = gpio_out |
    {
      /*31 - io37=*/uart_tx & uart_enabled,
      /*30 - io36=*/1'b0,
      /*29 - io35=*/1'b0,
      /*28 - io34=*/1'b0,
      /*27 - io33=*/1'b0,
      /*26 - io32=*/ring0_test_out,
      /*25 - io31=*/ring1_test_out,
      /*24 - io30=*/1'b0,
      /*23 - io29=*/pwm_out[0],
      /*22 - io28=*/1'b0,
      /*21 - io27=*/pwm_out[1],
      /*20 - io26=*/1'b0,
      /*19 - io25=*/pwm_out[2],
      /*18 - io24=*/1'b0,
      /*17 - io23=*/pwm_out[3],
      17'b0
    };

  assign io_oeb[5:0] = 6'b0;
  assign io_oeb[37:6] = gpio_oeb &
    {
      /*io37=*/~uart_enabled,
      /*io36=*/1'b1,
      /*io35=*/1'b1,
      /*io34=*/1'b1,
      /*io33=*/1'b1,
      /*io32=*/~ring0_test_en,
      /*io31=*/~ring1_test_en,
      {25{1'b1}}
    };

  assign la_data_out = 128'b0;

  assign irq = 3'b0;

endmodule // module digitalcore_macro

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

module dtop (
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
  output [2:0] irq
);

  // Filter wishbone accesses from Caravel.
  parameter DTOP_MASK    = 32'hff00_0000;
  parameter DTOP_ADDR    = 32'h3000_0000;

  // Peripherals.
  parameter GPIO0_ADDR_MASK   = 32'hffff_0000;
  parameter GPIO0_BASE_ADDR   = 32'h3080_0000;
  parameter PWM0_ADDR_MASK    = 32'hffff_0000;
  parameter PWM0_BASE_ADDR    = 32'h3081_0000;
  parameter UART0_ADDR_MASK   = 32'hffff_0000;
  parameter UART0_BASE_ADDR   = 32'h3082_0000;
  parameter RING0_ADDR_MASK   = 32'hffff_0000;
  parameter RING0_BASE_ADDR   = 32'h3083_0000;

  // Filter addresses from Caravel since we want to be absolutely sure it is
  // selecting us before letting it access the arbiter.  This is mostly needed
  // because the wb_intercon.v implementation in Caravel doesn't corrently
  // filter the wb_cyc_i signal to slaves.
  wire wbs_addr_sel;
  assign wbs_addr_sel = (wbs_adr_i & DTOP_MASK) == DTOP_ADDR;

  wb_mux_3 interconnect (
    .wbm_adr_i(wbs_adr_i),
    .wbm_dat_i(wbs_dat_i),
    .wbm_dat_o(wbs_dat_o),
    .wbm_we_i(wbs_we_i & wbs_addr_sel),
    .wbm_sel_i(wbs_sel_i),
    .wbm_stb_i(wbs_stb_i & wbs_addr_sel),
    .wbm_ack_o(wbs_ack_o),
    .wbm_err_o(),
    .wbm_rty_o(),
    .wbm_cyc_i(wbs_cyc_i & wbs_addr_sel),

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

    .wbs1_adr_o(uart_adr_i),
    .wbs1_dat_i(uart_dat_o),
    .wbs1_dat_o(uart_dat_i),
    .wbs1_we_o(uart_we_i),
    .wbs1_sel_o(uart_sel_i),
    .wbs1_stb_o(uart_stb_i),
    .wbs1_ack_i(uart_ack_o),
    .wbs1_err_i(1'b0),
    .wbs1_rty_i(1'b0),
    .wbs1_cyc_o(uart_cyc_i),
    .wbs1_addr(UART0_BASE_ADDR),
    .wbs1_addr_msk(UART0_ADDR_MASK),

    .wbs2_adr_o(ring0_adr_i),
    .wbs2_dat_i(ring0_dat_o),
    .wbs2_dat_o(ring0_dat_i),
    .wbs2_we_o(ring0_we_i),
    .wbs2_sel_o(ring0_sel_i),
    .wbs2_stb_o(ring0_stb_i),
    .wbs2_ack_i(ring0_ack_o),
    .wbs2_err_i(1'b0),
    .wbs2_rty_i(1'b0),
    .wbs2_cyc_o(ring0_cyc_i),
    .wbs2_addr(RING0_BASE_ADDR),
    .wbs2_addr_msk(RING0_ADDR_MASK),
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

  simpleuart_wb  #(
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

  wire ring0_clk;
  wire ring0_start;
  wire [27:0] ring0_trim_a;
  wire [27:0] ring0_trim_b;
  wire [2:0] ring0_clkmux;

  ring_control #(
    .CLKMUX_BITS(3),
    .TRIM_BITS(28)
  ) ring0 (
    .wb_clk_i(wb_clk_i),
    .wb_rst_i(wb_rst_i),

    .wbs_stb_i(ring0_stb_i),
    .wbs_cyc_i(ring0_cyc_i),
    .wbs_we_i(ring0_we_i),
    .wbs_sel_i(ring0_sel_i),
    .wbs_dat_i(ring0_dat_i),
    .wbs_adr_i(ring0_adr_i),

    .wbs_ack_o(ring0_ack_o),
    .wbs_dat_o(ring0_dat_o),

    .ring_clk(ring0_clk),
    .ring_start(ring0_start),
    .ring_trim_a(ring0_trim_a),
    .ring_trim_b(ring0_trim_b),
    .ring_clkmux(ring0_clkmux)
  );

  collapsering_macro collapsering0 (
    .CLKBUFOUT(ring0_clk),
    .START(ring0_start),
    .TRIMA(ring0_trim_a),
    .TRIMB(ring0_trim_b),
    .CLKMUX(ring0_clkmux)
  );

  // Connect up external ports.
  assign gpio_in = io_in[37:6];
  assign io_out[5:0] = 6'b0;
  assign io_out[37:6] = gpio_out;
  assign io_oeb[5:0] = {6{1'b1}};
  assign io_oeb[37:6] = gpio_oeb;

  assign la_data_out = 128'b0;

  assign irq = 3'b0;

endmodule // module dtop

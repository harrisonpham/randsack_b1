// Ring oscillator controller.
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

module ring_control #(
  parameter CLKMUX_BITS = 3,
  parameter TRIM_BITS = 28
) (
  input wb_clk_i,
  input wb_rst_i,

  input wb_stb_i,
  input wb_cyc_i,
  input wb_we_i,
  input [3:0] wb_sel_i,
  input [31:0] wb_dat_i,
  input [31:0] wb_adr_i,

  output reg wb_ack_o,
  output reg [31:0] wb_dat_o,

  input ring_clk,
  output reg ring_start,
  output reg [TRIM_BITS-1:0] ring_trim_a,
  output reg [TRIM_BITS-1:0] ring_trim_b,
  output reg [CLKMUX_BITS-1:0] ring_clkmux
);
  // Register addresses.
  localparam COUNT_VALUE_ADDR = 8'h00;
  localparam CONTROL_ADDR     = 8'h04;
  localparam TRIMA_ADDR       = 8'h08;
  localparam TRIMB_ADDR       = 8'h0c;

  wire resetb;
  assign resetb = ~wb_rst_i;

  wire slave_sel = (wb_stb_i && wb_cyc_i);
  wire slave_write_en = (|wb_sel_i && wb_we_i);

  wire control_sel = (wb_adr_i[7:0] == CONTROL_ADDR);
  wire count_value_sel = (wb_adr_i[7:0] == COUNT_VALUE_ADDR);
  wire trima_sel = (wb_adr_i[7:0] == TRIMA_ADDR);
  wire trimb_sel = (wb_adr_i[7:0] == TRIMB_ADDR);

  // Counter signals and regs.
  reg counter_resetb;
  reg [16:0] counter_value;

  // Ring oscillator counter.
  // NOTE: This reset is pretty nasty, but the idea is we have full control
  // over the reset timing so we don't need to synchronize it.
  always @(posedge ring_clk or negedge counter_resetb) begin
    if (!counter_resetb) begin
      counter_value <= 16'h0;
    end else begin
      counter_value <= counter_value + 16'h1;
    end
  end

  // CSRs.
  always @(posedge wb_clk_i or negedge resetb) begin
    if (!resetb) begin
      wb_ack_o <= 1'b0;
      wb_dat_o <= 32'h0;
      counter_resetb <= 1'b0;
      ring_start <= 1'b0;
      ring_clkmux <= {CLKMUX_BITS{1'b1}};
      ring_trim_a <= {TRIM_BITS{1'b1}};
      ring_trim_b <= {TRIM_BITS{1'b1}};
    end else begin
      wb_ack_o <= 1'b0;

      if (slave_sel && !wb_ack_o) begin
        wb_ack_o <= 1'b1;

        if (control_sel) begin
          counter_resetb <= ~wb_dat_i[0];
          ring_start <= wb_dat_i[1];
          ring_clkmux <= wb_dat_i[CLKMUX_BITS-1+8:8];
        end else if (trima_sel) begin
          ring_trim_a <= wb_dat_i[TRIM_BITS-1:0];
        end else if (trimb_sel) begin
          ring_trim_b <= wb_dat_i[TRIM_BITS-1:0];
        end else if (count_value_sel) begin
          // TODO(hdpham): Add synchronizer!
          wb_dat_o <= {16'h0, counter_value};
        end
      end
    end
  end

endmodule // module ring_control

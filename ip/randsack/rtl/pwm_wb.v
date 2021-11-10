// PWM generator.
//
// SPDX-FileCopyrightText: 2021 Harrison Pham
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

module pwm_wb #(
  parameter DIV_BITS = 16,
  parameter CNT_BITS = 16
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

  output reg pwm_out
);
  // CSR addresses.
  localparam DIV_ADDR     = 8'h00;
  localparam CNTMAX_ADDR  = 8'h04;
  localparam CNT_ADDR     = 8'h08;
  localparam CMP_ADDR     = 8'h0c;

  wire clk = wb_clk_i;
  wire resetb = ~wb_rst_i;

  wire slave_sel = (wb_stb_i && wb_cyc_i);
  wire slave_write_en = (|wb_sel_i && wb_we_i);

  wire div_sel = (wb_adr_i[7:0] == DIV_ADDR);
  wire cntmax_sel = (wb_adr_i[7:0] == CNTMAX_ADDR);
  wire cnt_sel = (wb_adr_i[7:0] == CNT_ADDR);
  wire cmp_sel = (wb_adr_i[7:0] == CMP_ADDR);

  // CSR regs.
  reg [DIV_BITS-1:0] div_reg;
  reg [CNT_BITS-1:0] cntmax_reg;
  reg [CNT_BITS-1:0] cmp_reg;

  // Captured regs.
  reg [CNT_BITS-1:0] cmp_captured;

  // Counters.
  reg [DIV_BITS-1:0] div_cnt;
  reg [CNT_BITS-1:0] cnt_cnt;

  // CSRs.
  always @(posedge clk or negedge resetb) begin
    if (!resetb) begin
      div_reg <= {DIV_BITS{1'b0}};
      cntmax_reg <= {CNT_BITS{1'b0}};
      cmp_reg <= {CNT_BITS{1'b0}};
    end else begin
      wb_ack_o <= 1'b0;
      if (slave_sel && !wb_ack_o && slave_write_en) begin
        wb_ack_o <= 1'b1;
        if (div_sel) begin
          div_reg <= wb_dat_i[DIV_BITS-1:0];
        end else if (cntmax_sel) begin
          cntmax_reg <= wb_dat_i[CNT_BITS-1:0];
        end else if (cmp_sel) begin
          cmp_reg <= wb_dat_i[CNT_BITS-1:0];
        end
      end
      if (slave_sel && !wb_ack_o && !slave_write_en) begin
        wb_ack_o <= 1'b1;
        if (cnt_sel) begin
          wb_dat_o <= cnt_cnt;
        end
      end
    end
  end

  // DIV counter.
  reg div_match;
  always @(posedge clk or negedge resetb) begin
    if (!resetb) begin
      div_cnt <= {DIV_BITS{1'b0}};
      div_match <= 1'b0;
    end else begin
      if (div_cnt == div_reg) begin
        div_match <= 1'b1;
        div_cnt <= {DIV_BITS{1'b0}};
      end else begin
        div_match <= 1'b0;
        div_cnt <= div_cnt + 1'b1;
      end
    end
  end

  // CNT counter.
  always @(posedge clk or negedge resetb) begin
    if (!resetb) begin
      cnt_cnt <= {CNT_BITS{1'b0}};
    end else begin
      if (!div_match) begin
      end else if (cnt_cnt == cntmax_reg) begin
        cnt_cnt <= {CNT_BITS{1'b0}};
      end else begin
        cnt_cnt <= cnt_cnt + 1'b1;
      end
    end
  end

  // Capture new cmp value at end of cycle.
  always @(posedge clk or negedge resetb) begin
    if (!resetb) begin
      cmp_captured <= {CNT_BITS{1'b0}};
    end else begin
      if (cnt_cnt == cntmax_reg) begin
        cmp_captured <= cmp_reg;
      end
    end
  end

  // Compare.
  always @(posedge clk or negedge resetb) begin
    if (!resetb) begin
      pwm_out <= 1'b0;
    end else begin
      pwm_out <= cnt_cnt < cmp_captured;
    end
  end

endmodule // module pwm_wb

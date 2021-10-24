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

module ringosc_macro #(
  parameter TRIM_BITS = 26
) (
`ifdef USE_POWER_PINS
    inout vccd1,
    inout vssd1,
`endif

  input start,
  input [TRIM_BITS-1:0] trim_a,
  input [2:0] clkmux,

  output clk_out
);

  wire [1:0] clockp;
  wire clk = clockp[0];

  ring_osc2x13 ring (
    .reset(~start),
    .trim(trim_a),
    .clockp(clockp)
  );

  // Clock dividers.
  reg s0;
  always @(posedge clk or negedge start) begin
    if (!start) begin
      s0 <= 1'b0;
    end else begin
      s0 <= ~s0;
    end
  end

  reg s1;
  always @(posedge s0 or negedge start) begin
    if (!start) begin
      s1 <= 1'b0;
    end else begin
      s1 <= ~s1;
    end
  end

  reg s2;
  always @(posedge s1 or negedge start) begin
    if (!start) begin
      s2 <= 1'b0;
    end else begin
      s2 <= ~s2;
    end
  end

  assign clk_out = (clkmux == 3'b000) ? clk :
                   (clkmux == 3'b001) ? s0  :
                   (clkmux == 3'b010) ? s1  :
                   (clkmux == 3'b011) ? s2  :
                   clk;

endmodule // module ringosc_macro

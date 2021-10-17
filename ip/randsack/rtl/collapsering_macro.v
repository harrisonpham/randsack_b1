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

module collapsering_macro #(
  parameter TRIM_BITS = 28
) (
`ifdef USE_POWER_PINS
    inout vccd1,
    inout vssd1,
`endif

  input start,
  input [TRIM_BITS-1:0] trim_a,
  input [TRIM_BITS-1:0] trim_b,
  input [2:0] clkmux,

  output clk_out
);

  collapsering ring (
    .CLKBUFOUT(clk_out),
    .START(start),
    .TRIMA(trim_a),
    .TRIMB(trim_b),
    .CLKMUX(clkmux)
  );

endmodule  // collapsering_macro

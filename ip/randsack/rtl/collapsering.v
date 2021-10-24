// Trimmable collapsing ring oscillator for TRNG.
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

module collapsering (
  output wire CLKBUFOUT,
  input wire START,
  input wire [27:0] TRIMA,
  input wire [27:0] TRIMB,
  input wire [2:0] CLKMUX
);

wire net1  ;
wire net2  ;
wire net3  ;
wire net4  ;
wire net5  ;
wire net6  ;
wire net7  ;
wire net8  ;
wire net9  ;
wire net20  ;
wire net21  ;
wire net22  ;
wire net23  ;
wire net24  ;
wire clk_ff0  ;
wire net25  ;
wire clk_ff1  ;
wire net26  ;
wire net40  ;
wire clk_ff2  ;
wire net27  ;
wire net41  ;
wire clk_ff3  ;
wire net28  ;
wire net42  ;
wire net29  ;
wire net10  ;
wire net11  ;
wire outa  ;
wire outb  ;
wire net12  ;
wire net13  ;
wire net14  ;
wire net15  ;
wire net16  ;
wire net17  ;
wire net30  ;
wire net18  ;
wire net31  ;
wire net19  ;
wire net32  ;
wire net33  ;
wire net34  ;
wire net35  ;
wire net36  ;
wire net37  ;
wire net38  ;
wire net39  ;

 sky130_fd_sc_hd__nand2_4
#(
)
x21 (
`ifdef USE_POWER_PINS
.VGND ( VGND ) ,
.VNB ( VNB ) ,
.VPB ( VPB ) ,
.VPWR ( VPWR ) ,
`endif

 .A( outb ),
 .B( net25 ),
 .Y( net1 )
);


sky130_fd_sc_hd__nand2_4
#(
)
x47 (
`ifdef USE_POWER_PINS
.VGND ( VGND ) ,
.VNB ( VNB ) ,
.VPB ( VPB ) ,
.VPWR ( VPWR ) ,
`endif

 .A( net25 ),
 .B( outa ),
 .Y( net16 )
);


sky130_fd_sc_hd__clkbuf_8
#(
)
x35 (
`ifdef USE_POWER_PINS
.VGND ( VGND ) ,
.VNB ( VNB ) ,
.VPB ( VPB ) ,
.VPWR ( VPWR ) ,
`endif

 .A( net38 ),
 .X( CLKBUFOUT )
);


triminv
x1 (
 .OUT( net2 ),
 .IN( net1 ),
 .TRIM0( TRIMA[0] ),
 .TRIM1( TRIMA[1] )
);


triminv
x2 (
 .OUT( net3 ),
 .IN( net2 ),
 .TRIM0( TRIMA[2] ),
 .TRIM1( TRIMA[3] )
);


triminv
x3 (
 .OUT( net4 ),
 .IN( net3 ),
 .TRIM0( TRIMA[4] ),
 .TRIM1( TRIMA[5] )
);


triminv
x4 (
 .OUT( net5 ),
 .IN( net4 ),
 .TRIM0( TRIMA[6] ),
 .TRIM1( TRIMA[7] )
);


triminv
x5 (
 .OUT( net6 ),
 .IN( net5 ),
 .TRIM0( TRIMA[8] ),
 .TRIM1( TRIMA[9] )
);


triminv
x6 (
 .OUT( net7 ),
 .IN( net6 ),
 .TRIM0( TRIMA[10] ),
 .TRIM1( TRIMA[11] )
);


triminv
x7 (
 .OUT( net8 ),
 .IN( net7 ),
 .TRIM0( TRIMA[12] ),
 .TRIM1( TRIMA[13] )
);


triminv
x8 (
 .OUT( net24 ),
 .IN( net8 ),
 .TRIM0( TRIMA[14] ),
 .TRIM1( TRIMA[15] )
);


triminv
x9 (
 .OUT( net17 ),
 .IN( net24 ),
 .TRIM0( TRIMA[16] ),
 .TRIM1( TRIMA[17] )
);


triminv
x10 (
 .OUT( net18 ),
 .IN( net17 ),
 .TRIM0( TRIMA[18] ),
 .TRIM1( TRIMA[19] )
);


triminv
x11 (
 .OUT( net19 ),
 .IN( net18 ),
 .TRIM0( TRIMA[20] ),
 .TRIM1( TRIMA[21] )
);


triminv
x12 (
 .OUT( net39 ),
 .IN( net19 ),
 .TRIM0( TRIMA[22] ),
 .TRIM1( TRIMA[23] )
);


triminv
x13 (
 .OUT( net9 ),
 .IN( net16 ),
 .TRIM0( TRIMB[0] ),
 .TRIM1( TRIMB[1] )
);


triminv
x14 (
 .OUT( net10 ),
 .IN( net9 ),
 .TRIM0( TRIMB[2] ),
 .TRIM1( TRIMB[3] )
);


triminv
x15 (
 .OUT( net11 ),
 .IN( net10 ),
 .TRIM0( TRIMB[4] ),
 .TRIM1( TRIMB[5] )
);


triminv
x16 (
 .OUT( net12 ),
 .IN( net11 ),
 .TRIM0( TRIMB[6] ),
 .TRIM1( TRIMB[7] )
);


triminv
x17 (
 .OUT( net13 ),
 .IN( net12 ),
 .TRIM0( TRIMB[8] ),
 .TRIM1( TRIMB[9] )
);


triminv
x18 (
 .OUT( net14 ),
 .IN( net13 ),
 .TRIM0( TRIMB[10] ),
 .TRIM1( TRIMB[11] )
);


triminv
x19 (
 .OUT( net15 ),
 .IN( net14 ),
 .TRIM0( TRIMB[12] ),
 .TRIM1( TRIMB[13] )
);


triminv
x20 (
 .OUT( net23 ),
 .IN( net15 ),
 .TRIM0( TRIMB[14] ),
 .TRIM1( TRIMB[15] )
);


triminv
x22 (
 .OUT( net20 ),
 .IN( net23 ),
 .TRIM0( TRIMB[16] ),
 .TRIM1( TRIMB[17] )
);


triminv
x23 (
 .OUT( net21 ),
 .IN( net20 ),
 .TRIM0( TRIMB[18] ),
 .TRIM1( TRIMB[19] )
);


triminv
x24 (
 .OUT( net22 ),
 .IN( net21 ),
 .TRIM0( TRIMB[20] ),
 .TRIM1( TRIMB[21] )
);


triminv
x25 (
 .OUT( net41 ),
 .IN( net22 ),
 .TRIM0( TRIMB[22] ),
 .TRIM1( TRIMB[23] )
);


sky130_fd_sc_hd__dfxbp_2
#(
)
x27 (
`ifdef USE_POWER_PINS
.VGND ( VGND ) ,
.VNB ( VNB ) ,
.VPB ( VPB ) ,
.VPWR ( VPWR ) ,
`endif

 .CLK( clk_ff0 ),
 .D( net27 ),
 .Q( clk_ff1 ),
 .Q_N( net27 )
);


sky130_fd_sc_hd__dfxbp_2
#(
)
x28 (
`ifdef USE_POWER_PINS
.VGND ( VGND ) ,
.VNB ( VNB ) ,
.VPB ( VPB ) ,
.VPWR ( VPWR ) ,
`endif

 .CLK( clk_ff0 ),
 .D( net28 ),
 .Q( net26 ),
 .Q_N( net28 )
);


sky130_fd_sc_hd__dfxbp_2
#(
)
x29 (
`ifdef USE_POWER_PINS
.VGND ( VGND ) ,
.VNB ( VNB ) ,
.VPB ( VPB ) ,
.VPWR ( VPWR ) ,
`endif

 .CLK( net26 ),
 .D( net29 ),
 .Q( clk_ff2 ),
 .Q_N( net29 )
);


sky130_fd_sc_hd__clkbuf_8
#(
)
x26 (
`ifdef USE_POWER_PINS
.VGND ( VGND ) ,
.VNB ( VNB ) ,
.VPB ( VPB ) ,
.VPWR ( VPWR ) ,
`endif

 .A( net30 ),
 .X( clk_ff0 )
);


sky130_fd_sc_hd__mux4_2
#(
)
x30 (
`ifdef USE_POWER_PINS
.VGND ( VGND ) ,
.VNB ( VNB ) ,
.VPB ( VPB ) ,
.VPWR ( VPWR ) ,
`endif

 .A0( clk_ff0 ),
 .A1( clk_ff1 ),
 .A2( clk_ff2 ),
 .A3( clk_ff3 ),
 .S0( CLKMUX[0] ),
 .S1( CLKMUX[1] ),
 .X( net38 )
);


sky130_fd_sc_hd__dfxbp_2
#(
)
x31 (
`ifdef USE_POWER_PINS
.VGND ( VGND ) ,
.VNB ( VNB ) ,
.VPB ( VPB ) ,
.VPWR ( VPWR ) ,
`endif

 .CLK( clk_ff0 ),
 .D( net32 ),
 .Q( net31 ),
 .Q_N( net32 )
);


sky130_fd_sc_hd__dfxbp_2
#(
)
x32 (
`ifdef USE_POWER_PINS
.VGND ( VGND ) ,
.VNB ( VNB ) ,
.VPB ( VPB ) ,
.VPWR ( VPWR ) ,
`endif

 .CLK( net31 ),
 .D( net33 ),
 .Q( net34 ),
 .Q_N( net33 )
);


sky130_fd_sc_hd__dfxbp_2
#(
)
x33 (
`ifdef USE_POWER_PINS
.VGND ( VGND ) ,
.VNB ( VNB ) ,
.VPB ( VPB ) ,
.VPWR ( VPWR ) ,
`endif

 .CLK( net34 ),
 .D( net35 ),
 .Q( clk_ff3 ),
 .Q_N( net35 )
);


sky130_fd_sc_hd__mux2_2
#(
)
x34 (
`ifdef USE_POWER_PINS
.VGND ( VGND ) ,
.VNB ( VNB ) ,
.VPB ( VPB ) ,
.VPWR ( VPWR ) ,
`endif

 .A0( net36 ),
 .A1( net37 ),
 .S( CLKMUX[2] ),
 .X( net30 )
);


sky130_fd_sc_hd__clkbuf_2
#(
)
x36 (
`ifdef USE_POWER_PINS
.VGND ( VGND ) ,
.VNB ( VNB ) ,
.VPB ( VPB ) ,
.VPWR ( VPWR ) ,
`endif

 .A( outb ),
 .X( net36 )
);


sky130_fd_sc_hd__clkbuf_2
#(
)
x37 (
`ifdef USE_POWER_PINS
.VGND ( VGND ) ,
.VNB ( VNB ) ,
.VPB ( VPB ) ,
.VPWR ( VPWR ) ,
`endif

 .A( outa ),
 .X( net37 )
);


sky130_fd_sc_hd__clkbuf_2
#(
)
x38 (
`ifdef USE_POWER_PINS
.VGND ( VGND ) ,
.VNB ( VNB ) ,
.VPB ( VPB ) ,
.VPWR ( VPWR ) ,
`endif

 .A( START ),
 .X( net25 )
);


triminv
x39 (
 .OUT( net40 ),
 .IN( net39 ),
 .TRIM0( TRIMA[24] ),
 .TRIM1( TRIMA[25] )
);


triminv
x40 (
 .OUT( outa ),
 .IN( net40 ),
 .TRIM0( TRIMA[26] ),
 .TRIM1( TRIMA[27] )
);


triminv
x41 (
 .OUT( net42 ),
 .IN( net41 ),
 .TRIM0( TRIMB[24] ),
 .TRIM1( TRIMB[25] )
);


triminv
x42 (
 .OUT( outb ),
 .IN( net42 ),
 .TRIM0( TRIMB[26] ),
 .TRIM1( TRIMB[27] )
);

endmodule

// expanding   symbol:  /home/harrison/workspace/randsack/ip/randsack/sch/triminv.sym # of pins=4
// sym_path: /home/harrison/workspace/randsack/ip/randsack/sch/triminv.sym
// sch_path: /home/harrison/workspace/randsack/ip/randsack/sch/triminv.sch
module triminv (
  input wire OUT,
  input wire IN,
  input wire TRIM0,
  input wire TRIM1
);

wire d0  ;
wire d1  ;
wire d2  ;
wire ts  ;


sky130_fd_sc_hd__clkbuf_2
#(
)
x1 (
`ifdef USE_POWER_PINS
.VGND ( VGND ) ,
.VNB ( VNB ) ,
.VPB ( VPB ) ,
.VPWR ( VPWR ) ,
`endif

 .A( IN ),
 .X( ts )
);


sky130_fd_sc_hd__einvn_4
#(
)
x2 (
`ifdef USE_POWER_PINS
.VGND ( VGND ) ,
.VNB ( VNB ) ,
.VPB ( VPB ) ,
.VPWR ( VPWR ) ,
`endif

 .A( ts ),
 .TE_B( TRIM1 ),
 .Z( d1 )
);


sky130_fd_sc_hd__clkinv_1
#(
)
x3 (
`ifdef USE_POWER_PINS
.VGND ( VGND ) ,
.VNB ( VNB ) ,
.VPB ( VPB ) ,
.VPWR ( VPWR ) ,
`endif

 .A( d1 ),
 .Y( d2 )
);


sky130_fd_sc_hd__einvp_2
#(
)
x4 (
`ifdef USE_POWER_PINS
.VGND ( VGND ) ,
.VNB ( VNB ) ,
.VPB ( VPB ) ,
.VPWR ( VPWR ) ,
`endif

 .A( d2 ),
 .TE( TRIM0 ),
 .Z( OUT )
);


sky130_fd_sc_hd__clkbuf_1
#(
)
x5 (
`ifdef USE_POWER_PINS
.VGND ( VGND ) ,
.VNB ( VNB ) ,
.VPB ( VPB ) ,
.VPWR ( VPWR ) ,
`endif

 .A( ts ),
 .X( d0 )
);


sky130_fd_sc_hd__einvp_2
#(
)
x6 (
`ifdef USE_POWER_PINS
.VGND ( VGND ) ,
.VNB ( VNB ) ,
.VPB ( VPB ) ,
.VPWR ( VPWR ) ,
`endif

 .A( d0 ),
 .TE( TRIM1 ),
 .Z( d1 )
);


sky130_fd_sc_hd__einvn_8
#(
)
x7 (
`ifdef USE_POWER_PINS
.VGND ( VGND ) ,
.VNB ( VNB ) ,
.VPB ( VPB ) ,
.VPWR ( VPWR ) ,
`endif

 .A( ts ),
 .TE_B( TRIM0 ),
 .Z( OUT )
);

endmodule

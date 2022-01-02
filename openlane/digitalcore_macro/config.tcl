# AUTO GENERATED - DO NOT MODIFY THIS FILE
#
# icgen generated file
# input:        /home/harrison/workspace/randsack_b1/openlane/digitalcore_macro/config.tclp
# input sha256: c8236fbf342bd1e6adc9d3cc76830d9e12a25e6aeed78421947ad63e21846945
# output:       /home/harrison/workspace/randsack_b1/openlane/digitalcore_macro/config.tcl
# ran at:       2022-01-01T21:01:53-08:00
# icgen ver:    19e3b7c
#
# AUTO GENERATED - DO NOT MODIFY THIS FILE

# SPDX-FileCopyrightText: 2020 Efabless Corporation
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
# SPDX-License-Identifier: Apache-2.0


set script_dir [file dirname [file normalize [info script]]]

set ::env(DESIGN_NAME) digitalcore_macro

set ::env(VERILOG_FILES) "\
	$::env(CARAVEL_ROOT)/verilog/rtl/defines.v \
	$script_dir/../../ip/randsack/rtl/digitalcore_macro.v \
	$script_dir/../../ip/randsack/rtl/pwm_wb.v \
	$script_dir/../../ip/third_party/picorv32_wb/gpio32_wb.v \
	$script_dir/../../ip/third_party/picorv32_wb/simpleuart_div16_wb.v \
	$script_dir/../../ip/third_party/verilog-wishbone/rtl/wb_mux_29.v \
	$script_dir/../../ip/randsack/rtl/ring_control.v"

# Skip DRC for testing.
# set ::env(RUN_KLAYOUT_XOR) 0
# set ::env(RUN_KLAYOUT_DRC) 0
# set ::env(MAGIC_DRC_USE_GDS) 0

set ::env(DESIGN_IS_CORE) 0

set ::env(SDC_FILE) "$script_dir/base.sdc"
set ::env(BASE_SDC_FILE) "$script_dir/base.sdc"

# NOTE: Make sure to add all clocks manually to base.sdc!
set ::env(CLOCK_PORT) "wb_clk_i ring0_clk ring1_clk \
                        ring2_clk ring3_clk ring4_clk ring5_clk ring6_clk ring7_clk ring8_clk ring9_clk ring10_clk ring11_clk ring12_clk ring13_clk ring14_clk ring15_clk ring16_clk ring17_clk ring18_clk ring19_clk ring20_clk ring21_clk ring22_clk"
set ::env(CLOCK_PERIOD) "25"

# Various options to tweak if there are slew / hold issues.
# set ::env(FP_CORE_UTIL) 15
# set ::env(PL_RESIZER_TIMING_OPTIMIZATIONS) 1
# set ::env(GLB_RESIZER_TIMING_OPTIMIZATIONS) 1
# set ::env(PL_RESIZER_SETUP_SLACK_MARGIN) 0.1
set ::env(PL_RESIZER_HOLD_SLACK_MARGIN) 0.5
# set ::env(GLB_RESIZER_SETUP_SLACK_MARGIN) 0.1
set ::env(GLB_RESIZER_HOLD_SLACK_MARGIN) 0.5
set ::env(GLB_RESIZER_HOLD_MAX_BUFFER_PERCENT) 90
set ::env(PL_RESIZER_HOLD_MAX_BUFFER_PERCENT) 90
# set ::env(GLB_RESIZER_SETUP_MAX_BUFFER_PERCENT) 90
# set ::env(PL_RESIZER_SETUP_MAX_BUFFER_PERCENT) 90
# set ::env(PL_RESIZER_ALLOW_SETUP_VIOS) 1
# set ::env(GLB_RESIZER_ALLOW_SETUP_VIOS) 1
# set ::env(SYNTH_MAX_FANOUT) 4
# set ::env(CLOCK_BUFFER_FANOUT) 12
# set ::env(CTS_CLK_BUFFER_LIST) "sky130_fd_sc_hd__clkbuf_4 sky130_fd_sc_hd__clkbuf_8"

set ::env(FP_SIZING) absolute
set ::env(DIE_AREA) "0 0 500 1000"

set ::env(FP_PIN_ORDER_CFG) $script_dir/pin_order.cfg

# set ::env(PL_TIME_DRIVEN) 1
set ::env(PL_TARGET_DENSITY) 0.4

# Maximum layer used for routing is metal 4.
# This is because this macro will be inserted in a top level (user_project_wrapper)
# where the PDN is planned on metal 5. So, to avoid having shorts between routes
# in this macro and the top level metal 5 stripes, we have to restrict routes to metal4.
set ::env(GLB_RT_MAXLAYER) 5

# You can draw more power domains if you need to
set ::env(VDD_NETS) [list {vccd1}]
set ::env(GND_NETS) [list {vssd1}]

set ::env(DIODE_INSERTION_STRATEGY) 4
# If you're going to use multiple power domains, then disable cvc run.
set ::env(RUN_CVC) 1

set ::env(ROUTING_CORES) 10

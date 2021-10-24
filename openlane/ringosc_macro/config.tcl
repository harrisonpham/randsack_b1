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

set ::env(DESIGN_NAME) ringosc_macro

set ::env(VERILOG_FILES) "\
	$script_dir/../../ip/randsack/rtl/ringosc_macro.v \
	$script_dir/../../ip/third_party/caravel/ring_osc2x13.v"

# Preserve manually instantiated stdcells.
set ::env(SYNTH_READ_BLACKBOX_LIB) 1

# Disable optimizations and CTS to preserve our hand picked stdcells.
set ::env(SYNTH_BUFFERING) 0
set ::env(SYNTH_SIZING) 0
set ::env(SYNTH_SHARE_RESOURCES) 0
set ::env(CLOCK_TREE_SYNTH) 0
set ::env(PL_RESIZER_DESIGN_OPTIMIZATIONS) 0
set ::env(PL_RESIZER_TIMING_OPTIMIZATIONS) 0
set ::env(PL_OPENPHYSYN_OPTIMIZATIONS) 0
set ::env(GLB_RESIZER_TIMING_OPTIMIZATIONS) 0

set ::env(DESIGN_IS_CORE) 0

# TODO(hdpham): Properly disable STA.
set ::env(CLOCK_PORT) "clk_out"
# set ::env(CLOCK_NET) "ring.clk_ff0"
set ::env(CLOCK_PERIOD) "10"

set ::env(FP_SIZING) absolute
# 70 70 is optimal but won't fit in PDN.
set ::env(DIE_AREA) "0 0 50 150"

set ::env(FP_PIN_ORDER_CFG) $script_dir/pin_order.cfg

set ::env(PL_BASIC_PLACEMENT) 1
set ::env(PL_TARGET_DENSITY) 0.75

# Maximum layer used for routing is metal 4.
# This is because this macro will be inserted in a top level (user_project_wrapper)
# where the PDN is planned on metal 5. So, to avoid having shorts between routes
# in this macro and the top level metal 5 stripes, we have to restrict routes to metal4.
# TODO(hdpham): Figure out why blocking li1 doesn't work.
#set ::env(GLB_RT_MINLAYER) 2
set ::env(GLB_RT_MAXLAYER) 5

# Really force the router to not use li1/met5.
#set ::env(GLB_RT_OBS) "li1 0 0 50 200, met5 0 0 50 200"

# You can draw more power domains if you need to
set ::env(VDD_NETS) [list {vccd1}]
set ::env(GND_NETS) [list {vssd1}]

set ::env(DIODE_INSERTION_STRATEGY) 4
# If you're going to use multiple power domains, then disable cvc run.
set ::env(RUN_CVC) 1

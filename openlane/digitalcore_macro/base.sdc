# AUTO GENERATED - DO NOT MODIFY THIS FILE
#
# icgen generated file
# input:        /home/harrison/workspace/randsack_b1/openlane/digitalcore_macro/base.sdcp
# input sha256: 090cf62d79b90714518155fa0cfde060cbe887ea0d6bcd9ff7e2cc040a2fa8f9
# output:       /home/harrison/workspace/randsack_b1/openlane/digitalcore_macro/base.sdc
# ran at:       2022-01-01T21:01:54-08:00
# icgen ver:    19e3b7c
#
# AUTO GENERATED - DO NOT MODIFY THIS FILE

# Randsack digital top macro timing constraints.
#
# SPDX-FileCopyrightText: (c) 2021 Harrison Pham <harrison@harrisonpham.com>
# SPDX-License-Identifier: Apache-2.0
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


set ::env(WB_CLOCK_PERIOD)    "25"
set ::env(WB_CLOCK_PORT)      "wb_clk_i"

set ::env(RING0_CLOCK_PERIOD) "5"
set ::env(RING0_CLOCK_PORT)   "ring0_clk"

set ::env(RING1_CLOCK_PERIOD) "5"
set ::env(RING1_CLOCK_PORT)   "ring1_clk"

    set ::env(RING2_CLOCK_PERIOD) "5"
    set ::env(RING2_CLOCK_PORT)   "ring2_clk"
    set ::env(RING3_CLOCK_PERIOD) "5"
    set ::env(RING3_CLOCK_PORT)   "ring3_clk"
    set ::env(RING4_CLOCK_PERIOD) "5"
    set ::env(RING4_CLOCK_PORT)   "ring4_clk"
    set ::env(RING5_CLOCK_PERIOD) "5"
    set ::env(RING5_CLOCK_PORT)   "ring5_clk"
    set ::env(RING6_CLOCK_PERIOD) "5"
    set ::env(RING6_CLOCK_PORT)   "ring6_clk"
    set ::env(RING7_CLOCK_PERIOD) "5"
    set ::env(RING7_CLOCK_PORT)   "ring7_clk"
    set ::env(RING8_CLOCK_PERIOD) "5"
    set ::env(RING8_CLOCK_PORT)   "ring8_clk"
    set ::env(RING9_CLOCK_PERIOD) "5"
    set ::env(RING9_CLOCK_PORT)   "ring9_clk"
    set ::env(RING10_CLOCK_PERIOD) "5"
    set ::env(RING10_CLOCK_PORT)   "ring10_clk"
    set ::env(RING11_CLOCK_PERIOD) "5"
    set ::env(RING11_CLOCK_PORT)   "ring11_clk"
    set ::env(RING12_CLOCK_PERIOD) "5"
    set ::env(RING12_CLOCK_PORT)   "ring12_clk"
    set ::env(RING13_CLOCK_PERIOD) "5"
    set ::env(RING13_CLOCK_PORT)   "ring13_clk"
    set ::env(RING14_CLOCK_PERIOD) "5"
    set ::env(RING14_CLOCK_PORT)   "ring14_clk"
    set ::env(RING15_CLOCK_PERIOD) "5"
    set ::env(RING15_CLOCK_PORT)   "ring15_clk"
    set ::env(RING16_CLOCK_PERIOD) "5"
    set ::env(RING16_CLOCK_PORT)   "ring16_clk"
    set ::env(RING17_CLOCK_PERIOD) "5"
    set ::env(RING17_CLOCK_PORT)   "ring17_clk"
    set ::env(RING18_CLOCK_PERIOD) "5"
    set ::env(RING18_CLOCK_PORT)   "ring18_clk"
    set ::env(RING19_CLOCK_PERIOD) "5"
    set ::env(RING19_CLOCK_PORT)   "ring19_clk"
    set ::env(RING20_CLOCK_PERIOD) "5"
    set ::env(RING20_CLOCK_PORT)   "ring20_clk"
    set ::env(RING21_CLOCK_PERIOD) "5"
    set ::env(RING21_CLOCK_PORT)   "ring21_clk"
    set ::env(RING22_CLOCK_PERIOD) "5"
    set ::env(RING22_CLOCK_PORT)   "ring22_clk"

if {[info exists ::env(WB_CLOCK_PORT)] && $::env(WB_CLOCK_PORT) != ""} {
    create_clock [get_ports $::env(WB_CLOCK_PORT)]  -name $::env(WB_CLOCK_PORT)  -period $::env(CLOCK_PERIOD)
} else {
    create_clock -name VIRTUAL_CLK -period $::env(CLOCK_PERIOD)
    set ::env(WB_CLOCK_PORT) VIRTUAL_CLK
}
set input_delay_value [expr $::env(CLOCK_PERIOD) * $::env(IO_PCT)]
set output_delay_value [expr $::env(CLOCK_PERIOD) * $::env(IO_PCT)]
puts "\[INFO\]: Setting output delay to: $output_delay_value"
puts "\[INFO\]: Setting input delay to: $input_delay_value"

set_max_fanout $::env(SYNTH_MAX_FANOUT) [current_design]

set clk_indx [lsearch [all_inputs] [get_port $::env(WB_CLOCK_PORT)]]
#set rst_indx [lsearch [all_inputs] [get_port resetn]]
set all_inputs_wo_clk [lreplace [all_inputs] $clk_indx $clk_indx]
#set all_inputs_wo_clk_rst [lreplace $all_inputs_wo_clk $rst_indx $rst_indx]
set all_inputs_wo_clk_rst $all_inputs_wo_clk


# correct resetn
set_input_delay $input_delay_value  -clock [get_clocks $::env(WB_CLOCK_PORT)] $all_inputs_wo_clk_rst
#set_input_delay 0.0 -clock [get_clocks $::env(WB_CLOCK_PORT)] {resetn}
set_output_delay $output_delay_value  -clock [get_clocks $::env(WB_CLOCK_PORT)] [all_outputs]

# TODO set this as parameter
set_driving_cell -lib_cell $::env(SYNTH_DRIVING_CELL) -pin $::env(SYNTH_DRIVING_CELL_PIN) [all_inputs]
set cap_load [expr $::env(SYNTH_CAP_LOAD) / 1000.0]
puts "\[INFO\]: Setting load to: $cap_load"
set_load  $cap_load [all_outputs]

# Extra clocks for macros.
# NOTE: These don't need any input/output delays since this design just uses it for clock counting.
create_clock [get_ports $::env(RING0_CLOCK_PORT)] -name $::env(RING0_CLOCK_PORT) -period $::env(RING0_CLOCK_PERIOD)
create_clock [get_ports $::env(RING1_CLOCK_PORT)] -name $::env(RING1_CLOCK_PORT) -period $::env(RING1_CLOCK_PERIOD)

set_false_path -from [get_clocks $::env(WB_CLOCK_PORT)] -to [get_clocks $::env(RING0_CLOCK_PORT)]
set_false_path -from [get_clocks $::env(WB_CLOCK_PORT)] -to [get_clocks $::env(RING1_CLOCK_PORT)]

set_false_path -from [get_clocks $::env(RING0_CLOCK_PORT)] -to [get_clocks $::env(WB_CLOCK_PORT)]
set_false_path -from [get_clocks $::env(RING1_CLOCK_PORT)] -to [get_clocks $::env(WB_CLOCK_PORT)]

create_clock [get_ports $::env(RING2_CLOCK_PORT)] -name $::env(RING2_CLOCK_PORT) -period $::env(RING2_CLOCK_PERIOD)

set_false_path -from [get_clocks $::env(RING2_CLOCK_PORT)] -to [get_clocks $::env(WB_CLOCK_PORT)]
set_false_path -from [get_clocks $::env(WB_CLOCK_PORT)] -to [get_clocks $::env(RING2_CLOCK_PORT)]
create_clock [get_ports $::env(RING3_CLOCK_PORT)] -name $::env(RING3_CLOCK_PORT) -period $::env(RING3_CLOCK_PERIOD)

set_false_path -from [get_clocks $::env(RING3_CLOCK_PORT)] -to [get_clocks $::env(WB_CLOCK_PORT)]
set_false_path -from [get_clocks $::env(WB_CLOCK_PORT)] -to [get_clocks $::env(RING3_CLOCK_PORT)]
create_clock [get_ports $::env(RING4_CLOCK_PORT)] -name $::env(RING4_CLOCK_PORT) -period $::env(RING4_CLOCK_PERIOD)

set_false_path -from [get_clocks $::env(RING4_CLOCK_PORT)] -to [get_clocks $::env(WB_CLOCK_PORT)]
set_false_path -from [get_clocks $::env(WB_CLOCK_PORT)] -to [get_clocks $::env(RING4_CLOCK_PORT)]
create_clock [get_ports $::env(RING5_CLOCK_PORT)] -name $::env(RING5_CLOCK_PORT) -period $::env(RING5_CLOCK_PERIOD)

set_false_path -from [get_clocks $::env(RING5_CLOCK_PORT)] -to [get_clocks $::env(WB_CLOCK_PORT)]
set_false_path -from [get_clocks $::env(WB_CLOCK_PORT)] -to [get_clocks $::env(RING5_CLOCK_PORT)]
create_clock [get_ports $::env(RING6_CLOCK_PORT)] -name $::env(RING6_CLOCK_PORT) -period $::env(RING6_CLOCK_PERIOD)

set_false_path -from [get_clocks $::env(RING6_CLOCK_PORT)] -to [get_clocks $::env(WB_CLOCK_PORT)]
set_false_path -from [get_clocks $::env(WB_CLOCK_PORT)] -to [get_clocks $::env(RING6_CLOCK_PORT)]
create_clock [get_ports $::env(RING7_CLOCK_PORT)] -name $::env(RING7_CLOCK_PORT) -period $::env(RING7_CLOCK_PERIOD)

set_false_path -from [get_clocks $::env(RING7_CLOCK_PORT)] -to [get_clocks $::env(WB_CLOCK_PORT)]
set_false_path -from [get_clocks $::env(WB_CLOCK_PORT)] -to [get_clocks $::env(RING7_CLOCK_PORT)]
create_clock [get_ports $::env(RING8_CLOCK_PORT)] -name $::env(RING8_CLOCK_PORT) -period $::env(RING8_CLOCK_PERIOD)

set_false_path -from [get_clocks $::env(RING8_CLOCK_PORT)] -to [get_clocks $::env(WB_CLOCK_PORT)]
set_false_path -from [get_clocks $::env(WB_CLOCK_PORT)] -to [get_clocks $::env(RING8_CLOCK_PORT)]
create_clock [get_ports $::env(RING9_CLOCK_PORT)] -name $::env(RING9_CLOCK_PORT) -period $::env(RING9_CLOCK_PERIOD)

set_false_path -from [get_clocks $::env(RING9_CLOCK_PORT)] -to [get_clocks $::env(WB_CLOCK_PORT)]
set_false_path -from [get_clocks $::env(WB_CLOCK_PORT)] -to [get_clocks $::env(RING9_CLOCK_PORT)]
create_clock [get_ports $::env(RING10_CLOCK_PORT)] -name $::env(RING10_CLOCK_PORT) -period $::env(RING10_CLOCK_PERIOD)

set_false_path -from [get_clocks $::env(RING10_CLOCK_PORT)] -to [get_clocks $::env(WB_CLOCK_PORT)]
set_false_path -from [get_clocks $::env(WB_CLOCK_PORT)] -to [get_clocks $::env(RING10_CLOCK_PORT)]
create_clock [get_ports $::env(RING11_CLOCK_PORT)] -name $::env(RING11_CLOCK_PORT) -period $::env(RING11_CLOCK_PERIOD)

set_false_path -from [get_clocks $::env(RING11_CLOCK_PORT)] -to [get_clocks $::env(WB_CLOCK_PORT)]
set_false_path -from [get_clocks $::env(WB_CLOCK_PORT)] -to [get_clocks $::env(RING11_CLOCK_PORT)]
create_clock [get_ports $::env(RING12_CLOCK_PORT)] -name $::env(RING12_CLOCK_PORT) -period $::env(RING12_CLOCK_PERIOD)

set_false_path -from [get_clocks $::env(RING12_CLOCK_PORT)] -to [get_clocks $::env(WB_CLOCK_PORT)]
set_false_path -from [get_clocks $::env(WB_CLOCK_PORT)] -to [get_clocks $::env(RING12_CLOCK_PORT)]
create_clock [get_ports $::env(RING13_CLOCK_PORT)] -name $::env(RING13_CLOCK_PORT) -period $::env(RING13_CLOCK_PERIOD)

set_false_path -from [get_clocks $::env(RING13_CLOCK_PORT)] -to [get_clocks $::env(WB_CLOCK_PORT)]
set_false_path -from [get_clocks $::env(WB_CLOCK_PORT)] -to [get_clocks $::env(RING13_CLOCK_PORT)]
create_clock [get_ports $::env(RING14_CLOCK_PORT)] -name $::env(RING14_CLOCK_PORT) -period $::env(RING14_CLOCK_PERIOD)

set_false_path -from [get_clocks $::env(RING14_CLOCK_PORT)] -to [get_clocks $::env(WB_CLOCK_PORT)]
set_false_path -from [get_clocks $::env(WB_CLOCK_PORT)] -to [get_clocks $::env(RING14_CLOCK_PORT)]
create_clock [get_ports $::env(RING15_CLOCK_PORT)] -name $::env(RING15_CLOCK_PORT) -period $::env(RING15_CLOCK_PERIOD)

set_false_path -from [get_clocks $::env(RING15_CLOCK_PORT)] -to [get_clocks $::env(WB_CLOCK_PORT)]
set_false_path -from [get_clocks $::env(WB_CLOCK_PORT)] -to [get_clocks $::env(RING15_CLOCK_PORT)]
create_clock [get_ports $::env(RING16_CLOCK_PORT)] -name $::env(RING16_CLOCK_PORT) -period $::env(RING16_CLOCK_PERIOD)

set_false_path -from [get_clocks $::env(RING16_CLOCK_PORT)] -to [get_clocks $::env(WB_CLOCK_PORT)]
set_false_path -from [get_clocks $::env(WB_CLOCK_PORT)] -to [get_clocks $::env(RING16_CLOCK_PORT)]
create_clock [get_ports $::env(RING17_CLOCK_PORT)] -name $::env(RING17_CLOCK_PORT) -period $::env(RING17_CLOCK_PERIOD)

set_false_path -from [get_clocks $::env(RING17_CLOCK_PORT)] -to [get_clocks $::env(WB_CLOCK_PORT)]
set_false_path -from [get_clocks $::env(WB_CLOCK_PORT)] -to [get_clocks $::env(RING17_CLOCK_PORT)]
create_clock [get_ports $::env(RING18_CLOCK_PORT)] -name $::env(RING18_CLOCK_PORT) -period $::env(RING18_CLOCK_PERIOD)

set_false_path -from [get_clocks $::env(RING18_CLOCK_PORT)] -to [get_clocks $::env(WB_CLOCK_PORT)]
set_false_path -from [get_clocks $::env(WB_CLOCK_PORT)] -to [get_clocks $::env(RING18_CLOCK_PORT)]
create_clock [get_ports $::env(RING19_CLOCK_PORT)] -name $::env(RING19_CLOCK_PORT) -period $::env(RING19_CLOCK_PERIOD)

set_false_path -from [get_clocks $::env(RING19_CLOCK_PORT)] -to [get_clocks $::env(WB_CLOCK_PORT)]
set_false_path -from [get_clocks $::env(WB_CLOCK_PORT)] -to [get_clocks $::env(RING19_CLOCK_PORT)]
create_clock [get_ports $::env(RING20_CLOCK_PORT)] -name $::env(RING20_CLOCK_PORT) -period $::env(RING20_CLOCK_PERIOD)

set_false_path -from [get_clocks $::env(RING20_CLOCK_PORT)] -to [get_clocks $::env(WB_CLOCK_PORT)]
set_false_path -from [get_clocks $::env(WB_CLOCK_PORT)] -to [get_clocks $::env(RING20_CLOCK_PORT)]
create_clock [get_ports $::env(RING21_CLOCK_PORT)] -name $::env(RING21_CLOCK_PORT) -period $::env(RING21_CLOCK_PERIOD)

set_false_path -from [get_clocks $::env(RING21_CLOCK_PORT)] -to [get_clocks $::env(WB_CLOCK_PORT)]
set_false_path -from [get_clocks $::env(WB_CLOCK_PORT)] -to [get_clocks $::env(RING21_CLOCK_PORT)]
create_clock [get_ports $::env(RING22_CLOCK_PORT)] -name $::env(RING22_CLOCK_PORT) -period $::env(RING22_CLOCK_PERIOD)

set_false_path -from [get_clocks $::env(RING22_CLOCK_PORT)] -to [get_clocks $::env(WB_CLOCK_PORT)]
set_false_path -from [get_clocks $::env(WB_CLOCK_PORT)] -to [get_clocks $::env(RING22_CLOCK_PORT)]

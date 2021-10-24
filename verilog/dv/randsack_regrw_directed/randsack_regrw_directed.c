/*
 * SPDX-FileCopyrightText: 2020 Efabless Corporation
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 * SPDX-License-Identifier: Apache-2.0
 */

// This include is relative to $CARAVEL_PATH (see Makefile)
#include "verilog/dv/caravel/defs.h"
#include "verilog/dv/caravel/stub.c"

#define REG(addr) (*(volatile uint32_t*)(addr))

#define RANDSACK_GPIO0_BASE 0x30800000
#define RANDSACK_PWM0_BASE  0x30810000
#define RANDSACK_UART0_BASE 0x30820000
#define RANDSACK_RING0_BASE 0x30830000

#define RANDSACK_GPIO_DATA  0x00
#define RANDSACK_GPIO_ENA   0x04
#define RANDSACK_GPIO_PU    0x08
#define RANDSACK_GPIO_PD    0x0c

#define RANDSACK_RING_COUNT_ADDR    0x00
#define RANDSACK_RING_CONTROL_ADDR  0x04
#define RANDSACK_RING_TRIMA_ADDR    0x08
#define RANDSACK_RING_TRIMB_ADDR    0x0c
#define RANDSACK_RING_CLKMUX_OFFSET 8

#define RANDSACK_RING_CONTROL_RESET_MASK (1 << 0)
#define RANDSACK_RING_CONTROL_START_MASK (1 << 1)

int i = 0;
int clk = 0;

void main() {
  /* Set up the housekeeping SPI to be connected internally so	*/
  /* that external pin changes don't affect it.			*/

  reg_spimaster_config = 0xa002;  // Enable, prescaler = 2,
                                  // connect to housekeeping SPI

  // Connect the housekeeping SPI to the SPI master
  // so that the CSB line is not left floating.  This allows
  // all of the GPIO pins to be used for user functions.

  reg_mprj_io_37 = GPIO_MODE_USER_STD_BIDIRECTIONAL;
  reg_mprj_io_36 = GPIO_MODE_USER_STD_BIDIRECTIONAL;
  reg_mprj_io_35 = GPIO_MODE_USER_STD_BIDIRECTIONAL;
  reg_mprj_io_34 = GPIO_MODE_USER_STD_BIDIRECTIONAL;
  reg_mprj_io_33 = GPIO_MODE_USER_STD_BIDIRECTIONAL;
  reg_mprj_io_32 = GPIO_MODE_USER_STD_BIDIRECTIONAL;
  reg_mprj_io_31 = GPIO_MODE_USER_STD_BIDIRECTIONAL;
  reg_mprj_io_30 = GPIO_MODE_USER_STD_BIDIRECTIONAL;
  reg_mprj_io_29 = GPIO_MODE_USER_STD_BIDIRECTIONAL;
  reg_mprj_io_28 = GPIO_MODE_USER_STD_BIDIRECTIONAL;
  reg_mprj_io_27 = GPIO_MODE_USER_STD_BIDIRECTIONAL;
  reg_mprj_io_26 = GPIO_MODE_USER_STD_BIDIRECTIONAL;
  reg_mprj_io_25 = GPIO_MODE_USER_STD_BIDIRECTIONAL;
  reg_mprj_io_24 = GPIO_MODE_USER_STD_BIDIRECTIONAL;
  reg_mprj_io_23 = GPIO_MODE_USER_STD_BIDIRECTIONAL;
  reg_mprj_io_22 = GPIO_MODE_USER_STD_BIDIRECTIONAL;

  /* Apply configuration */
  reg_mprj_xfer = 1;
  while (reg_mprj_xfer == 1)
    ;

  // Enable GPIOs and write pattern.
  REG(RANDSACK_GPIO0_BASE + RANDSACK_GPIO_ENA) = 0xffff0000;
  REG(RANDSACK_GPIO0_BASE + RANDSACK_GPIO_DATA) = 0x55550000;

  // Reset ring osc.
  REG(RANDSACK_RING0_BASE + RANDSACK_RING_TRIMA_ADDR) = 50;
  REG(RANDSACK_RING0_BASE + RANDSACK_RING_TRIMB_ADDR) = 60;
  REG(RANDSACK_RING0_BASE + RANDSACK_RING_CONTROL_ADDR) = RANDSACK_RING_CONTROL_RESET_MASK;
  REG(RANDSACK_RING0_BASE + RANDSACK_RING_CONTROL_ADDR) = 0;

  // Start ring osc.
  REG(RANDSACK_RING0_BASE + RANDSACK_RING_CONTROL_ADDR) = RANDSACK_RING_CONTROL_START_MASK + (4 << RANDSACK_RING_CLKMUX_OFFSET);

  REG(RANDSACK_GPIO0_BASE + RANDSACK_GPIO_DATA) = 0xaaaa0000;

  // Wait for valid value.
  while (REG(RANDSACK_RING0_BASE + RANDSACK_RING_COUNT_ADDR) < 114) {
    REG(RANDSACK_GPIO0_BASE + RANDSACK_GPIO_DATA) = 0xdead0000;
  }

  // Check to make sure the counter stopped.  Our CPU is really slow so this
  // is a safe check.
  if (REG(RANDSACK_RING0_BASE + RANDSACK_RING_COUNT_ADDR) == 114) {
    REG(RANDSACK_GPIO0_BASE + RANDSACK_GPIO_DATA) = 0xfeed0000;
  }
}

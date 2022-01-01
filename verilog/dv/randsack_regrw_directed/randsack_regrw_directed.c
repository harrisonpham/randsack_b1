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

#define RANDSACK_GPIO0_BASE 0x30000000
#define RANDSACK_PWM0_BASE  0x30001000
#define RANDSACK_PWM1_BASE  0x30001100
#define RANDSACK_PWM2_BASE  0x30001200
#define RANDSACK_PWM3_BASE  0x30001300
#define RANDSACK_UART0_BASE 0x30002000
#define RANDSACK_RING0_BASE 0x30003000
#define RANDSACK_RING1_BASE 0x30003100

#define RANDSACK_GPIO_DATA  0x00
#define RANDSACK_GPIO_ENA   0x04
#define RANDSACK_GPIO_PU    0x08
#define RANDSACK_GPIO_PD    0x0c

#define RANDSACK_PWM_DIV    0x00
#define RANDSACK_PWM_CNTMAX 0x04
#define RANDSACK_PWM_CNT    0x08
#define RANDSACK_PWM_CMP    0x0c

#define RANDSACK_RING_COUNT_ADDR    0x00
#define RANDSACK_RING_CONTROL_ADDR  0x04
#define RANDSACK_RING_TRIMA_ADDR    0x08
#define RANDSACK_RING_TRIMB_ADDR    0x0c

#define RANDSACK_RING_CONTROL_CLKMUX_OFFSET 8

#define RANDSACK_RING_CONTROL_RESET_MASK    (1 << 0)
#define RANDSACK_RING_CONTROL_START_MASK    (1 << 1)
#define RANDSACK_RING_CONTROL_TEST_EN_MASK  (1 << 2)

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
  reg_mprj_io_21 = GPIO_MODE_USER_STD_BIDIRECTIONAL;
  reg_mprj_io_20 = GPIO_MODE_USER_STD_BIDIRECTIONAL;
  reg_mprj_io_19 = GPIO_MODE_USER_STD_BIDIRECTIONAL;
  reg_mprj_io_18 = GPIO_MODE_USER_STD_BIDIRECTIONAL;
  reg_mprj_io_17 = GPIO_MODE_USER_STD_BIDIRECTIONAL;
  reg_mprj_io_16 = GPIO_MODE_USER_STD_BIDIRECTIONAL;
  reg_mprj_io_15 = GPIO_MODE_USER_STD_BIDIRECTIONAL;
  reg_mprj_io_14 = GPIO_MODE_USER_STD_BIDIRECTIONAL;
  reg_mprj_io_13 = GPIO_MODE_USER_STD_BIDIRECTIONAL;
  reg_mprj_io_12 = GPIO_MODE_USER_STD_BIDIRECTIONAL;
  reg_mprj_io_11 = GPIO_MODE_USER_STD_BIDIRECTIONAL;
  reg_mprj_io_10 = GPIO_MODE_USER_STD_BIDIRECTIONAL;
  reg_mprj_io_9 = GPIO_MODE_USER_STD_BIDIRECTIONAL;
  reg_mprj_io_8 = GPIO_MODE_USER_STD_BIDIRECTIONAL;
  reg_mprj_io_7 = GPIO_MODE_USER_STD_BIDIRECTIONAL;
  reg_mprj_io_6 = GPIO_MODE_USER_STD_BIDIRECTIONAL;

  /* Apply configuration */
  reg_mprj_xfer = 1;
  while (reg_mprj_xfer == 1)
    ;

  // Enable GPIOs and PWM IOs and write pattern.
  REG(RANDSACK_GPIO0_BASE + RANDSACK_GPIO_ENA) = 0x0000ffff | (1 << 23) | (1 << 21) | (1 << 19) | (1 << 17);
  REG(RANDSACK_GPIO0_BASE + RANDSACK_GPIO_DATA) = 0x00005555;

  // Configure PWMs.
  REG(RANDSACK_PWM0_BASE + RANDSACK_PWM_DIV) = 1;
  REG(RANDSACK_PWM0_BASE + RANDSACK_PWM_CNTMAX) = 255;
  REG(RANDSACK_PWM0_BASE + RANDSACK_PWM_CMP) = 128;
  REG(RANDSACK_PWM1_BASE + RANDSACK_PWM_DIV) = 2;
  REG(RANDSACK_PWM1_BASE + RANDSACK_PWM_CNTMAX) = 255;
  REG(RANDSACK_PWM1_BASE + RANDSACK_PWM_CMP) = 64;
  REG(RANDSACK_PWM2_BASE + RANDSACK_PWM_DIV) = 3;
  REG(RANDSACK_PWM2_BASE + RANDSACK_PWM_CNTMAX) = 64;
  REG(RANDSACK_PWM2_BASE + RANDSACK_PWM_CMP) = 32;
  REG(RANDSACK_PWM3_BASE + RANDSACK_PWM_DIV) = 4;
  REG(RANDSACK_PWM3_BASE + RANDSACK_PWM_CNTMAX) = 127;
  REG(RANDSACK_PWM3_BASE + RANDSACK_PWM_CMP) = 64;

  // Reset ring1 osc.
  REG(RANDSACK_RING1_BASE + RANDSACK_RING_TRIMA_ADDR) = 50;
  REG(RANDSACK_RING1_BASE + RANDSACK_RING_CONTROL_ADDR) = RANDSACK_RING_CONTROL_START_MASK + RANDSACK_RING_CONTROL_TEST_EN_MASK;

  // Reset ring0 osc.
  REG(RANDSACK_RING0_BASE + RANDSACK_RING_TRIMA_ADDR) = 50;
  REG(RANDSACK_RING0_BASE + RANDSACK_RING_TRIMB_ADDR) = 60;
  REG(RANDSACK_RING0_BASE + RANDSACK_RING_CONTROL_ADDR) = RANDSACK_RING_CONTROL_RESET_MASK;
  REG(RANDSACK_RING0_BASE + RANDSACK_RING_CONTROL_ADDR) = 0;

  // Start ring0 osc.
  REG(RANDSACK_RING0_BASE + RANDSACK_RING_CONTROL_ADDR) = RANDSACK_RING_CONTROL_START_MASK + (4 << RANDSACK_RING_CONTROL_CLKMUX_OFFSET) + RANDSACK_RING_CONTROL_TEST_EN_MASK;

  REG(RANDSACK_GPIO0_BASE + RANDSACK_GPIO_DATA) = 0x0000aaaa;

  // Wait for valid value.
  while (REG(RANDSACK_RING0_BASE + RANDSACK_RING_COUNT_ADDR) < 114) {
    REG(RANDSACK_GPIO0_BASE + RANDSACK_GPIO_DATA) = 0x0000dead;
  }

  // Check to make sure the counter stopped.  Our CPU is really slow so this
  // is a safe check.
  if (REG(RANDSACK_RING0_BASE + RANDSACK_RING_COUNT_ADDR) == 114) {
    REG(RANDSACK_GPIO0_BASE + RANDSACK_GPIO_DATA) = 0x0000feed;
  }
}

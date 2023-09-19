/*
 * Copyright (c) 2023, University of California; Santa Barbara
 * Distribution prohibited. All rights reserved.
 *
 * File: taillights_pkg.sv
 * Description: Taillights SystemVerilog package.
 *  Includes the enum for the FSM module
 */

package taillights_pkg;

typedef enum logic [2:0] {
    S000_000,
    S000_100,
    S000_110,
    S000_111,
    S001_000,
    S011_000,
    S111_000,
    S111_111
} state_t;

endpackage

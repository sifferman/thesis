
module test #(
    parameter WIDTH = 8
) (
    input   logic               clk,
    input   logic               rst,
    input   logic               en_i,
    input   logic [WIDTH-1:0]   data_i,
    output  logic [WIDTH-1:0]   good_o,
    output  logic [WIDTH-1:0]   bad_o
);
bad #(WIDTH) bad (clk, rst, en_i, data_i, bad_o);
good #(WIDTH) good (clk, rst, en_i, data_i, good_o);
endmodule


module bad #(
    parameter WIDTH = 8
) (
    input   logic               clk,
    input   logic               rst,
    input   logic               en_i,
    input   logic [WIDTH-1:0]   data_i,
    output  logic [WIDTH-1:0]   data_o
);
    logic [WIDTH-1:0] data_d, data_q;
    assign data_o = data_q;
    `include "2/bad.svh"
endmodule

module good #(
    parameter WIDTH = 8
) (
    input   logic               clk,
    input   logic               rst,
    input   logic               en_i,
    input   logic [WIDTH-1:0]   data_i,
    output  logic [WIDTH-1:0]   data_o
);
    logic [WIDTH-1:0] data_d, data_q;
    assign data_o = data_q;
    `include "2/good.svh"
endmodule

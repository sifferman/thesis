//-----------------------------------------------------
// Design Name : serial_crc_ccitt
// File Name   : serial_crc.v
// Function    : CCITT Serial CRC
// Coder       : Deepak Kumar Tala
//-----------------------------------------------------
module test (
    input clk,
    input reset,
    input enable,
    input init,
    input data_in,
    output [15:0] bad, good
);

serial_crc_ccitt #(.IMPLEMENTATION(0)) b (
    .clk(clk),
    .reset(reset),
    .enable(enable),
    .init(init),
    .data_in(data_in),
    .crc_out(bad)
);

serial_crc_ccitt #(.IMPLEMENTATION(1)) g (
    .clk(clk),
    .reset(reset),
    .enable(enable),
    .init(init),
    .data_in(data_in),
    .crc_out(good)
);

endmodule

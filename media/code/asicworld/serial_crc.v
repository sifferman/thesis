//-----------------------------------------------------
// Design Name : serial_crc_ccitt
// File Name   : serial_crc.v
// Function    : CCITT Serial CRC
// Coder       : Deepak Kumar Tala
//-----------------------------------------------------
module serial_crc_ccitt #(
    parameter IMPLEMENTATION = 2
) (
clk     ,
reset   ,
enable  ,
init    ,
data_in ,
crc_out
);
//-----------Input Ports---------------
input clk     ;
input reset   ;
input enable  ;
input init    ;
input data_in ;
//-----------Output Ports---------------
output [15:0] crc_out;
//------------Internal Variables--------
reg   [15:0] lfsr;
//-------------Code Start-----------------
assign crc_out = lfsr;
// Logic to CRC Calculation
generate if (IMPLEMENTATION == 0) begin : bad
    `include "bad.vh"
end else if (IMPLEMENTATION == 1) begin : good
    `include "good.vh"
end else begin
    `ifndef SYNTHESIS
        initial begin
            $display("ERROR: Expected valid values for IMPLEMENTATION are 0 for \"bad.vh\" or 1 for \"good.vh\". Received \"%d\".", IMPLEMENTATION);
            $finish;
        end
    `endif
end endgenerate

endmodule

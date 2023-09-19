module find_first_set32 #(
    parameter string IMPLEMENTATION
) (
    input   logic [31:0]    in,
    output  logic [4:0]     out
);

if (IMPLEMENTATION == "LOW") begin : low
    `include "low.svh"
end else if (IMPLEMENTATION == "HIGH") begin : high
    `include "high.svh"
end else begin : bad
    initial begin
        $error("Expected valid values for IMPLEMENTATION are \"LOW\" or \"HIGH\". Received \"%s\".", IMPLEMENTATION);
        $finish;
    end
end

endmodule

module tb;

logic clk = 0;
always #1 clk <= ~clk;

logic [31:0] value;

find_first_set32 #(.IMPLEMENTATION("LOW")) l (.in(value));
find_first_set32 #(.IMPLEMENTATION("HIGH")) h (.in(value));

always @(negedge clk) begin
    if (l.out !== h.out) begin
        $error("Not equivalent for in=%0h: l=%d h=%d", value, l.out, h.out);
        $finish;
    end
end

integer i;
initial begin
    for (i = 0; i < 100000; i++) begin
        value = $urandom();
        @(posedge clk);
    end
    $display("All equal.");
    $finish;
end

endmodule

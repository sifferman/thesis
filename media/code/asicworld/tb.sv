`timescale 1ps/1ps

module tb;

logic clk = 0;
always #1 clk <= ~clk;
logic reset = 1;
logic enable;
logic init;
logic data_in;

test test (
    .clk,
    .reset,
    .enable,
    .init,
    .data_in
);

synth synth (
    .clk,
    .reset,
    .enable,
    .init,
    .data_in
);


always @(posedge clk) begin
    if (!reset) begin
        if (test.bad !== test.good)
            $error("Behavioral simulation failed at time=%0t: asicworld=%h corrected=%h", $time, test.bad, test.good);
        if (synth.bad !== synth.good)
            $error("Synthesis simulation failed at time=%0t: asicworld=%h corrected=%h", $time, synth.bad, synth.good);
        if (test.bad !== synth.bad)
            $error("Asicworld synthesis mismatch at time=%0t: behavioral=%h synthesized=%h", $time, test.bad, synth.bad);
        if (test.good !== synth.good)
            $error("Corrected synthesis mismatch at time=%0t: behavioral=%h synthesized=%h", $time, test.good, synth.good);
    end
end

integer i;
initial begin
    $dumpfile( "dump.fst" );
    $dumpvars;
    for (i = 0; i < 10000; i++) begin
        reset = ($urandom_range(0,63) == 0) || (i < 2);
        enable = $urandom_range(0,1);
        init = ($urandom_range(0,63) == 0);
        data_in = $urandom_range(0,1);
        @(negedge clk);
    end
    $finish;
end

endmodule

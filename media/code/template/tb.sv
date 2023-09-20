
module tb #(
    parameter WIDTH = 8
) ();

logic clk = 0;
always #1 clk <= ~clk;
logic rst;
logic en_i;
logic [WIDTH-1:0] data_i;

test test(.clk(clk), .rst(rst), .en_i(en_i), .data_i(data_i));

always @(posedge clk) begin
    if (test.bad_o !== test.good_o) begin
        $error("Not equivalent");
        $finish;
    end
end

integer i;
initial begin
    for (i = 0; i < 100000; i++) begin
        rst = ($urandom_range(0,WIDTH-1) == 0);
        en_i = ($urandom_range(0,WIDTH-1) == 0);
        data_i = WIDTH'($urandom());
        @(posedge clk);
    end
    $finish;
end

endmodule

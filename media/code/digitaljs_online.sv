module piso #(
  parameter [7:0] DATA_WIDTH = 16
) (
  input   logic                   clk,
  input   logic                   rst_n,
  input   logic                   load_i,
  input   logic [DATA_WIDTH-1:0]  loaddata_i,
  output  logic                   serial_o
);

logic [DATA_WIDTH-1:0] data_d, data_q;

always_comb begin
  if (load_i)
    data_d = loaddata_i;
  else
    data_d = (data_q >> 1);
end

always_ff @(posedge clk or negedge rst_n) begin
  if (!rst_n) begin
    data_q <= '0;
  end else begin
    data_q <= data_d;
  end
end

assign serial_o = data_q[0];

endmodule

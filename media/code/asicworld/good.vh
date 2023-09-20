
reg [15:0] lfsr_d, lfsr_q;

always @* begin
  if (init) begin
    lfsr_d =  16'hFFFF;
  end else begin
    lfsr_d[0]  = data_in ^ lfsr_q[15];
    lfsr_d[1]  = lfsr_q[0];
    lfsr_d[2]  = lfsr_q[1];
    lfsr_d[3]  = lfsr_q[2];
    lfsr_d[4]  = lfsr_q[3];
    lfsr_d[5]  = lfsr_q[4] ^ data_in ^ lfsr_q[15];
    lfsr_d[6]  = lfsr_q[5];
    lfsr_d[7]  = lfsr_q[6];
    lfsr_d[8]  = lfsr_q[7];
    lfsr_d[9]  = lfsr_q[8];
    lfsr_d[10] = lfsr_q[9];
    lfsr_d[11] = lfsr_q[10];
    lfsr_d[12] = lfsr_q[11] ^ data_in ^ lfsr_q[15];
    lfsr_d[13] = lfsr_q[12];
    lfsr_d[14] = lfsr_q[13];
    lfsr_d[15] = lfsr_q[14];
  end
end

always @(posedge clk) begin
  if (reset) begin
    lfsr_q <= 16'hffff;
  end else if (enable) begin
    lfsr_q <= lfsr_d;
  end
end

always @* lfsr = lfsr_q;

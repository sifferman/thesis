wire [2:0] a;
always_comb begin
  out = 0;
  for (integer i = 0; i < 3; i++)
    if (a[i])
      out = 1;
end

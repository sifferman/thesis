
    // cummulative
    always_comb begin
        data_d = data_q;
        if (data_i > 4)
            data_d = data_d + 1;
        if (data_i > 8)
            data_d = data_d + 1;
    end
    always_ff @(posedge clk) begin
        data_q <= data_d;
    end


    // not cumulative
    always_ff @(posedge clk) begin
        if (data_i > 4)
            data_q <= data_q + 1;
        if (data_i > 8)
            data_q <= data_q + 1;
    end

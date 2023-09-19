
    // not cumulative
    always_ff @(posedge clk) begin
        data1_q <= data1_q + 1;
        data1_q <= data1_q + 1;
        data1_q <= data1_q + 1;
        data1_q <= data1_q + 1;
    end

    // doesn't warn that there is no default case
    always_ff @(posedge clk) begin
        if (rst)
            data2_q <= '0;
    end

    // unclear whether this is a DFF or DFFE
    always_ff @(posedge clk) begin
        if ( pkg::func(data3_i) )
            data3_q <= data3_d;
    end

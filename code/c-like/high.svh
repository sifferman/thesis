
function automatic logic [4:0] find_first_set32(logic [31:0] in);
    logic [4:0] out = 0;
    for (integer i = 1; i < 32; i++)
        if (in[i])
            out = i;
    return out;
endfunction

assign out = find_first_set32(in);


// Assignment: Create a counter with a direction flag

// student submission (13 logic cells)
always_comb begin
    for (int i = 0; i<WIDTH; i++) begin
        // logic here is to toggle if counting up and lowerbits = max
        // or counting down and lowerbits = 0
        lower_mask = (1<<i) - 1;
        count_d[i] =
        count_q[i] ^ (~dir_i & (count_q & lower_mask) == lower_mask |
                       dir_i & (count_q & lower_mask) == 0);
    end
end

// teacher solution (14 logic cells)
always_comb begin
    count_d = count_q + ((dir_i) ? -1 : 1);
end

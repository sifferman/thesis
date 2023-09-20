
        # No data hazards
        div     t2, t0, t1;     # Takes 25 cycles
        fsqrt.s f1, f1;         # Takes 1 cycle
        lw      t5, 0(s1);      # Takes 1 cycle

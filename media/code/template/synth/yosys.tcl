
set top test

yosys -import

read_verilog -sv {../test.sv}

synth_ice40 -top $top
write_verilog synth.v

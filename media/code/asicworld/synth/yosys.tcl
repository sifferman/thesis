
set top test

yosys -import

read_verilog {../test.v}
read_verilog {../serial_crc.v}

synth_ice40 -top $top
write_verilog synth.v

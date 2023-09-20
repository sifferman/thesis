
all: clean icarus verilator

SRCS := bad.vh good.vh serial_crc.v
VLT := --trace-fst --trace-structs --x-assign unique --x-initial unique --binary -Wno-fatal --top tb

lint:
	verilator tb.sv test.sv --lint-only --timing

obj_dir/Vtb: ${SRCS} build/synth.v tb.sv
	verilator tb.sv synth/ice40.v build/synth.v test.v serial_crc.v ${VLT} -DGLS -DNO_ICE40_DEFAULT_ASSIGNMENTS
verilator: obj_dir/Vtb
	./obj_dir/Vtb +verilator+rand+reset+2

Vtb.vvp: ${SRCS} build/synth.v tb.sv
	iverilog tb.sv synth/ice40.v build/synth.v test.v serial_crc.v -g2012 -o $@
icarus: Vtb.vvp
	./Vtb.vvp -fst

build/synth.v: ${SRCS} synth/yosys.tcl
	mkdir -p build
	cd build && yosys -l yosys.log -p 'tcl ../synth/yosys.tcl' && sed -i '0,/module test/s//module synth/' synth.v

clean:
	rm -rf obj_dir Vtb.vvp build

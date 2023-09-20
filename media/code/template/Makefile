
all: clean icarus verilator

SRCS := 1/bad.svh 1/good.svh 2/bad.svh 2/good.svh test.sv

lint:
	verilator tb.sv test.sv --lint-only --timing

obj_dir/Vtb: ${SRCS} build/synth.v tb.sv
	verilator tb.sv synth/ice40.v build/synth.v --binary -Wno-fatal --top tb -DGLS -DNO_ICE40_DEFAULT_ASSIGNMENTS
verilator: obj_dir/Vtb
	./obj_dir/Vtb

Vtb.vvp: ${SRCS} build/synth.v tb.sv
	iverilog tb.sv synth/ice40.v build/synth.v -g2012 -o $@
icarus: Vtb.vvp
	./Vtb.vvp

build/synth.v: ${SRCS} synth/yosys.tcl
	mkdir -p build
	cd build && yosys -l yosys.log -p 'tcl ../synth/yosys.tcl'

clean:
	rm -rf obj_dir Vtb.vvp build

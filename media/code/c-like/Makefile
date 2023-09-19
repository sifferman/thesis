
all: clean verilator

obj_dir/Vtb: tb.sv high.svh low.svh
	verilator tb.sv --binary -Wall -Wno-fatal --top tb
verilator: obj_dir/Vtb
	./obj_dir/Vtb

clean:
	rm -rf obj_dir Vtb.vvp build

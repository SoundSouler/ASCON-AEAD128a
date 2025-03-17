REM Remove existing libraries and their content
vdel -lib LIB_RTL -all
vdel -lib LIB_BENCH -all

REM Build new libraries with vlib and vmap
vlib .\LIB\LIB_RTL
vmap LIB_RTL .\LIB\LIB_RTL
vlib .\LIB\LIB_BENCH
vmap LIB_BENCH .\LIB\LIB_BENCH

REM Define compilation options for all files

REM Compile all RTL sources with vlog
vlog -sv +acc -svinputport=net -work LIB_RTL .\SRC\RTL\ascon_pack.sv
vlog -sv +acc -svinputport=net -work LIB_RTL .\SRC\RTL\ascon_pc.sv
vlog -sv +acc -svinputport=net -work LIB_RTL .\SRC\RTL\ascon_ps.sv
vlog -sv +acc -svinputport=net -work LIB_RTL .\SRC\RTL\ascon_pl.sv
vlog -sv +acc -svinputport=net -work LIB_RTL .\SRC\RTL\ascon_p.sv

REM Compile all BENCH sources with vlog
vlog -sv +acc -svinputport=net -work LIB_BENCH -L LIB_RTL .\SRC\BENCH\ascon_pc_tb.sv
vlog -sv +acc -svinputport=net -work LIB_BENCH -L LIB_RTL .\SRC\BENCH\ascon_ps_tb.sv
vlog -sv +acc -svinputport=net -work LIB_BENCH -L LIB_RTL .\SRC\BENCH\ascon_pl_tb.sv

REM Simulation
REM Uncomment only one vsim command below based on which testbench you want to run
REM vsim -L LIB_RTL LIB_BENCH.ascon_pc_tb
vsim -L LIB_RTL LIB_BENCH.ascon_pl_tb
REM vsim -L LIB_RTL LIB_BENCH.sbox_tb
REM vsim -L LIB_RTL LIB_BENCH.substitution_layer_tb

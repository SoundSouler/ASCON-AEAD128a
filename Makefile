# Define variables
LIB_RTL = LIB/LIB_RTL
LIB_BENCH = LIB/LIB_BENCH
SRC_RTL = ./SRC/RTL
SRC_BENCH = ./SRC/BENCH
VLOG_OPTS = -sv +acc -svinputport=net

# Automatically find all RTL and BENCH files
FILES_RTL = $(shell find $(SRC_RTL) -name '*.sv')
FILES_BENCH = $(shell find $(SRC_BENCH) -name '*.sv')

# Targets
all: compile simulate

# Remove existing libraries
clean:
	@if [ -d "$(LIB_RTL)" ]; then vdel -lib $(LIB_RTL) -all; fi
	@if [ -d "$(LIB_BENCH)" ]; then vdel -lib $(LIB_BENCH) -all; fi

# Build new libraries
build_libs:
	vlib $(LIB_RTL)
	vmap LIB_RTL $(LIB_RTL)
	vlib $(LIB_BENCH)
	vmap LIB_BENCH $(LIB_BENCH)

# Compile RTL sources
compile_rtl: build_libs
	@echo $(FILES_RTL)
	@for f in $(FILES_RTL); do vlog $(VLOG_OPTS) -work $(LIB_RTL) $$f; done

# Compile BENCH sources
compile_bench: build_libs
	@for f in $(FILES_BENCH); do vlog $(VLOG_OPTS) -work $(LIB_BENCH) -L $(LIB_RTL) $$f; done

# Combine compilation steps
compile: clean compile_rtl compile_bench

# Simulation step
simulate:
	@echo "Select a simulation target:"
	@echo "1) constant_add_tb"
	@echo "2) sbox_tb"
	@echo "3) substitution_layer_tb"
	@echo "4) ascon_p_tb"
	@read -p "Choice: " choice; \
	case $$choice in \
		1) vsim -L $(LIB_RTL) LIB_BENCH.constant_add_tb;; \
		2) vsim -L $(LIB_RTL) LIB_BENCH.sbox_tb;; \
		3) vsim -L $(LIB_RTL) LIB_BENCH.substitution_layer_tb;; \
		4) vsim -L $(LIB_RTL) LIB_BENCH.ascon_p_tb;; \
		*) echo "Invalid choice.";; \
	esac

.PHONY: all clean build_libs compile_rtl compile_bench simulate

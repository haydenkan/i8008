MODULES := $(wildcard hdl/*.sv)
TESTS := $(wildcard test/*.sv)

all: $(MODULES) $(TESTS)
	iverilog -o my_design $(MODULES) $(TESTS)

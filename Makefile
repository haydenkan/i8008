MODULES := $(wildcard hdl/*.sv)
TESTS := $(wildcard test/*.sv)
HEADERS := $(wildcard hdl/*.svh)

all: $(MODULES) $(TESTS)
	iverilog -o my_design -I hdl $(MODULES) $(TESTS)

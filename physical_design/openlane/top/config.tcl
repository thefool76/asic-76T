set ::env(DESIGN_NAME) "top"

set ::env(VERILOG_FILES) "\
    $::env(DESIGN_DIR)/../../../rtl/top.v \
    $::env(DESIGN_DIR)/../../../rtl/counter.v \
    $::env(DESIGN_DIR)/../../../rtl/adder.v"

set ::env(CLOCK_PORT) "clk"
set ::env(CLOCK_NET) "clk"
set ::env(CLOCK_PERIOD) "10.0"

set ::env(PDK) "sky130A"
set ::env(STD_CELL_LIBRARY) "sky130_fd_sc_hd"

set ::env(DIE_AREA) "0 0 100 100"
set ::env(FP_CORE_UTIL) 20

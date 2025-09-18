global init_design_uniquify
global init_import_mode
global init_verilog
global init_design_netlisttype
global init_design_settop 
global init_top_cell 
global init_lef_file 
global init_mmmc_file 
global init_pwr_net 
global init_gnd_net 
global init_io_file 
set init_design_uniquify {1} 
set init_import_mode {-treatUndefinedCellAsBbox 0 -keepEmptyModule 1 }
set init_verilog "../inputs/systolic_2x2.dc.v"
set init_design_netlisttype Verilog 
set init_design_settop 1 
set init_lef_file "/storage/MTP244102412/UMC65/UMK65LSCLLMVBBR_B03_TAPEOUTKIT/lef/tf/uk65lscllmvbbr_7m2t0f.lef /storage/MTP244102412/UMC65/UMK65LSCLLMVBBR_B03_TAPEOUTKIT/lef/uk65lscllmvbbr.lef"
set init_mmmc_file "../inputs/MMMC.tcl" 
set init_pwr_net {VDD} 
set init_gnd_net {VSS}

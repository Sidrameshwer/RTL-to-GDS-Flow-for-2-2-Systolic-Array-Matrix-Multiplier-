set_ccopt_mode -integration native -cts_inverter_cells {CKINVM8R CKINVM12R} -cts_buffer_cells {CKBUFM8R CKBUFM12R} -cts_use_inverters true 
set_ccopt_mode -cts_target_skew 0.1 
set_ccopt_mode -cts_target_slew 0.2 
set_ccopt_mode -cts_target_nonleaf_slew 0.25 
create_ccopt_clock_tree_spec -filename ctsccopt.spec
source ctsccopt.spec

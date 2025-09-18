create_rc_corner -name rc_worst -qx_tech_file {../qrcTechFile}
create_rc_corner -name rc_best -qx_tech_file {../qrcTechFile}
create_library_set -name fast_libs -timing {/storage/MTP244102412/UMC65/UMK65LSCLLMVBBR_B03_TAPEOUTKIT/synopsys/uk65lscllmvbbr_110c-40_bc.lib}
create_library_set -name slow_libs -timing {/storage/MTP244102412/UMC65/UMK65LSCLLMVBBR_B03_TAPEOUTKIT/synopsys/uk65lscllmvbbr_108c125_wc.lib}
create_constraint_mode -name func_mode -sdc_files {../inputs/file1.sdc}
create_delay_corner -name slow_max -library_set {slow_libs} -rc_corner {rc_worst}
create_delay_corner -name fast_min -library_set {fast_libs} -rc_corner {rc_best} 
create_analysis_view -name func_max -constraint_mode {func_mode} -delay_corner {slow_max} 
create_analysis_view -name func_min -constraint_mode {func_mode} -delay_corner {fast_min} 
set_analysis_view -setup {func_max} -hold {func_min}

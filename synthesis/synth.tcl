 #############################################################
 ##                 Synopsys DC Compile 
 #############################################################
	
	set top_module (YOUR .V FILENAME)
	set clk_name   clk
	
	set tech_lib uk65lscllmvbbr_110c-40_bc

	
	
	
	set synthetic_library dw_foundation.sldb
	
	set target_library "(YOUR LIBRARY PATH)"
      
	set link_library "* $target_library $synthetic_library"

	foreach ff [(YOUR .v FILE PATH)] {
		analyze -library WORK -format verilog $ff
	}
	set synlib_enable_dpgen true
	elaborate $top_module
	current_design $top_module
	link
	
 #############################################################
 ##                      Create Clock
 #############################################################
	
	set find_clock [ find port [list $clk_name] ]
	if {  $find_clock != [list] } {
		create_clock $clk_name -period 20
		puts "clock present"
	} else {
		set clk_name vclk
		create_clock -period 20 -name $clk_name
		puts "clock not present"
	}
	set_clock_uncertainty -setup 0.01 $clk_name
	
 #############################################################
 ##                    Operating Environment
 ##             Input/Output Delay, Drive Strength
 #############################################################
	
	if {[string match gscl45nm $tech_lib] == 1 } {
		set_driving_cell -lib_cell INVX1 [all_inputs]
	}
	set_drive 0.0001 [all_inputs]
	set_load  0.0001 [all_outputs]
	set_input_delay 1.0 [all_inputs] -clock $clk_name
	set_output_delay 1.0 [all_outputs] -clock $clk_name
	
 #############################################################
 ##                    Operating Environment
 ##               Operating Condition, Wire Load
 #############################################################
	
	# # set auto_wire_load_selection true
	# # set wire_lode_mode "top"
	
	if {[string match *_brs_generic_core_* $tech_lib] == 1 } {
		set condition [lindex [split $tech_lib "_"] end]
		set_operating_conditions -library $tech_lib $condition
		set_wire_load_model -name "enG50K" -library "$tech_lib"
		
	} elseif {[string match *generic_core_ff* $tech_lib] == 1 } {
		# append tech "_ff"
		set_operating_conditions -library $tech_lib BCCOM
		set_wire_load_model -name "enG50K" -library "$tech_lib"

	} elseif {[string match *generic_core_ss* $tech_lib] == 1 } {
		# append tech "_ss"
		set_operating_conditions -library $tech_lib WCCOM
		set_wire_load_model -name "enG50K" -library "$tech_lib"
		
	} elseif {[string match *generic_core_tt* $tech_lib] == 1 } {
		# append tech "_tt"
		set_operating_conditions -library $tech_lib TCCOM
		set_wire_load_model -name "enG50K" -library "$tech_lib"

	} elseif {[string match gscl45nm $tech_lib] == 1 } {
		set_operating_conditions -library $tech_lib typical
		
	} elseif {[string match *tsl18fs120_scl* $tech_lib] == 1 } {
		if {[string match *ff* $tech_lib] == 1 } {
			append tech "_ff"
		} elseif {[string match *ss* $tech_lib] == 1 } {
			append tech "_ss"
		}
		set_operating_conditions -library $tech_lib $tech_lib
		set_wire_load_model -name "140000" -library "$tech_lib"
		
	} elseif {[string match *uk65lscspmvl9b* $tech_lib] == 1 } {
		# set_operating_conditions -library $tech_lib
		set_wire_load_model -name "wl30" -library "$tech_lib"
		
	} 
	
 #############################################################
 ##                 Optimization Constraints 
 #############################################################
	
	# set_max_delay 5.4 -from $clk_name
	
	# set_max_transition 2 $top_module
	# set_max_capacitance 5 $top_module
	
	set_max_area 0
	set_max_dynamic_power 0
	set_max_leakage_power 0
	set_max_total_power 0
	
	set_fix_multiple_port_nets -buffer_constant -all
	remove_unconnected_ports [find -hierarchy cell {"*"}]
	
 #############################################################
 ##                 Compile
 #############################################################
	
	# if { $clock_gatting_en == "true"} {
		# compile -gate_clock -map_effort   high -incremental_mapping
		# compile -gate_clock -area_effort  high -incremental_mapping
		# compile -gate_clock -power_effort high -incremental_mapping
	# } else {
		# compile -map_effort   high -incremental_mapping
		# compile -area_effort  high -incremental_mapping
		# compile -power_effort high -incremental_mapping
	#}
	
	compile -map_effort high 
	# compile -area_effort medium 
	# compile -power_effort high 
	# compile -incremental_mapping   
	# compile -map_effort low -area_effort high -power_effort low
	# compile -area_effort high -incremental_mapping
	# compile -map_effort high -area_effort high -power_effort high -incremental_mapping
	
 #############################################################
 ##                    Report Generation                    ##
 #############################################################
	#verbose -hierarchy -levels 1
	#report_area > reports2/$top_module.area
	#report_power -verbose > reports2/$top_module.power
  report_area -hierarchy > reports2/$top_module.area
  #report_area -hierarchy -levels 1 > reports2/$top_module.area
	report_power -verbose -hierarchy -levels 1 > reports2/$top_module.power
  #report_timing > reports2/$top_module.timing
  write -hierarchy -format verilog -output reports2/$top_module.dc.v
  report_timing -max_paths 5 > reports2/$top_module.timing
	# write -hierarchy -format verilog -output $dir_out_synopsys/$top_module.db
	# write -hierarchy -format ddc -output $dir_out_synopsys/$top_module.ddc 
        write_sdc -version 2.1 file1.sdc
	

	

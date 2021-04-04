add_input_file {"C:/HDS/CAD/CAD_lib/hdl/mem_delay_behav.vhd"} -format {VHDL_2008} -work CAD_lib
add_input_file {"C:/HDS/CAD/CAD_lib/hdl/mdata_behav.vhd"} -format {VHDL_2008} -work CAD_lib
add_input_file {"C:/HDS/CAD/CAD_lib/hdl/mem_behave.vhd"} -format {VHDL_2008} -work CAD_lib
setup_design -design mem
setup_design -architecture behave

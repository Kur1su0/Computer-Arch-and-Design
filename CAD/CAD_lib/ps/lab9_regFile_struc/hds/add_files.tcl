add_input_file {"C:/HDS/CAD/CAD_lib/hdl/lab9_register_decoder_behav.vhd"} -format {VHDL_2008} -work CAD_lib
add_input_file {"C:/HDS/CAD/CAD_lib/hdl/reg_mixed.vhd"} -format {VHDL_2008} -work CAD_lib
add_input_file {"C:/HDS/CAD/CAD_lib/hdl/lab9_regReadWrite.vhd"} -format {VHDL} -work CAD_lib
add_input_file {"C:/HDS/CAD/CAD_lib/hdl/lab9_regFile_struc.vhd"} -format {VHDL_2008} -work CAD_lib
setup_design -design lab9_regFile
setup_design -architecture struc

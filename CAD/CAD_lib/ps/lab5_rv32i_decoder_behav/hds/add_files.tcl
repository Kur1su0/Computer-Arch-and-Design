add_input_file {"C:/HDS/CAD/CAD_lib/hdl/RV32I_pkg.vhd"} -format {VHDL_2008} -work CAD_lib
add_input_file {"C:/HDS/CAD/CAD_lib/hdl/RV32I_pkg_body.vhd"} -format {VHDL_2008} -work CAD_lib
add_input_file {"C:/HDS/CAD/CAD_lib/hdl/lab5_rv32i_decoder_behav.vhd"} -format {VHDL_2008} -work CAD_lib
setup_design -design lab5_rv32i_decoder
setup_design -architecture behav

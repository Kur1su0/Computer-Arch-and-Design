add_input_file {"C:/HDS/CAD/CAD_lib/hdl/RV32I_pkg.vhd"} -format {VHDL_2008} -work CAD_lib
add_input_file {"C:/HDS/CAD/CAD_lib/hdl/RV32I_pkg_body.vhd"} -format {VHDL_2008} -work CAD_lib
add_input_file {"C:/HDS/CAD/CAD_lib/hdl/func_reg_behav.vhd"} -format {VHDL_2008} -work CAD_lib
setup_design -design func_reg
setup_design -architecture behav

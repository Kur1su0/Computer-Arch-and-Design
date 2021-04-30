add_input_file {"C:/HDS/CAD/CAD_lib/hdl/RV32I_pkg.vhd"} -format {VHDL_2008} -work CAD_lib
add_input_file {"C:/HDS/CAD/CAD_lib/hdl/RV32I_pkg_body.vhd"} -format {VHDL_2008} -work CAD_lib
add_input_file {"C:/HDS/CAD/CAD_lib/hdl/reg_mixed.vhd"} -format {VHDL_2008} -work CAD_lib
add_input_file {"C:/HDS/CAD/CAD_lib/hdl/func_reg_behav.vhd"} -format {VHDL_2008} -work CAD_lib
add_input_file {"C:/HDS/CAD/CAD_lib/hdl/lab8_writeback_mixed.vhd"} -format {VHDL_2008} -work CAD_lib
add_input_file {"C:/HDS/CAD/CAD_lib/hdl/lab8_writeback_tb_tb_rtl.vhd"} -format {VHDL_2008} -work CAD_lib
setup_design -design lab8_writeback_tb
setup_design -architecture rtl

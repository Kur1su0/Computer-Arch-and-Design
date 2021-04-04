add_input_file {"C:/HDS/CAD/CAD_lib/hdl/reg_mixed.vhd"} -format {VHDL_2008} -work CAD_lib
add_input_file {"C:/HDS/CAD/CAD_lib/hdl/reg_tb_tb_rtl.vhd"} -format {VHDL} -work CAD_lib
setup_design -design reg_tb
setup_design -architecture rtl

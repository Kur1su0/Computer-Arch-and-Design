onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /lab10_combine/rst
add wave -noupdate /lab10_combine/clk
add wave -noupdate /lab10_combine/wire_delay
add wave -noupdate /lab10_combine/wire_dataout
add wave -noupdate /lab10_combine/wire_MemSyst_Dout
add wave -noupdate /lab10_combine/wire_MemSyst_Addr
add wave -noupdate /lab10_combine/wire_MemSyst_read
add wave -noupdate /lab10_combine/wire_MemSyst_we
add wave -noupdate /lab10_combine/processor/reg_file/RegArray(28)/RegI/Qval
add wave -noupdate /lab10_combine/processor/reg_file/RegArray(11)/RegI/Qval
add wave -noupdate /lab10_combine/processor/reg_file/RegArray(10)/RegI/Qval
add wave -noupdate /lab10_combine/processor/reg_file/RegArray(7)/RegI/Qval
add wave -noupdate /lab10_combine/processor/reg_file/RegArray(6)/RegI/Qval
add wave -noupdate /lab10_combine/processor/exe/clk
add wave -noupdate /lab10_combine/processor/exe/Left
add wave -noupdate /lab10_combine/processor/exe/Right
add wave -noupdate /lab10_combine/processor/exe/Extra
add wave -noupdate /lab10_combine/processor/exe/Rd_in
add wave -noupdate /lab10_combine/processor/exe/FunC_in
add wave -noupdate /lab10_combine/processor/exe/Func_out
add wave -noupdate /lab10_combine/processor/exe/Rd_out
add wave -noupdate /lab10_combine/processor/exe/Address
add wave -noupdate /lab10_combine/processor/exe/Data
add wave -noupdate /lab10_combine/processor/exe/Jaddr
add wave -noupdate /lab10_combine/processor/exe/Jump
add wave -noupdate /lab10_combine/processor/exe/overflow
add wave -noupdate /lab10_combine/processor/exe/delay
add wave -noupdate /lab10_combine/processor/exe/rst
add wave -noupdate /lab10_combine/processor/exe/wire_LReg_to_proc
add wave -noupdate /lab10_combine/processor/exe/wire_RReg_to_proc
add wave -noupdate /lab10_combine/processor/exe/wire_ExReg_to_proc
add wave -noupdate /lab10_combine/processor/exe/wire_funC
add wave -noupdate /lab10_combine/processor/exe/wire_rd_to_out
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {33584 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 253
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {33335 ns} {34203 ns}

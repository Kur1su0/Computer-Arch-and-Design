--
-- VHDL Architecture CAD_lib.lab8_writeback.mixed
--
-- Created:
--          by - W.UNKNOWN (DESKTOP-86TQKQ1)
--          at - 02:53:40 04/ 4/2021
--
-- using Mentor Graphics HDL Designer(TM) 2018.2 (Build 19)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;
USE work.RV32I.ALL;

ENTITY lab8_writeback IS
PORT(
	Data	: IN std_ulogic_vector(31 DOWNTO 0);
	Rd_in	: IN std_ulogic_vector(4 DOWNTO 0);
	FunC 	: IN RV32I_Op;
	clk     : IN std_ulogic;
	Rd_out	: OUT std_ulogic_vector(4 DOWNTO 0);
	Data_out: OUT  std_ulogic_vector(31 DOWNTO 0);	
	w 		: OUT std_ulogic;
	rst		: IN std_ulogic
	
);
END ENTITY lab8_writeback;

--
ARCHITECTURE mixed OF lab8_writeback IS
	SIGNAL wire_data_reg: std_ulogic_vector(31 downto 0);
	SIGNAL wire_rd		:std_ulogic_vector(4 DOWNTO 0);
	SIGNAL wire_func	:RV32I_Op;
BEGIN
	Data_reg: ENTITY work.reg(mixed)
	GENERIC MAP(width=>32)
	PORT MAP(D=>Data,Q=>wire_data_reg, clk=>clk,enable=>'1',reset=>rst);
	
	
	Rd_reg: ENTITY work.reg(mixed)
	GENERIC MAP(width=>5)
	PORT MAP(D=>Rd_in,Q=>wire_rd, clk=>clk,enable=>'1',reset=>rst);
	
	func_reg: ENTITY work.func_reg(behav)
	PORT MAP(D=>FunC,Q=>wire_func, clk=>clk,enable=>'1',reset=>rst);
	
wback_process:	PROCESS(wire_data_reg, wire_func,wire_rd)
	BEGIN
		CASE wire_func IS
			WHEN SB| SH | SW | BAD |BEQ|BNE|BLT |BGE |BLTU | BGEU =>  ---XXX WHAT ABOUT BRANCH ???
				Rd_out<=wire_rd;
				Data_out<=wire_data_reg;
				w <='0';
			WHEN NOP =>
				Data_out<=ZEROS_32;
				Rd_out<="00000";
				w<='1';
			WHEN OTHERS=>
				Rd_out<=wire_rd;
				Data_out<=wire_data_reg;
				w<='1';
		
		
		END CASE;
		
	END PROCESS;
	
	
	
END ARCHITECTURE mixed;


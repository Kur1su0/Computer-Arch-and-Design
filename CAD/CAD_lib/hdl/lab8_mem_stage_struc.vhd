--
-- VHDL Architecture CAD_lib.lab8_mem_stage_proc.behav
--
-- Created:
--          by - W.UNKNOWN (DESKTOP-86TQKQ1)
--          at - 19:49:58 04/ 3/2021
--
-- using Mentor Graphics HDL Designer(TM) 2018.2 (Build 19)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;
USE work.RV32I.ALL;
ENTITY lab8_mem_stage_struc IS
 GENERIC(width : NATURAL RANGE 1 TO 64 := 32);
PORT(	
	Data,Din,Address					: IN  std_ulogic_vector(31 DOWNTO 0);
	Rd_in								: IN std_ulogic_vector(4 DOWNTO 0);
	FunC_in								: IN RV32I_Op;
	mDelay,clk 							: IN std_ulogic;
	
	
	r,w,stall 							: OUT std_ulogic;
	Dout,Data_out_wback,Address_out_arb	: OUT  std_ulogic_vector(31 DOWNTO 0);
	Rd_out 								: OUT std_ulogic_vector(4 DOWNTO 0);
	FunC_out 							: OUT RV32I_Op;
	rst									: IN std_ulogic
	--data_size 						: OUT std_ulogic_vector(1 downto 0)
	
	--00=byte (8-bits), 01=half-word (16 bits), 10=word (32 bits).
	
	);
END ENTITY lab8_mem_stage_struc;

--
ARCHITECTURE struc OF lab8_mem_stage_struc IS
SIGNAL wire_data_reg,wire_addr_reg :  std_ulogic_vector(31 DOWNTO 0);
SIGNAL wire_rd : std_ulogic_vector(4 downto 0);
SIGNAL wire_func: RV32I_Op;
--SIGNAL wire_Data_to_wback: std_ulogic_vector(31 DOWNTO 0);
--SIGNAL wire_mdelay :std_ulogic;
--SIGNAL wire_rd_final;
--signal wire_Address_out_arb : std_ulogic_vector(31 DOWNTO 0);
BEGIN
	Data_reg: ENTITY work.reg(mixed)
	GENERIC MAP(width=>width)
	PORT MAP(D=>Data,Q=>wire_data_reg, clk=>clk,enable=>not(mdelay),reset=>rst);
	
	Addr_reg: ENTITY work.reg(mixed)
	GENERIC MAP(width=>width)
	PORT MAP(D=>Address,Q=>wire_addr_reg, clk=>clk,enable=>not(mdelay),reset=>rst);
	
	Rd_reg: ENTITY work.reg(mixed)
	GENERIC MAP(width=>5)
	PORT MAP(D=>Rd_in,Q=>wire_rd, clk=>clk,enable=>not(mdelay),reset=>rst);
	
	func_reg: ENTITY work.func_reg(behav)
	PORT MAP(D=>FunC_in,Q=>wire_func, clk=>clk,enable=>not(mdelay),reset=>rst);
	
	
	proc :ENTITY work.lab8_mem_stage_proc(behav)
	PORT MAP(
		Data=>wire_data_reg,
		Din=>Din,
		Address=>wire_addr_reg,
		FunC=>wire_func,
		r=>r,w=>w,--stall=>stall,
		Dout => Dout,
		Data_out_wback=>Data_out_wback,
		Address_out_arb=>Address_out_arb
	);
	
	--wire_mdelay<=mDelay;
	with mDelay select FunC_out<=
		NOP 	  when '1',
		wire_func when '0',
		unaffected when others;
			
	with mDelay select Rd_out<=
		"00000" when '1',
		wire_rd when '0',
		unaffected when others;
	
	with mDelay select stall<=
		'0' when '0',
		'1' when others;
		
	-- with mDelay select Address_out_arb<=
		-- wire_Address_out_arb when '0',
		-- ZEROS_32 when others;
	-- process()
	-- begin
	
	-- end process;
END ARCHITECTURE struc;


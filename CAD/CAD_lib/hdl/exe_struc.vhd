--
-- VHDL Architecture CAD_lib.exe.struc
--
-- Created:
--          by - W.UNKNOWN (DESKTOP-86TQKQ1)
--          at - 20:07:51 03/28/2021
--
-- using Mentor Graphics HDL Designer(TM) 2018.2 (Build 19)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;
USE work.RV32I.all;

ENTITY lab7_exe IS
  GENERIC(width : NATURAL RANGE 1 TO 64 := 32);
PORT(
   clk :IN std_ulogic;
   Left,Right,Extra: IN std_ulogic_vector(31 DOWNTO 0);
   Rd_in: IN std_ulogic_vector(4 DOWNTO 0);
   FunC_in :IN RV32I_Op;
   Func_out: OUT RV32I_Op;
   Rd_out: OUT std_ulogic_vector(4 DOWNTO 0);
   Address,Data,Jaddr: OUT std_ulogic_vector(31 DOWNTO 0);
   Jump,overflow: OUT std_ulogic;
   delay,rst : IN std_ulogic
    	 
   
);
END ENTITY lab7_exe;
  
--
ARCHITECTURE struc OF lab7_exe IS
  SIGNAL wire_LReg_to_proc,wire_RReg_to_proc,wire_ExReg_to_proc : std_ulogic_vector (31 DOWNTO 0);
  SIGNAL wire_funC :  RV32I_Op;
  SIGNAL wire_rd_to_out : std_ulogic_vector (4 DOWNTO 0);
BEGIN
  L_reg: ENTITY work.reg(mixed)
  GENERIC MAP(width=>width)
  PORT MAP(D=>Left,Q=>wire_LReg_to_proc, clk=>clk,enable=>not(delay),reset=>rst);
    
  R_reg: ENTITY work.reg(mixed)
  GENERIC MAP(width=>width)
  PORT MAP(D=>Right,Q=>wire_RReg_to_proc, clk=>clk,enable=>not(delay),reset=>rst);
    
  Ex_reg: ENTITY work.reg(mixed)
  GENERIC MAP(width=>width)
  PORT MAP(D=>Extra,Q=>wire_ExReg_to_proc, clk=>clk,enable=>not(delay),reset=>rst);
  
  Rd_reg: ENTITY work.reg(mixed)
  GENERIC MAP(width=>5)
  PORT MAP(D=>Rd_in,Q=>wire_rd_to_out, clk=>clk,enable=>not(delay),reset=>rst);
  
  func_reg: ENTITY work.func_reg(behav)
  PORT MAP(D=>FunC_in,Q=>wire_funC, clk=>clk,enable=>not(delay),reset=>rst);
  
  
  EXE_ALU_PROC: ENTITY work.exe_proc(behav) 
  PORT MAP( 
    L=>wire_LReg_to_proc,
    R=>wire_RReg_to_proc,
    Extra=>wire_ExReg_to_proc,
    FunC=>wire_funC,
    
    Address=>Address,
    Data=>Data,
    Jaddr=>Jaddr,
    Jump=>Jump,
    overflow=>overflow
  );
  
  
  with delay select FunC_out<=
		NOP 	  when '1',
		wire_func when '0',
		unaffected when others;
			
  with delay select Rd_out<=
		"00000" when '1',
		wire_rd_to_out when '0',
		unaffected when others;
  
  
  -- Func_out<=wire_funC;
  -- Rd_out<=wire_rd_to_out;
  
END ARCHITECTURE struc;


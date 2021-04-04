--
-- VHDL Architecture CAD_lib.lab6_decode_pipeline.struc
--
-- Created:
--          by - W.UNKNOWN (DESKTOP-86TQKQ1)
--          at - 02:03:38 03/22/2021
--
-- using Mentor Graphics HDL Designer(TM) 2018.2 (Build 19)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;
USE work.RV32I.all;


ENTITY lab6_decode_pipeline IS
  GENERIC(width : NATURAL RANGE 1 TO 64 := 32);
  PORT(
  Inst, Address,DataA,DataB : IN std_logic_vector(31 DOWNTO 0);
  clk : IN std_logic;
  L,R,Extra :OUT std_logic_vector (31 DOWNTO 0);
  Rs1,Rs2,Rd   :OUT std_logic_vector(4 DOWNTO 0);
  Rs1v,Rs2v,Rdv :OUT std_logic;
  FunCode :OUT RV32I_Op
  
  
  );
  
END ENTITY lab6_decode_pipeline;

--
ARCHITECTURE struc OF lab6_decode_pipeline IS

  SIGNAL wire_InstReg_to_Dec,wire_AddrReg_to_proc,wire_imm : std_logic_vector (31 DOWNTO 0);
  SIGNAL wire_FunCode   : RV32I_Op;
BEGIN 
  INST_reg: ENTITY work.reg(mixed)
  GENERIC MAP(width=>width)
  PORT MAP(D=>Inst,Q=>wire_InstReg_to_Dec, clk=>clk,enable=>'1',reset=>'0');
  
  Addr_reg: ENTITY work.reg(mixed)
  GENERIC MAP(width=>width)
  PORT MAP(D=>Address,Q=>wire_AddrReg_to_proc,clk=>clk,enable=>'1',reset=>'0'); 
    
    
  
  Deco : ENTITY work.lab5_rv32i_decoder(behav)
  PORT MAP( instruction =>wire_InstReg_to_Dec,
            Function_op=>wire_FunCode,
            RS1=>Rs1, RS2=>Rs2, RD=>Rd,
            RS1v=>Rs1v, RS2v=>Rs2v, RDv=>Rdv,
            Immediate =>wire_imm
            );
  dec_proc: ENTITY work.decode_proc(behav)
  PORT MAP(
	         FunC =>wire_FunCode,
	         Immediate=>wire_imm, Address=>wire_AddrReg_to_proc,
	         DataA=>DataA,DataB=>DataB,
	         L=>L,R=>R,Extra=>Extra
	         );
  

FunCode<=wire_FunCode;
  
END ARCHITECTURE struc;


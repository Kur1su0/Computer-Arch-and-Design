--
-- VHDL Architecture CAD_lib.lab3_fetch_unit.struct
--
-- Created:
--          by - W.UNKNOWN (DESKTOP-86TQKQ1)
--          at - 14:25:13 02/22/2021
--
-- using Mentor Graphics HDL Designer(TM) 2018.2 (Build 19)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY lab3_fetch_unit IS
  GENERIC(width : NATURAL RANGE 1 TO 64 := 32);
Port(
     Jaddr, Mdata : IN std_ulogic_vector(31 downto 0);
     clk,Jmp,Reset,Delay: IN std_ulogic;
  
     Addr,Inst:OUT std_ulogic_vector(31 downto 0);
     Read : OUT std_ulogic
);
  
END ENTITY lab3_fetch_unit;

--
ARCHITECTURE struct OF lab3_fetch_unit IS
 SIGNAL wire_mux_jmp_zero: std_ulogic_vector(width -1 downto 0);
 SIGNAL wire_pc_enable: std_ulogic;
 SIGNAL wire_pc_rst: std_ulogic;

BEGIN
  jmp_or_zero: ENTITY work.mux_2_to_1(mixed)
  GENERIC MAP(width=>width)
  PORT MAP(Data_In_0=>Jaddr, Data_In_1=>(others=>'0'),Q=>wire_mux_jmp_zero,Sel=>Reset );
  
  
  
   orGate: ENTITY work.or_gate(behave)
   PORT MAP(Din0=>Reset,Din1=>Jmp,Dout=>wire_pc_rst);
     
     
   pc_enable : ENTITY work.pc_enable(behave)
  PORT MAP(jmp_or_rst=>wire_pc_rst, Delay=>Delay,Dout=>wire_pc_enable);  
  
   pc : ENTITY work.lab2_counter(mixed)
  GENERIC MAP(width=>width)
  PORT MAP( D=>wire_mux_jmp_zero, Inc_val=>"11", Q=>Addr, Clock=>clk, enable=>wire_pc_enable, reset=>wire_pc_rst);
    
    
    out_read : ENTITY work.read_ctrl(behav)
    PORT MAP( jmp=>Jmp,rst=>Reset,Read=>Read);
      
    out_mdata : ENTITY work.nop_ctrl(behav)
    PORT MAP(
        jmp=>Jmp,rst=>Reset,delay=>Delay,
        mdata=>Mdata,
        Inst=>inst
      );
  
  
  
END ARCHITECTURE struct;


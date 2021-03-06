--
-- VHDL Architecture CAD_lib.lab2_counter.mixed
--
-- Created:
--          by - W.UNKNOWN (DESKTOP-86TQKQ1)
--          at - 19:39:58 02/14/2021
--
-- using Mentor Graphics HDL Designer(TM) 2018.2 (Build 19)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY lab2_counter IS
  GENERIC(width : NATURAL RANGE 1 TO 64 := 8);
  PORT( 
    D : IN std_ulogic_vector(width - 1 DOWNTO 0);
    Inc_val: In std_ulogic_vector(1 DOWNTO 0);
    Q : OUT std_ulogic_vector(width - 1 DOWNTO 0);
    Clock, enable, reset : IN std_ulogic
  );
  
  
END ENTITY lab2_counter;

--
ARCHITECTURE mixed OF lab2_counter IS
  
  SIGNAL wire_mux_to_reg: std_ulogic_vector(width-1 DOWNTO 0);
  SIGNAL wire_reg_to_inc: std_ulogic_vector(width-1 DOWNTO 0);
  --SIGNAL cur_res : std_ulogic_vector(width-1 DOWNTO 0);
  SIGNAL wire_inc_to_mux  : std_ulogic_vector(width-1 DOWNTO 0);
  
BEGIN
 -- syn: ENTITY work.rst_syn(behav)
--  PORT MAP(reset=>Reset,clk=>Clock,out_reset=>wire_reset);
  
  
  mux2 : ENTITY work.mux_2_to_1(mixed)
  GENERIC MAP(width=>width)
  PORT MAP( Data_In_0=>wire_inc_to_mux, Data_In_1=>D,Sel=>reset,Q=>wire_mux_to_reg);
    
  reg: ENTITY work.reg(mixed)
  GENERIC MAP(width=>width)
  PORT MAP(D=>wire_mux_to_reg,Q=>wire_reg_to_inc,clk=>Clock,enable=>enable,reset=>'0'); 
  
   
  increm: ENTITY work.Increment(mixed)
  GENERIC MAP(width=>width)
  PORT MAP(D=>wire_reg_to_inc,Q=>wire_inc_to_mux,Inc=>Inc_val);
    
  
    
    
  Q<=wire_reg_to_inc;
    
  
  
END ARCHITECTURE mixed;



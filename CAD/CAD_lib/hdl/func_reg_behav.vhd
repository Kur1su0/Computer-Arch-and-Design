--
-- VHDL Architecture CAD_lib.func_reg.behav
--
-- Created:
--          by - W.UNKNOWN (DESKTOP-86TQKQ1)
--          at - 18:40:40 03/31/2021
--
-- using Mentor Graphics HDL Designer(TM) 2018.2 (Build 19)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;
USE work.RV32I.ALL;

ENTITY func_reg IS
  PORT( 
    D : IN RV32I_Op;
    Q : OUT RV32I_Op;
    clk,enable,reset : IN std_ulogic
    );
    
    
  END ENTITY func_reg;
  
  --
  ARCHITECTURE behav OF func_reg IS
    BEGIN
    --      process(clk,D )
    --      begin
    --        if (rising_edge(clk) )then
    --          Q<=D;  
    --      end if;
    --      
    process(clk,enable,D,reset)
    begin
      if (reset='1'  ) then
       
      Q<=NOP;
      elsif (rising_edge(clk) and enable='1' )then
      Q<=D;  
    end if;
    
  end process;
  
END ARCHITECTURE behav;




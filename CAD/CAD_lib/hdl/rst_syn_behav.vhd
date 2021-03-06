--
-- VHDL Architecture CAD_lib.rst_syn.behav
--
-- Created:
--          by - W.UNKNOWN (DESKTOP-86TQKQ1)
--          at - 02:05:44 02/23/2021
--
-- using Mentor Graphics HDL Designer(TM) 2018.2 (Build 19)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY rst_syn IS
  GENERIC(width : NATURAL RANGE 1 TO 64 := 8);
  PORT(
    Din0,Din1: IN std_logic_vector(width-1 downto 0);
    rst: IN std_logic;
    Dout: OUT std_logic_vector(width-1 downto 0)
  );
END ENTITY rst_syn;

--
ARCHITECTURE behav OF rst_syn IS
BEGIN
  process(Din0,Din1,rst)
  begin
    
    
  end process;
  
END ARCHITECTURE behav;


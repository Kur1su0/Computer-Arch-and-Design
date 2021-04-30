--
-- VHDL Architecture CAD_lib.lab9_register_decoder.behav
--
-- Created:
--          by - W.UNKNOWN (DESKTOP-86TQKQ1)
--          at - 00:46:38 04/10/2021
--
-- using Mentor Graphics HDL Designer(TM) 2018.2 (Build 19)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY lab9_register_decoder IS
  GENERIC(InBits : NATURAL RANGE 2 TO 6 := 5);
  PORT(
    sel : IN std_ulogic_vector(InBits-1 DOWNTO 0);
    OneHot : OUT std_ulogic_vector((2**InBits - 1) DOWNTO 0);
    enable : IN std_ulogic
  );
  
END ENTITY lab9_register_decoder;

--
ARCHITECTURE behav OF lab9_register_decoder IS
BEGIN
  PROCESS(sel, enable)
  VARIABLE selection : NATURAL RANGE 0 TO 63;
  VARIABLE result : std_logic_vector((2**InBits - 1) DOWNTO 0);
  CONSTANT zero : std_logic_vector((2**InBits - 1) DOWNTO 0) := (others=>'0');
  BEGIN
    
    result := zero;
    IF(enable = '1') THEN
      selection := To_Integer(unsigned(sel));
      result(selection) := '1';
      --if XXXXX???
    END IF;
    OneHot <= result;
    
    
  END PROCESS;
  
  
  
END ARCHITECTURE behav;


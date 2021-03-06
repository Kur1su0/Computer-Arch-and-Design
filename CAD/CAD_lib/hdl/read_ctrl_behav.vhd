--
-- VHDL Architecture CAD_lib.read_ctrl.behav
--
-- Created:
--          by - W.UNKNOWN (DESKTOP-86TQKQ1)
--          at - 16:05:07 02/22/2021
--
-- using Mentor Graphics HDL Designer(TM) 2018.2 (Build 19)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY read_ctrl IS
  PORT(
   jmp,rst : IN std_ulogic;
   Read : OUT std_ulogic  
  );
  END ENTITY read_ctrl;

--
ARCHITECTURE behav OF read_ctrl IS
BEGIN
  process(jmp,rst)
  begin
    if jmp='0' and rst='0' then Read <='1';
    else Read<='0';
    end if;
  end process;
  
  
END ARCHITECTURE behav;


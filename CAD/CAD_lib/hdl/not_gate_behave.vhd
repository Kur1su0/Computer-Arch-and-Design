--
-- VHDL Architecture CAD_lib.not_gate.behave
--
-- Created:
--          by - W.UNKNOWN (DESKTOP-86TQKQ1)
--          at - 17:02:06 02/22/2021
--
-- using Mentor Graphics HDL Designer(TM) 2018.2 (Build 19)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY pc_enable IS
  port(
    jmp_or_rst : IN std_ulogic;
    Delay : IN std_ulogic;
    Dout: OUT std_ulogic
);
END ENTITY pc_enable;

--
ARCHITECTURE behave OF pc_enable IS
BEGIN
  process(jmp_or_rst,Delay)
  begin
  if(jmp_or_rst='1') then Dout<='1';
  elsif (Delay<='0') then Dout<='1';
  else Dout<='0'; 
end if;
end process;
END ARCHITECTURE behave;


--
--ARCHITECTURE behave OF pc_enable IS
--BEGIN
--
--  Dout<=not Din;
--
--END ARCHITECTURE behave;


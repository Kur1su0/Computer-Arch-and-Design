--
-- VHDL Architecture CAD_lib.mem_delay.behav
--
-- Created:
--          by - W.UNKNOWN (DESKTOP-86TQKQ1)
--          at - 04:52:58 02/22/2021
--
-- using Mentor Graphics HDL Designer(TM) 2018.2 (Build 19)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY mem_delay IS
  Port(
    
    Read,clk: IN std_ulogic;
   
    Delay : OUT std_ulogic
  );
END ENTITY mem_delay;

--
ARCHITECTURE behav OF mem_delay IS
BEGIN
  process(clk,Read)
  begin
    if falling_edge(clk) then Delay<='1';
    end if;
    if (Read='0') then Delay<='0'; 
    
  end if;
  end process;
END ARCHITECTURE behav;


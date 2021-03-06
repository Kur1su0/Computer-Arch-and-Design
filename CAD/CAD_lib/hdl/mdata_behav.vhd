--
-- VHDL Architecture CAD_lib.mdata.behav
--
-- Created:
--          by - W.UNKNOWN (DESKTOP-86TQKQ1)
--          at - 04:51:53 02/22/2021
--
-- using Mentor Graphics HDL Designer(TM) 2018.2 (Build 19)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY mdata IS
  GENERIC(width : NATURAL RANGE 1 TO 64 := 32);
  PORT(
   Addr:IN std_ulogic_vector(width-1 downto 0);
  Read,clk: IN std_ulogic;
  Mdata : OUT std_ulogic_vector(width-1 downto 0)
  
);
END ENTITY mdata;

--
ARCHITECTURE behav OF mdata IS
BEGIN
   PROCESS(clk,Addr,Read)
  BEGIN
    --Delay <= '1';
    if rising_edge(clk) then
      --Delay <= '0';
      if Read='1' then 
        Mdata <= Addr;
        
      --else
     --   delay <= '0';
      end if;
  end if; 
  end process;
END ARCHITECTURE behav;


--
-- VHDL Architecture CAD_lib.mem.behave
--
-- Created:
--          by - W.UNKNOWN (DESKTOP-86TQKQ1)
--          at - 03:47:20 02/22/2021
--
-- using Mentor Graphics HDL Designer(TM) 2018.2 (Build 19)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY mem IS
  GENERIC(width : NATURAL RANGE 1 TO 64 := 32);
PORT(
   Addr:IN std_ulogic_vector(width -1 downto 0);
  Read,clk: IN std_ulogic;
  Mdata : OUT std_ulogic_vector(width -1 downto 0);
  Delay : OUT std_ulogic
);
  
  
END ENTITY mem;

--
--ARCHITECTURE behave OF mem IS
--BEGIN
--  PROCESS(clk,Addr,Read)
--  BEGIN
--    --Delay <= '1';
--    if rising_edge(clk) then
--      --Delay <= '0';
--      if Read='1' then 
--        Mdata <= Addr;
--        
--      --else
--     --   delay <= '0';
--      end if;
--  end if; 
--  end process;
-- 
-- 
--  
--END ARCHITECTURE behave;
ARCHITECTURE behave OF mem IS
  begin
  c_mdata : ENTITY work.mdata(behav)
  GENERIC MAP(width=>width)
  PORT MAP( Addr=>Addr, Read=>Read,clk=>clk,Mdata=>Mdata);
  
  c_delay : ENTITY work.mem_delay(behav)
  PORT MAP( Read=>Read,clk=>clk,Delay=>Delay);
  
  END ARCHITECTURE behave;

--
-- VHDL Architecture CAD_lib.lab9_register_decoder.lab9_regReadWrite
--
-- Created:
--          by - W.UNKNOWN (DESKTOP-86TQKQ1)
--          at - 00:58:17 04/10/2021
--
-- using Mentor Graphics HDL Designer(TM) 2018.2 (Build 19)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY lab9_regReadWrite IS
  GENERIC(size : NATURAL RANGE 2 TO 64 := 32);
PORT(

  D : IN std_ulogic_vector(size - 1 DOWNTO 0);
  Q1,Q2 : OUT std_logic_vector(size - 1 DOWNTO 0);
  Clk, LE, OE1,OE2 : IN std_ulogic);
  
END ENTITY lab9_regReadWrite;

--
ARCHITECTURE mixed OF lab9_regReadWrite IS
  --VARIABLE Qres1
  SIGNAL Qval : std_logic_vector(size - 1 DOWNTO 0);
  CONSTANT HiZ : std_logic_vector(size -1 DOWNTO 0) := (others => 'Z');
  BEGIN
  store : ENTITY work.reg(mixed)
GENERIC MAP(width => size)
PORT MAP(D=>D, Q=>Qval, clk=>Clk, enable=>LE,reset=>'0');
Q1 <= Qval WHEN OE1='1' ELSE HiZ;
Q2 <= Qval WHEN OE2='1' ELSE HiZ;


END ARCHITECTURE mixed;


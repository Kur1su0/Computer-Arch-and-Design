--
-- VHDL Architecture CAD_lib.Increment.mixed
--
-- Created:
--          by - W.UNKNOWN (DESKTOP-86TQKQ1)
--          at - 20:34:57 02/12/2021
--
-- using Mentor Graphics HDL Designer(TM) 2018.2 (Build 19)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
--USE ieee.std_logic_arith.all;
USE ieee.numeric_std.all;

ENTITY Increment IS
  GENERIC(width : NATURAL RANGE 1 TO 64 := 8);
  PORT( D : IN std_ulogic_vector(width - 1 DOWNTO 0);
    Q : OUT std_ulogic_vector(width - 1 DOWNTO 0);
    Inc : IN std_ulogic_vector(1 DOWNTO 0));
  END ENTITY Increment;
ARCHITECTURE mixed OF Increment IS 
  signal sum: UNSIGNED(width -1 DOWNTO 0);
  BEGIN
    with Inc Select sum <= UNSIGNED(D) when "00",
    
    UNSIGNED(D)+1 when "01",
    UNSIGNED(D)+2 when "10",
    UNSIGNED(D)+4 when "11",
    UNSIGNED(D) when others;
    
    Q<=std_ulogic_vector(sum);
  
END mixed;
  
  
  
--
--  ARCHITECTURE mixed OF Increment IS 
--    BEGIN
--   PROCESS(Inc,D)
--      VARIABLE get_sum : UNSIGNED(width - 1 DOWNTO 0);
--      BEGIN
--        -- 00 + 0, 01 + 1 10+ 2  , 11 +4
--
--        if(inc="00")     then get_sum:= UNSIGNED(D) + 0;
--        elsif (inc="01") then get_sum:= UNSIGNED(D) + 1;
--        elsif (inc="10")then get_sum:= UNSIGNED(D) + 2;
--        elsif (inc="11")then get_sum:= UNSIGNED(D) + 4;
--        else get_sum:= UNSIGNED(D) + 0;
--        end if;
--        Q<= std_ulogic_vector(get_sum);
--end process;
  
--end mixed;
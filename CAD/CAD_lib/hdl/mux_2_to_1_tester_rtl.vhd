--
-- VHDL Test Bench CAD_lib.mux_2_to_1_tester.mux_2_to_1_tester
--
-- Created:
--          by - W.UNKNOWN (DESKTOP-86TQKQ1)
--          at - 01:54:37 02/13/2021
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2018.2 (Build 19)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;


ENTITY mux_2_to_1_tester IS
   GENERIC (
      width : NATURAL RANGE 1 TO 64 := 8
   );
   PORT (
      Data_In_0 : OUT    std_ulogic_vector(width-1 DOWNTO 0);
      Data_In_1 : OUT    std_ulogic_vector(width-1 DOWNTO 0);
      Q         : IN     std_ulogic_vector(width-1 DOWNTO 0);
      Sel       : OUT    std_ulogic
   );
END mux_2_to_1_tester;


LIBRARY CAD_lib;

ARCHITECTURE rtl OF mux_2_to_1_tester IS
   -- Architecture declarations
BEGIN
END rtl;

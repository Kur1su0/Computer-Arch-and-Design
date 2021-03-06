--
-- VHDL Architecture my_project1_lib.mux_4_to_1.mixed
--
-- Created:
--          by - W.UNKNOWN (DESKTOP-86TQKQ1)
--          at - 17:00:31 02/12/2021
--
-- using Mentor Graphics HDL Designer(TM) 2018.2 (Build 19)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

ENTITY mux_4_to_1 IS
  GENERIC(width : NATURAL RANGE 1 TO 64 := 8);
  PORT(
    Data_In_0, Data_In_1,Data_In_2,Data_In_3 : IN std_ulogic_vector(width-1 DOWNTO 0);
    Q : OUT std_ulogic_vector(width-1 DOWNTO 0);
    Sel : IN std_ulogic_vector(1 downto 0)
    );
END ENTITY mux_4_to_1;
--
ARCHITECTURE mixed OF mux_4_to_1 IS
BEGIN
  PROCESS(Data_In_0,Data_In_1,Data_In_2,Data_In_3,Sel)
  CONSTANT other_state:std_ulogic_vector(width-1 DOWNTO 0):=(others=>'X'); 
  BEGIN
      if (Sel="00") then Q<=Data_In_0;
      elsif (Sel="01") then Q<=Data_In_1;
      elsif (Sel="10") then Q<=Data_In_2;
      elsif (Sel="11") then Q<=Data_In_3;
      else  Q<=other_state;
      END if;
        
      
  End PROCESS;
END ARCHITECTURE mixed;


--
-- VHDL Architecture CAD_lib.mux_2_to_1.mixed
--
-- Created:
--          by - W.UNKNOWN (DESKTOP-86TQKQ1)
--          at - 20:18:55 02/12/2021
--
-- using Mentor Graphics HDL Designer(TM) 2018.2 (Build 19)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY mux_2_to_1 IS
  GENERIC(width : NATURAL RANGE 1 TO 64 := 8);
  PORT(
    Data_In_0, Data_In_1 : IN std_ulogic_vector(width-1 DOWNTO 0);
    Q : OUT std_ulogic_vector(width-1 DOWNTO 0);
    Sel : IN std_ulogic
    );
  
  
END ENTITY mux_2_to_1;

--
ARCHITECTURE mixed OF mux_2_to_1 IS
BEGIN
    
PROCESS(Data_In_0,Data_In_1,Sel)
  CONSTANT other_state:std_ulogic_vector(width-1 DOWNTO 0):=(others=>'X'); 
  BEGIN
      if (Sel='0') then Q<=Data_In_0;
      elsif (Sel='1') then Q<=Data_In_1;
      else  Q<=(others=>'X');
      END if;
        
      
  End PROCESS;
  
  
END ARCHITECTURE mixed;


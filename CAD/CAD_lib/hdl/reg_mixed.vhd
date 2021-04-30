--
-- VHDL Architecture CAD_lib.reg.mixed
--
-- Created:
--          by - W.UNKNOWN (DESKTOP-86TQKQ1)
--          at - 02:08:47 02/13/2021
--
-- using Mentor Graphics HDL Designer(TM) 2018.2 (Build 19)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

ENTITY reg IS

GENERIC(width : NATURAL RANGE 1 TO 64 := 8);
PORT( D : IN std_ulogic_vector(width - 1 DOWNTO 0);
Q : OUT std_ulogic_vector(width - 1 DOWNTO 0);
clk, enable, reset : IN std_ulogic);

  
END ENTITY reg;

--
ARCHITECTURE mixed OF reg IS

BEGIN

  process(clk,reset,enable,D)
  variable X_s : std_ulogic_vector(width-1 downto 0):=(others=>'X');
  begin
    if (reset='1'  ) then
       
      Q<=(others=>'0');
    elsif (rising_edge(clk) and enable='1' )then
		if D /=X_s then
		  Q<=D;
		end if;
    end if;
     
      
  
  end process;
  
  
END ARCHITECTURE mixed;



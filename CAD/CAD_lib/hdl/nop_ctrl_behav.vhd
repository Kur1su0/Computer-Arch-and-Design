--
-- VHDL Architecture CAD_lib.nop_ctrl.behav
--
-- Created:
--          by - W.UNKNOWN (DESKTOP-86TQKQ1)
--          at - 16:44:34 02/22/2021
--
-- using Mentor Graphics HDL Designer(TM) 2018.2 (Build 19)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY nop_ctrl IS
  port(
    jmp,rst,delay:IN std_ulogic;
    mdata: In std_ulogic_vector (31 downto 0);
    Inst:OUT std_ulogic_vector (31 downto 0)
    
  );
END ENTITY nop_ctrl;

--
ARCHITECTURE behav OF nop_ctrl IS
BEGIN
  process(jmp,rst,delay)
  begin
    if jmp='0' and rst='0' and delay = '0' then Inst<=mdata;
    else Inst(31 downto 5)<=(others=>'0'); Inst(4 downto 0)<="10011";
    end if;
    
    
  end process;
  
END ARCHITECTURE behav;


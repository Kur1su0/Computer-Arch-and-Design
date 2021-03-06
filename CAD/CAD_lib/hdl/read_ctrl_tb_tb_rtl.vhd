--
-- VHDL Test Bench CAD_lib.read_ctrl_tb.read_ctrl_tester
--
-- Created:
--          by - W.UNKNOWN (DESKTOP-86TQKQ1)
--          at - 16:30:54 02/22/2021
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2018.2 (Build 19)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;


ENTITY read_ctrl_tb IS
END read_ctrl_tb;


LIBRARY CAD_lib;
USE CAD_lib.ALL;


ARCHITECTURE rtl OF read_ctrl_tb IS

   -- Architecture declarations

   -- Internal signal declarations
   SIGNAL jmp  : std_ulogic;
   SIGNAL rst  : std_ulogic;
   SIGNAL Read : std_ulogic;


   -- Component declarations
   COMPONENT read_ctrl
      PORT (
         jmp  : IN     std_ulogic;
         rst  : IN     std_ulogic;
         Read : OUT    std_ulogic
      );
   END COMPONENT;

   -- embedded configurations
   -- pragma synthesis_off
   FOR U_0 : read_ctrl USE ENTITY CAD_lib.read_ctrl;
   -- pragma synthesis_on

BEGIN

         U_0 : read_ctrl
            PORT MAP (
               jmp  => jmp,
               rst  => rst,
               Read => Read
            );

process
begin
  jmp<='0'; rst <= '0'; wait for 100ns;
  jmp<='1'; rst <= '0'; wait for 100ns;
  jmp<='0'; rst <= '1'; wait for 100ns;
  jmp<='1'; rst <= '1'; wait for 100ns;
  
  
end process;
END rtl;
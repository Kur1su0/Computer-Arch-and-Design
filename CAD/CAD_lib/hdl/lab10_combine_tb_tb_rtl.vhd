--
-- VHDL Test Bench CAD_lib.lab10_combine_tb.lab10_combine_tester
--
-- Created:
--          by - W.UNKNOWN (DESKTOP-86TQKQ1)
--          at - 17:25:18 04/20/2021
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2018.2 (Build 19)
--
LIBRARY CAD_lib;
USE CAD_lib.RV32I.all;
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;


ENTITY lab10_combine_tb IS
END lab10_combine_tb;


LIBRARY CAD_lib;
USE CAD_lib.ALL;


ARCHITECTURE rtl OF lab10_combine_tb IS

   -- Architecture declarations

   -- Internal signal declarations
   SIGNAL clk : std_ulogic;


   -- Component declarations
   COMPONENT lab10_combine
      PORT (
         clk : IN     std_ulogic
      );
   END COMPONENT;

   -- embedded configurations
   -- pragma synthesis_off
   FOR U_0 : lab10_combine USE ENTITY CAD_lib.lab10_combine;
   -- pragma synthesis_on

BEGIN

         U_0 : lab10_combine
            PORT MAP (
               clk => clk
            );

process
begin
  clk<='0'; wait for 100ns;
  clk<='1'; wait for 100ns;
  
  clk<='0'; wait for 100ns;
  clk<='1'; wait for 100ns;
  
  clk<='0'; wait for 100ns;
  clk<='1'; wait for 100ns;
  
  clk<='0'; wait for 100ns;
  clk<='1'; wait for 100ns;
  
  clk<='0'; wait for 100ns;
  clk<='1'; wait for 100ns;
  
  clk<='0'; wait for 100ns;
  clk<='1'; wait for 100ns;
  
  clk<='0'; wait for 100ns;
  clk<='1'; wait for 100ns;
  
  clk<='0'; wait for 100ns;
  clk<='1'; wait for 100ns;
  
  clk<='0'; wait for 100ns;
  clk<='1'; wait for 100ns;
  
  clk<='0'; wait for 100ns;
  clk<='1'; wait for 100ns;
  
  clk<='0'; wait for 100ns;
  clk<='1'; wait for 100ns;
  
  clk<='0'; wait for 100ns;
  clk<='1'; wait for 100ns;
  
  clk<='0'; wait for 100ns;
  clk<='1'; wait for 100ns;
  
  clk<='0'; wait for 100ns;
  clk<='1'; wait for 100ns;
  
  clk<='0'; wait for 100ns;
  clk<='1'; wait for 100ns;
  
  clk<='0'; wait for 100ns;
  clk<='1'; wait for 100ns;
  
  
  clk<='0'; wait for 100ns;
  clk<='1'; wait for 100ns;
  
  clk<='0'; wait for 100ns;
  clk<='1'; wait for 100ns;
  
  clk<='0'; wait for 100ns;
  clk<='1'; wait for 100ns;
  
  clk<='0'; wait for 100ns;
  clk<='1'; wait for 100ns;
wait;
end process;
END rtl;
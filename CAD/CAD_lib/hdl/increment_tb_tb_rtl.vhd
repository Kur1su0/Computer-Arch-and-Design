--
-- VHDL Test Bench CAD_lib.Increment_tb.Increment_tester
--
-- Created:
--          by - W.UNKNOWN (DESKTOP-86TQKQ1)
--          at - 18:35:01 02/14/2021
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2018.2 (Build 19)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;


ENTITY Increment_tb IS
   GENERIC (
      width : NATURAL RANGE 1 TO 64 := 8
   );
END Increment_tb;


LIBRARY CAD_lib;
USE CAD_lib.ALL;


ARCHITECTURE rtl OF Increment_tb IS

   -- Architecture declarations

   -- Internal signal declarations
   SIGNAL D   : std_ulogic_vector(width - 1 DOWNTO 0);
   SIGNAL Q   : std_ulogic_vector(width - 1 DOWNTO 0);
   SIGNAL Inc : std_ulogic_vector(1 DOWNTO 0);


   -- Component declarations
   COMPONENT Increment
      GENERIC (
         width : NATURAL RANGE 1 TO 64 := 8
      );
      PORT (
         D   : IN     std_ulogic_vector(width - 1 DOWNTO 0);
         Q   : OUT    std_ulogic_vector(width - 1 DOWNTO 0);
         Inc : IN     std_ulogic_vector(1 DOWNTO 0)
      );
   END COMPONENT;

   -- embedded configurations
   -- pragma synthesis_off
   FOR U_0 : Increment USE ENTITY CAD_lib.Increment;
   -- pragma synthesis_on

BEGIN

         U_0 : Increment
            GENERIC MAP (
               width => width
            )
            PORT MAP (
               D   => D,
               Q   => Q,
               Inc => Inc
            );
always: process
begin
 D<="00001111"; Inc<="01"; wait for 100ns;
 D<="00000001"; Inc<="01"; wait for 100ns;
 D<="00000001"; Inc<="10"; wait for 100ns;
 D<="00000001"; Inc<="11"; wait for 100ns;
 D<="00000001"; Inc<="00"; wait for 100ns;
wait;
end process always;

END rtl;
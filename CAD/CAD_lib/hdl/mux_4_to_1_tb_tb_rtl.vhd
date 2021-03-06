--
-- VHDL Test Bench CAD_lib.mux_4_to_1_tb.mux_4_to_1_tester
--
-- Created:
--          by - W.UNKNOWN (DESKTOP-86TQKQ1)
--          at - 21:23:16 02/14/2021
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2018.2 (Build 19)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;


ENTITY mux_4_to_1_tb IS
   GENERIC (
      width : NATURAL RANGE 1 TO 64 := 8
   );
END mux_4_to_1_tb;


LIBRARY CAD_lib;
USE CAD_lib.ALL;


ARCHITECTURE rtl OF mux_4_to_1_tb IS

   -- Architecture declarations

   -- Internal signal declarations
   SIGNAL Data_In_0 : std_ulogic_vector(width-1 DOWNTO 0);
   SIGNAL Data_In_1 : std_ulogic_vector(width-1 DOWNTO 0);
   SIGNAL Data_In_2 : std_ulogic_vector(width-1 DOWNTO 0);
   SIGNAL Data_In_3 : std_ulogic_vector(width-1 DOWNTO 0);
   SIGNAL Q         : std_ulogic_vector(width-1 DOWNTO 0);
   SIGNAL Sel       : std_ulogic_vector(1 downto 0);


   -- Component declarations
   COMPONENT mux_4_to_1
      GENERIC (
         width : NATURAL RANGE 1 TO 64 := 8
      );
      PORT (
         Data_In_0 : IN     std_ulogic_vector(width-1 DOWNTO 0);
         Data_In_1 : IN     std_ulogic_vector(width-1 DOWNTO 0);
         Data_In_2 : IN     std_ulogic_vector(width-1 DOWNTO 0);
         Data_In_3 : IN     std_ulogic_vector(width-1 DOWNTO 0);
         Q         : OUT    std_ulogic_vector(width-1 DOWNTO 0);
         Sel       : IN     std_ulogic_vector(1 downto 0)
      );
   END COMPONENT;

   -- embedded configurations
   -- pragma synthesis_off
   FOR U_0 : mux_4_to_1 USE ENTITY CAD_lib.mux_4_to_1;
   -- pragma synthesis_on

BEGIN

         U_0 : mux_4_to_1
            GENERIC MAP (
               width => width
            )
            PORT MAP (
               Data_In_0 => Data_In_0,
               Data_In_1 => Data_In_1,
               Data_In_2 => Data_In_2,
               Data_In_3 => Data_In_3,
               Q         => Q,
               Sel       => Sel
            );
 
 always:process
 begin
 Data_In_0<="00000001";
  Data_In_1 <="00010000";
  Data_In_2 <="10000000";
  Data_In_3 <="11111111";
  Sel<="00"; wait for 100ns;
  
  Sel<="01"; wait for 100ns;
  
  Sel<="10"; wait for 100ns;
   Sel<="11"; wait for 100ns;
wait;
end process always;

END rtl;
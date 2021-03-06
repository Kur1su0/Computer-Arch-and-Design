--
-- VHDL Test Bench CAD_lib.lab9_regReadWrite_tb.lab9_regReadWrite_tester
--
-- Created:
--          by - W.UNKNOWN (DESKTOP-86TQKQ1)
--          at - 01:12:43 04/10/2021
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2018.2 (Build 19)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;


ENTITY lab9_regReadWrite_tb IS
   GENERIC (
      size : NATURAL RANGE 2 TO 64 := 32
   );
END lab9_regReadWrite_tb;


LIBRARY CAD_lib;
USE CAD_lib.ALL;


ARCHITECTURE rtl OF lab9_regReadWrite_tb IS

   -- Architecture declarations

   -- Internal signal declarations
   SIGNAL D   : std_ulogic_vector(size - 1 DOWNTO 0);
   SIGNAL Q1  : std_logic_vector(size - 1 DOWNTO 0);
   SIGNAL Q2  : std_logic_vector(size - 1 DOWNTO 0);
   SIGNAL Clk : std_ulogic;
   SIGNAL LE  : std_ulogic;
   SIGNAL OE1 : std_ulogic;
   SIGNAL OE2 : std_ulogic;


   -- Component declarations
   COMPONENT lab9_regReadWrite
      GENERIC (
         size : NATURAL RANGE 2 TO 64 := 32
      );
      PORT (
         D   : IN     std_ulogic_vector(size - 1 DOWNTO 0);
         Q1  : OUT    std_logic_vector(size - 1 DOWNTO 0);
         Q2  : OUT    std_logic_vector(size - 1 DOWNTO 0);
         Clk : IN     std_ulogic;
         LE  : IN     std_ulogic;
         OE1 : IN     std_ulogic;
         OE2 : IN     std_ulogic
      );
   END COMPONENT;

   -- embedded configurations
   -- pragma synthesis_off
   FOR U_0 : lab9_regReadWrite USE ENTITY CAD_lib.lab9_regReadWrite;
   -- pragma synthesis_on

BEGIN

         U_0 : lab9_regReadWrite
            GENERIC MAP (
               size => size
            )
            PORT MAP (
               D   => D,
               Q1  => Q1,
               Q2  => Q2,
               Clk => Clk,
               LE  => LE,
               OE1 => OE1,
               OE2 => OE2
            );

process 
begin
  
   D<=x"ffffffff";
  LE<='1';
  clk<='0'; wait for 100ns;
 clk<='1'; wait for 100ns;
         
         OE1<='1';
         OE2<='1';
         
         clk<='0'; wait for 100ns;
         clk<='1'; wait for 100ns;
         
           OE1<='0';
         OE2<='1';
         
         clk<='0'; wait for 100ns;
         clk<='1'; wait for 100ns;
         
          OE1<='1';
         OE2<='0';
         
         clk<='0'; wait for 100ns;
         clk<='1'; wait for 100ns;
         
         OE1<='0';
         OE2<='0';
         
         clk<='0'; wait for 100ns;
         clk<='1'; wait for 100ns;
         wait;
end process;

END rtl;
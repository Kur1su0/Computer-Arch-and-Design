--
-- VHDL Test Bench CAD_lib.decode_proc_tb.decode_proc_tester
--
-- Created:
--          by - W.UNKNOWN (DESKTOP-86TQKQ1)
--          at - 01:51:24 03/22/2021
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2018.2 (Build 19)
--
LIBRARY CAD_lib;
USE CAD_lib.RV32I.ALL;
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;
USE work.RV32I.ALL;

ENTITY decode_proc_tb IS
END decode_proc_tb;


LIBRARY CAD_lib;
USE CAD_lib.ALL;


ARCHITECTURE rtl OF decode_proc_tb IS

   -- Architecture declarations

   -- Internal signal declarations
   SIGNAL FunC      : RV32I_Op;
   SIGNAL Immediate : std_ulogic_vector(31 DOWNTO 0);
   SIGNAL Address   : std_ulogic_vector(31 DOWNTO 0);
   SIGNAL DataA     : std_ulogic_vector(31 DOWNTO 0);
   SIGNAL DataB     : std_ulogic_vector(31 DOWNTO 0);
   SIGNAL L         : std_ulogic_vector(31 DOWNTO 0);
   SIGNAL R         : std_ulogic_vector(31 DOWNTO 0);
   SIGNAL Extra     : std_ulogic_vector(31 DOWNTO 0);


   -- Component declarations
   COMPONENT decode_proc
      PORT (
         FunC      : IN     RV32I_Op;
         Immediate : IN     std_ulogic_vector(31 DOWNTO 0);
         Address   : IN     std_ulogic_vector(31 DOWNTO 0);
         DataA     : IN     std_ulogic_vector(31 DOWNTO 0);
         DataB     : IN     std_ulogic_vector(31 DOWNTO 0);
         L         : OUT    std_ulogic_vector(31 DOWNTO 0);
         R         : OUT    std_ulogic_vector(31 DOWNTO 0);
         Extra     : OUT    std_ulogic_vector(31 DOWNTO 0)
      );
   END COMPONENT;

   -- embedded configurations
   -- pragma synthesis_off
   FOR U_0 : decode_proc USE ENTITY CAD_lib.decode_proc;
   -- pragma synthesis_on

BEGIN

         U_0 : decode_proc
            PORT MAP (
               FunC      => FunC,
               Immediate => Immediate,
               Address   => Address,
               DataA     => DataA,
               DataB     => DataB,
               L         => L,
               R         => R,
               Extra     => Extra
            );


process
begin
  Address<="00000000001000001000001110110011";
  Immediate<="00000000000000000000000000000000";
  FunC<=ADDr;
  DataA<="00000000000000000000000000000001";
  DataB<="00000000000000000000000000000010";
  wait for 10ns;
  wait;
  
end process;


END rtl;
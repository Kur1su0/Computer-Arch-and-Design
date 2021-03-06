--
-- VHDL Test Bench CAD_lib.lab9_regFile_tb.lab9_regFile_tester
--
-- Created:
--          by - W.UNKNOWN (DESKTOP-86TQKQ1)
--          at - 01:37:04 04/10/2021
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2018.2 (Build 19)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;
--USE work.RV32I.ALL;
USE std.textio.all;

ENTITY lab9_regFile_tb IS
   GENERIC (
      RegWidth : NATURAL RANGE 2 TO 64 := 32;
      RegSel   : NATURAL RANGE 2 TO 5  := 5
   );
END lab9_regFile_tb;


LIBRARY CAD_lib;
USE CAD_lib.ALL;


ARCHITECTURE rtl OF lab9_regFile_tb IS

   -- Architecture declarations
FILE test_vectors : text OPEN read_mode IS "lab9_rf_vec.txt";
   -- Internal signal declarations
   SIGNAL D         : std_ulogic_vector(RegWidth-1 DOWNTO 0);
   SIGNAL Q1,Q1_valid        : std_logic_vector(RegWidth-1 DOWNTO 0);
   SIGNAL Q2,Q2_valid        : std_logic_vector(RegWidth-1 DOWNTO 0);
   SIGNAL ReadSel_1 : std_ulogic_vector(RegSel-1 DOWNTO 0);
   SIGNAL ReadSel_2 : std_ulogic_vector(RegSel-1 DOWNTO 0);
   SIGNAL WriteSel  : std_ulogic_vector(RegSel-1 DOWNTO 0);
   SIGNAL Clock     : std_ulogic;
   SIGNAL Load      : std_ulogic;
   SIGNAL vecno : NATURAL := 0;

   -- Component declarations
   COMPONENT lab9_regFile
      GENERIC (
         RegWidth : NATURAL RANGE 2 TO 64 := 32;
         RegSel   : NATURAL RANGE 2 TO 5  := 5
      );
      PORT (
         D         : IN     std_ulogic_vector(RegWidth-1 DOWNTO 0);
         Q1        : OUT    std_logic_vector(RegWidth-1 DOWNTO 0);
         Q2        : OUT    std_logic_vector(RegWidth-1 DOWNTO 0);
         ReadSel_1 : IN     std_ulogic_vector(RegSel-1 DOWNTO 0);
         ReadSel_2 : IN     std_ulogic_vector(RegSel-1 DOWNTO 0);
         WriteSel  : IN     std_ulogic_vector(RegSel-1 DOWNTO 0);
         Clock     : IN     std_ulogic;
         Load      : IN     std_ulogic
      );
   END COMPONENT;

   -- embedded configurations
   -- pragma synthesis_off
   FOR U_0 : lab9_regFile USE ENTITY CAD_lib.lab9_regFile;
   -- pragma synthesis_on

BEGIN

         U_0 : lab9_regFile
            GENERIC MAP (
               RegWidth => RegWidth,
               RegSel   => RegSel
            )
            PORT MAP (
               D         => D,
               Q1        => Q1,
               Q2        => Q2,
               ReadSel_1 => ReadSel_1,
               ReadSel_2 => ReadSel_2,
               WriteSel  => WriteSel,
               Clock     => Clock,
               Load      => Load
          );
          
          
          
stimu: process
  VARIABLE L : LINE;
  VARIABLE vD               : std_ulogic_vector(RegWidth-1 DOWNTO 0);
  VARIABLE vReadSel_1,vReadSel_2,vWriteSel       : std_ulogic_vector(RegSel-1 DOWNTO 0);
  VARIABLE vLoad :std_ulogic;
  VARIABLE vQ1_valid,vQ2_valid : std_logic_vector(RegWidth-1 DOWNTO 0);
  VARIABLE space:string(1 DOWNTO 1);
begin
      
     readline(test_vectors,L);
     
  WHILE NOT endfile(test_vectors) LOOP
    
    readline(test_vectors,L); 
    --hread(L,vQ1_valid); 
--    hread(L,vQ2_valid); 
    hread(L,vD); D<=vD;
    read(L,vReadSel_1); ReadSel_1<=vReadSel_1;
    read(L,vReadSel_2); ReadSel_2<=vReadSel_2;
    read(L,vWriteSel);  WriteSel<=vWriteSel;
    read(L,vLoad);        Load<=vLoad;
    
    
    
    Clock<='0'; wait for 100ns;
    --Q1_valid<=vQ1_valid;
--    Q2_valid<=vQ2_valid;
    --read(L,space); 
    hread(L,vQ1_valid); Q1_valid<=vQ1_valid;
    --read(L,space); 
    hread(L,vQ2_valid); Q2_valid<=vQ2_valid;
    Clock<='1'; wait for 100ns;
   
  End Loop;
  report "END of TB";
  wait;
end process;

check : process(Clock)
begin
  if falling_edge(Clock) then
        vecno <= vecno + 1;
        
        
        ASSERT Q1=Q1_valid
        REPORT "ERROR: Q1 " & to_string(vecno)
        SEVERITY WARNING; 
        
        ASSERT Q2=Q2_valid
        REPORT "ERROR: Q2 " & to_string(vecno)
        SEVERITY WARNING; 
        
        
        
 end if;     
  
end process;
--process 
--begin
--    
--    D<=x"ffffffff";
--    WriteSel<="00010";
--    Load<='1'; 
--    ReadSel_1<="00000";
--    ReadSel_2<="00000"; 
--    Clock<='0'; wait for 100ns;
--    Clock<='1'; wait for 100ns;
--    
--    D<=x"00000001";
--    WriteSel<="00011";
--    Load<='1'; 
--    ReadSel_1<="00000";
--    ReadSel_2<="00000"; 
--    Clock<='0'; wait for 100ns;
--    Clock<='1'; wait for 100ns;
--    
--    
--    Load<='0';
--    ReadSel_1<="00010";
--    ReadSel_2<="00011";
--    Clock<='0'; wait for 100ns;
--    Clock<='1'; wait for 100ns;
--    wait;
--end process;

END rtl;
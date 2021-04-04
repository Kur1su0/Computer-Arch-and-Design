--
-- VHDL Test Bench CAD_lib.lab7_exe_tb.lab7_exe_tester
--
-- Created:
--          by - W.UNKNOWN (DESKTOP-86TQKQ1)
--          at - 20:57:33 03/28/2021
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2018.2 (Build 19)
--
LIBRARY CAD_lib;
USE CAD_lib.RV32I.all;
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;
USE work.RV32I.ALL;
USE std.textio.all;


ENTITY lab7_exe_tb IS
   GENERIC (
      width : NATURAL RANGE 1 TO 64 := 32
   );
END lab7_exe_tb;


LIBRARY CAD_lib;
USE CAD_lib.ALL;


ARCHITECTURE rtl OF lab7_exe_tb IS

   -- Architecture declarations
   FILE test_vectors : text OPEN read_mode IS "lab7_vec.txt";	
   -- Internal signal declarations
   SIGNAL clk      : std_ulogic;
   SIGNAL Left     : std_ulogic_vector(31 DOWNTO 0);
   SIGNAL Right    : std_ulogic_vector(31 DOWNTO 0);
   SIGNAL Extra    : std_ulogic_vector(31 DOWNTO 0);
   SIGNAL Rd_in    : std_ulogic_vector(4 DOWNTO 0);
   SIGNAL FunC_in  : RV32I_Op;
   
   SIGNAL Func_out,Func_out_valid : RV32I_Op;
   SIGNAL Rd_out,Rd_out_valid   : std_ulogic_vector(4 DOWNTO 0);
   SIGNAL Address,Address_valid  : std_ulogic_vector(31 DOWNTO 0);
   SIGNAL Data,Data_valid     : std_ulogic_vector(31 DOWNTO 0);
   SIGNAL Jaddr,Jaddr_valid    : std_ulogic_vector(31 DOWNTO 0);
   SIGNAL Jump,Jump_valid     : std_ulogic;
   SIGNAL overflow,overflow_valid: std_ulogic;
  SIGNAL vecno : NATURAL := 0;
  

   -- Component declarations
   COMPONENT lab7_exe
      GENERIC (
         width : NATURAL RANGE 1 TO 64 := 32
      );
      PORT (
         clk      : IN     std_ulogic;
         Left     : IN     std_ulogic_vector(31 DOWNTO 0);
         Right    : IN     std_ulogic_vector(31 DOWNTO 0);
         Extra    : IN     std_ulogic_vector(31 DOWNTO 0);
         Rd_in    : IN     std_ulogic_vector(4 DOWNTO 0);
         FunC_in  : IN     RV32I_Op;
         Func_out : OUT    RV32I_Op;
         Rd_out   : OUT    std_ulogic_vector(4 DOWNTO 0);
         Address  : OUT    std_ulogic_vector(31 DOWNTO 0);
         Data     : OUT    std_ulogic_vector(31 DOWNTO 0);
         Jaddr    : OUT    std_ulogic_vector(31 DOWNTO 0);
         Jump,overflow     : OUT    std_ulogic
      );
   END COMPONENT;

   -- embedded configurations
   -- pragma synthesis_off
   FOR U_0 : lab7_exe USE ENTITY CAD_lib.lab7_exe;
   -- pragma synthesis_on

BEGIN

         U_0 : lab7_exe
            GENERIC MAP (
               width => width
            )
            PORT MAP (
               clk      => clk,
               Left     => Left,
               Right    => Right,
               Extra    => Extra,
               Rd_in    => Rd_in,
               FunC_in  => FunC_in,
               Func_out => Func_out,
               Rd_out   => Rd_out,
               Address  => Address,
               Data     => Data,
               Jaddr    => Jaddr,
               Jump     => Jump,
               overflow =>overflow
            );
stim: process

  VARIABLE L : LINE;
  VARIABLE v_Rd_in,v_Rd_out_valid  :std_ulogic_vector(4 downto 0);
  VARIABLE v_Left,v_Right,v_Extra :std_ulogic_vector(31 downto 0);
  VARIABLE v_FunC_in,v_Func_out_valid  : Func_Name;

  VARIABLE v_Address_valid,v_Data_valid,v_Jaddr_valid  : std_ulogic_vector(31 downto 0);
  VARIABLE v_Jump,v_Jump_valid     : std_ulogic;
  VARIABLE v_overflow_valid : std_ulogic;
  VARIABLE space:string(1 DOWNTO 1);
begin
  readline(test_vectors,L);
  WHILE NOT endfile(test_vectors) LOOP
  
    readline(test_vectors,L); 
  
    --IN

      hread(L,v_Left);  Left<=v_Left;
      hread(L,v_Right); Right<=v_Right;
      hread(L,v_Extra); Extra<=v_Extra;
      read(L,v_Rd_in);  Rd_in<=v_Rd_in;
      read(L,space); 
      read(L,v_FunC_in);FunC_in<=Ftype(v_FunC_in);
      clk<='0'; wait for 100ns;
  --OUT
      hread(L,v_Address_valid); Address_valid<=v_Address_valid;
      hread(L,v_Data_valid);    Data_valid<=v_Data_valid;
      read(L,v_Rd_out_valid);  Rd_out_valid<=v_Rd_out_valid;
      read(L,space); 
      read(L,v_Func_out_valid);       Func_out_valid<=Ftype(v_Func_out_valid);
      
      hread(L,v_Jaddr_valid);   Jaddr_valid<=v_Jaddr_valid;
      read(L,v_Jump_valid);     Jump_valid<=v_Jump_valid;
      
      read(L,v_overflow_valid); overflow_valid<=v_overflow_valid;
     
      
      clk<='1'; wait for 100ns;
  End Loop;
  report "END of TB";
  wait;
end process;


check: process(clk)
begin
  if falling_edge(clk) then
        vecno <= vecno + 1;
        
        
        ASSERT Address=Address_valid
        REPORT "ERROR: Address " & to_string(vecno)
        SEVERITY WARNING; 
        
        ASSERT Data=Data_valid
        REPORT "ERROR: Data " & to_string(vecno)
        SEVERITY WARNING;
        
        ASSERT Rd_out=Rd_out_valid
        REPORT "ERROR: Rd_out " & to_string(vecno)
        SEVERITY WARNING;
        
        ASSERT Func_out=Func_out_valid
        REPORT "ERROR: Func_out " & to_string(vecno)
        SEVERITY WARNING;
        
        ASSERT Jaddr=Jaddr_valid
        REPORT "ERROR: Jaddr " & to_string(vecno)
        SEVERITY WARNING;
        
        
        ASSERT Jump=Jump_valid
        REPORT "ERROR: Jump " & to_string(vecno)
        SEVERITY WARNING;
        
        ASSERT overflow=overflow_valid
        REPORT "ERROR: overflow " & to_string(vecno)
        SEVERITY WARNING;
        
        
  end if;
end process;


END rtl;
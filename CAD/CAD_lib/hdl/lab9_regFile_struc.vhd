--
-- VHDL Architecture CAD_lib.lab9_regFile.struc
--
-- Created:
--          by - W.UNKNOWN (DESKTOP-86TQKQ1)
--          at - 01:18:11 04/10/2021
--
-- using Mentor Graphics HDL Designer(TM) 2018.2 (Build 19)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
-- VHDL Architecture CAD_lib.lab9_regFile.struc
--
-- Created:
--          by - W.UNKNOWN (DESKTOP-86TQKQ1)
--          at - 01:18:11 04/10/2021
--
-- using Mentor Graphics HDL Designer(TM) 2018.2 (Build 19)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;
USE work.RV32I.all;
ENTITY lab9_regFile IS
  GENERIC(RegWidth : NATURAL RANGE 2 TO 64 := 32;
  RegSel : NATURAL RANGE 2 TO 5 := 5);
  
  PORT(
	bypass :IN std_logic_vector(1 downto 0);
    D : IN std_ulogic_vector(RegWidth-1 DOWNTO 0);
    Q1,Q2 : OUT std_ulogic_vector(RegWidth-1 DOWNTO 0);
    ReadSel_1,ReadSel_2, WriteSel : IN std_ulogic_vector(RegSel-1 DOWNTO 0);
    Clock, Load : IN std_ulogic
  );
  
END ENTITY lab9_regFile;

--
ARCHITECTURE struc OF lab9_regFile IS
  SIGNAL ReadDC1,ReadDC2, WriteDC : std_ulogic_vector((2**RegSel)-1 DOWNTO 0);
  SIGNAL RegOut1,RegOut2 : std_logic_vector(RegWidth-1 DOWNTO 0);
BEGIN
  ReadDecode1 : ENTITY work.lab9_register_decoder(behav)
  GENERIC MAP(InBits=>RegSel)
  PORT MAP(sel=>ReadSel_1, OneHot=>ReadDC1, enable=>'1');
    
    
    ReadDecode2 : ENTITY work.lab9_register_decoder(behav)
    GENERIC MAP(InBits=>RegSel)
    PORT MAP(sel=>ReadSel_2, OneHot=>ReadDC2, enable=>'1');
      
      WriteDecode : ENTITY work.lab9_register_decoder(behav)
      GENERIC MAP(InBits=>RegSel)
      PORT MAP(sel=>WriteSel, OneHot=>WriteDC, enable=>Load);
        
        
        RegArray : FOR i IN 0 TO ((2**RegSel)-1) GENERATE
          BEGIN
            RegI : ENTITY work.lab9_regReadWrite(Mixed)
            GENERIC MAP(size=>RegWidth)
            PORT MAP(D=>D, Q1=>RegOut1,Q2=>RegOut2, Clk=>Clock, LE=>WriteDC(i), OE1=>ReadDC1(i),OE2=>ReadDC2(i));
           END GENERATE RegArray;
            
            --flage 
            
            -- process(ReadSel_1,ReadSel_2,WriteSel,RegOut1,RegOut2,D) 
            -- begin
				
				-- if ReadSel_1="00000" then Q1 <=ZEROS_32;
				-- --elsif
				-- --	bypass(0)='1'   then Q1<=D;
				-- --else
					-- Q1<=std_ulogic_vector(UNSIGNED(RegOut1));
				-- end if;
				
				-- if ReadSel_2="00000" then Q2 <=ZEROS_32;
				-- --elsif 
				-- --	bypass(1)='1' then Q2<=D;
				-- else
					-- Q2<=std_ulogic_vector(UNSIGNED(RegOut2));
				-- end if;

			
              --Q1<=ZEROS_32 when  or RegOut1=ZEROS_32&'X' or RegOut1=ZEROS_32&'U' else  std_ulogic_vector(UNSIGNED(RegOut1));
              --Q2<=ZEROS_32 when ReadSel_2="00000" or RegOut2=ZEROS_32&'X' or RegOut2=ZEROS_32&'U' else std_ulogic_vector(UNSIGNED(RegOut2));
              
            -- Q2<=std_ulogic_vector(UNSIGNED(RegOut2));
            -- Q1<=std_ulogic_vector(UNSIGNED(RegOut1));
            
            
            -- if  ReadSel_1=WriteSel then
              -- Q1<= D;
            -- elsif
            -- ReadSel_1="00000"  then Q1<=ZEROS_32; 
            -- end if;
            
            -- if  ReadSel_2=WriteSel then 
              -- Q2<= D;
              
            -- elsif ReadSel_2="00000"  then Q2<=ZEROS_32;
            -- end if;
            
			
			
			-- if bypass(0)='1'   then --READ1
				-- Q1<=D;
			-- end if;
			
			-- if bypass(1)='1'  then --READ2
				-- Q2<=D;
			-- end if;
			
			
            -- if(ReadSel_1="00000") then Q1<=ZEROS_32; 
            -- end if;
              
            -- if(ReadSel_2="00000") then Q2<=ZEROS_32; 
            -- end if;
               
			

			
            -- end process;
               Q1<= ZEROS_32 when ReadSel_1="00000" else std_ulogic_vector(UNSIGNED(RegOut1));
               Q2<= ZEROS_32 when ReadSel_2="00000"  else std_ulogic_vector(UNSIGNED(RegOut2));
              
              
              --Q1 <= RegOut1;
              --Q2 <= RegOut2;    
              
            END ARCHITECTURE struc;
            
            
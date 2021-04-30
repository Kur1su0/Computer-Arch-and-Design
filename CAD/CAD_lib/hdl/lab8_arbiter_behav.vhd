--
-- VHDL Architecture CAD_lib.lab8_arbiter.behav
--
-- Created:
--          by - W.UNKNOWN (DESKTOP-86TQKQ1)
--          at - 21:39:37 04/ 4/2021
--
-- using Mentor Graphics HDL Designer(TM) 2018.2 (Build 19)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;
USE work.RV32I.ALL;

ENTITY lab8_arbiter IS
PORT(
	mdelay 											: IN std_ulogic;
    MemSyst_Din,MStg_Din,Mstg_Addr,Fetch_addr		: IN std_ulogic_vector(31 DOWNTO 0);
	Mstg_w,Mstg_r,Fetch_r 							: IN std_ulogic;
	MStg_Dout,MemSyst_Dout,Fetch_Dout,MemSyst_Addr 	: OUT std_ulogic_vector(31 DOWNTO 0);
	mdelayF,mdelayM		 							: OUT std_ulogic;
	r,w:OUT std_ulogic
	);
END ENTITY lab8_arbiter;

--
ARCHITECTURE behav OF lab8_arbiter IS
BEGIN
	MStg_Dout<=MemSyst_Din;
	Fetch_Dout<=MemSyst_Din;
	MemSyst_Dout<=MStg_Din;
	w<=Mstg_w;
	mdelayF<= (Mstg_w or Mstg_r or mdelay);
	mdelayM<=mDelay;

addr:process(Mstg_Addr,Fetch_addr,Mstg_w,Mstg_r)
	begin
		if(Mstg_w='1' or Mstg_r='1' ) then
			MemSyst_Addr<=Mstg_Addr;
		else
			MemSyst_Addr<=Fetch_addr;
		end if;
	end process;
re:process(Mstg_w,Mstg_r,Fetch_r)
begin
	if(Mstg_w='1' or Mstg_r='1' ) then
		r<=Mstg_r;
	else
		r<=Fetch_r;
	
	end if;
end process;	

	--
--
-- PROCESS (mdelay,MemSyst_Din,MStg_Din,Mstg_Addr,Mstg_w,Mstg_r,Fetch_r,Fetch_addr)
-- BEGIN 
--	 if mdelay='1' then
--			 MStg_Dout<=ZEROS_32; 
--			 Fetch_Dout<=ZEROS_32;
--			 MemSyst_Dout<=ZEROS_32;MemSyst_Addr<=ZEROS_32;
--			
--			 mdelayF<='1';mdelayM<='1';
--			
--	 else
--		 mdelayF<='0';mdelayM<='0';
--		 MStg_Dout<=ZEROS_32; 
--		 Fetch_Dout<=ZEROS_32;
--		 MemSyst_Dout<=ZEROS_32;MemSyst_Addr<=ZEROS_32;
--		
--		 if Mstg_w='1' then
--			 MemSyst_Dout<=MStg_Din;			
--		 end if; 
--		 if Mstg_r='1' then
--		     if Fetch_r='1' then mdelayF<='1';
--			 end if;
--			 MemSyst_Addr<=Mstg_Addr;
--			 MStg_Dout<=MemSyst_Din;
-- PROCESS (mdelay,MemSyst_Din,MStg_Din,Mstg_Addr,Mstg_w,Mstg_r,Fetch_r,Fetch_addr)
-- BEGIN 
--	 if mdelay='1' then
--			 MStg_Dout<=ZEROS_32; 
--			 Fetch_Dout<=ZEROS_32;
--			 MemSyst_Dout<=ZEROS_32;MemSyst_Addr<=ZEROS_32;
--			
--			 mdelayF<='1';mdelayM<='1';
--			
--	 else
--		 mdelayF<='0';mdelayM<='0';
--		 MStg_Dout<=ZEROS_32; 
--		 Fetch_Dout<=ZEROS_32;
--		 MemSyst_Dout<=ZEROS_32;MemSyst_Addr<=ZEROS_32;
--		
--		 if Mstg_w='1' then
--			 MemSyst_Dout<=MStg_Din;			
--		 end if; 
--		 if Mstg_r='1' then
--		     if Fetch_r='1' then mdelayF<='1';
--			 end if;
--			 MemSyst_Addr<=Mstg_Addr;
--			 MStg_Dout<=MemSyst_Din;
--		 else
--			 if Fetch_r='1' then
--			
--			 MemSyst_Addr<=Fetch_addr;
--			 Fetch_Dout<=MemSyst_Din;
--			 end if;
--			
--		
--		 end if;
--		
--		
--	 end if;
--   w<=Mstg_w;
-- END PROCESS;
--		 else
--			 if Fetch_r='1' then
--			
--			 MemSyst_Addr<=Fetch_addr;
--			 Fetch_Dout<=MemSyst_Din;
--			 end if;
--			
--		
--		 end if;
--		
--		
--	 end if;
--   w<=Mstg_w;
-- END PROCESS;

END ARCHITECTURE behav;


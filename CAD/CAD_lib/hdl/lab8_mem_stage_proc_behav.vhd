--
-- VHDL Architecture CAD_lib.lab8_mem_stage_proc.behav
--
-- Created:
--          by - W.UNKNOWN (DESKTOP-86TQKQ1)
--          at - 01:11:15 04/ 4/2021
--
-- using Mentor Graphics HDL Designer(TM) 2018.2 (Build 19)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;
USE work.RV32I.ALL;
ENTITY lab8_mem_stage_proc IS
PORT(
	Data,Din,Address	:IN  std_ulogic_vector(31 DOWNTO 0);
	--Rd_in			: IN std_ulogic_vector(4 DOWNTO 0);
	FunC		: IN RV32I_Op;
	--clk 			: IN std_ulogic;
	--mDelay :IN std_ulogic;
	
	r,w,stall 			: OUT std_ulogic;
	Dout,Data_out_wback,Address_out_arb	:OUT  std_ulogic_vector(31 DOWNTO 0)
	--Rd_out : OUT std_ulogic_vector(4 DOWNTO 0)
	--data_size : OUT std_ulogic_vector(1 downto 0)

);

END ENTITY lab8_mem_stage_proc;

--
ARCHITECTURE behav OF lab8_mem_stage_proc IS
BEGIN
process(Data,Address,Din,FunC)
	begin
		CASE FunC IS
		
		WHEN  LB | LH | LW | LBU | LHU =>
			stall<='1';
			Address_out_arb <= Address;
			r<='1';
			w<='0';
			Dout <=ZEROS_32;
			--Rd_out<=Rd_in;
			if 		FunC = LW then Data_out_wback <= Din;
			elsif	FunC = LH then 
					Data_out_wback(15 downto 0)<=Din(15 downto 0); 
					Data_out_wback(31 downto 16) <= (others=>Din(15));   --XXX
			elsif FunC = LHU then
					Data_out_wback(15 downto 0)<=Din(15 downto 0); 
					Data_out_wback(31 downto 16) <= (others=>'0');   --XXX
			elsif FunC = LB then
					Data_out_wback (7 downto 0) <=Din(7 downto 0);  
					Data_out_wback (31 downto 8) <=(others=>Din(7));
					
			else  --LBU
					Data_out_wback (7 downto 0) <=Din(7 downto 0);  
					Data_out_wback (31 downto 8) <=(others=>'0');
			end if;
				
		WHEN  SB| SH | SW  =>
			stall<='1';
			Address_out_arb <= Address;
			r<='0';
			w<='1';
			--Rd_out<=Rd_in;
			Data_out_wback<=ZEROS_32;
			if 		FunC = SW then Dout <= Data;
			elsif	FunC = SH then
					Dout(15 downto 0)<=Data(15 downto 0); 
					Dout(31 downto 16) <= (others=>Data(15));   --XXX
			else -- SB
					Dout (7 downto 0) <=Data(7 downto 0);  
					Dout (31 downto 8) <=(others=>Data(7));
			end if;
		WHEN others =>
			stall<='0';
			Address_out_arb <= ZEROS_32;
			r<='0';
			w<='0';
			Dout <=ZEROS_32;
			--Rd_out<=Rd_in;
			Data_out_wback<=Data;
	END CASE;
	end process;
END ARCHITECTURE behav;


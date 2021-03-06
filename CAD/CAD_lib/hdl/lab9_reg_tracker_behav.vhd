--
-- VHDL Architecture CAD_lib.lab9_reg_tracker.behav
--
-- Created:
--          by - W.UNKNOWN (DESKTOP-86TQKQ1)
--          at - 02:02:18 04/10/2021
--
-- using Mentor Graphics HDL Designer(TM) 2018.2 (Build 19)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;
USE work.RV32I.ALL;

ENTITY lab9_reg_tracker IS
	PORT(
		--Data : std_ulogic_vector(31 downto 0);
		rst,jmp :IN std_ulogic; --updated
		read1,read2,write_from_dec,write_from_wback : IN std_ulogic_vector(4 DOWNTO 0);
		read1_valid,read2_valid,reserve,free,clk : IN  std_ulogic;
		stall : OUT std_ulogic;
		bypass:out std_ulogic_vector(1 downto 0)
		
	);
	
END ENTITY lab9_reg_tracker;
--rd rs1 rs2
--
ARCHITECTURE behav OF lab9_reg_tracker IS
	SIGNAL tracker :  std_ulogic_vector(31 DOWNTO 0) :=ZEROS_32;
	SIGNAL stall_sig: std_ulogic;
	
BEGIN
stall_proc : process(tracker,read1,read2,write_from_dec,read1_valid,read2_valid,write_from_wback)
variable tracker_var0: std_ulogic_vector(31 DOWNTO 0) :=ZEROS_32;
variable flag:std_ulogic;

begin
tracker_var0:=tracker;
bypass<="00";
if rst='1' then 
		stall<='0';
		stall_sig<='0';
		flag:='0';
		bypass<="00";
else

	


--reas & freed => "1" to regFile.
  --READA
	tracker_var0(0):='0';
    flag:='0';
	if (read1_valid='1' and tracker_var0(To_Integer(unsigned(read1))) = '1'  and jmp = '0') then
	stall<='1';
	stall_sig<='1';
	flag:='1';
	
  --READB
	elsif (  read2_valid='1' and tracker_var0(To_Integer(unsigned(read2))) = '1' and jmp = '0') then
	stall<='1';
	stall_sig<='1';
	flag:='1';
 --reserve
	elsif (tracker_var0(To_Integer(unsigned(write_from_dec)))='1' and jmp = '0' ) then
	stall<='1';
	stall_sig<='1';
	flag:='1';
  -- elsif (Data(0)='X' or Data(0)='U') then
	-- stall<='1';
	-- stall_sig<='1';

	else
		stall<='0';
		stall_sig<='0';
		flag:='0';

	end if;	
	-- read1_valid=1 and tracker_var0(To_Integer(unsigned(read1))) = '0'  then  falg=1   [Regfile: Q1<= WriteData ]
	-- read2_valid=1 and traker(read1)='0' then  falg=1   [Regfile: Q1<= WriteData ]
	
	-- if flag='0' then
		-- if read1_valid='1'  and read1=write_from_wback then  --  [Regfile: Q1<= WriteData ]
			-- bypass(0)<='1';
		-- end if;
		
		-- if read2_valid='1' and  read2=write_from_wback   then  --[Regfile: Q1<= WriteData ]
			-- bypass(1)<='1';
		-- end if;
	-- --
	-- end if;

end if;
	
end process;

tracker_proc: process(clk)
	variable tracker_var: std_ulogic_vector(31 DOWNTO 0) :=ZEROS_32;
begin
	if rst='1' then
		tracker_var:=ZEROS_32;
		
	else
		
		if rising_edge(clk) then
		tracker_var:=tracker;
			if free='1' then
				tracker_var(To_Integer(unsigned(write_from_wback))):='0';	
			end if;
			if reserve='1' and stall_sig='0' and jmp = '0' then		
				tracker_var(To_Integer(unsigned(write_from_dec))):='1';
			end if;	
		
		
		
		
		tracker<=tracker_var;	
		end if;

		
    end if;
 end process;
 


	
END ARCHITECTURE behav;


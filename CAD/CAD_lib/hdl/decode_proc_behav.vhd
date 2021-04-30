--
-- VHDL Architecture CAD_lib.decode_proc.behav
--
-- Created:
--          by - W.UNKNOWN (DESKTOP-86TQKQ1)
--          at - 21:13:42 03/21/2021
--
-- using Mentor Graphics HDL Designer(TM) 2018.2 (Build 19)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;
USE work.RV32I.ALL;

ENTITY decode_proc IS
PORT(
	FunC : IN RV32I_Op; -- Refer to package for enumeration type definition
	Immediate, Address : IN std_ulogic_vector(31 DOWNTO 0);
	DataA,DataB : IN std_ulogic_vector(31 DOWNTO 0);
	
	
	
	L,R,Extra:OUT std_ulogic_vector(31 DOWNTO 0)

);

END ENTITY decode_proc;

--
ARCHITECTURE behav OF decode_proc IS

BEGIN

--addr extra, L (DataA), R (DataB);
PROCESS(FunC, Immediate, Address,DataA,DataB)
--VARIABLE TEMP : UNSIGNED(31 DOWNTO 0);
BEGIN
	CASE FunC is
	WHEN LUI =>
		L <=ZEROS_32;
		R <= ZEROS_32;
		Extra <= Immediate;
		
	WHEN AUIPC =>
		L <=ZEROS_32;
		R <= ZEROS_32;
		Extra <= std_ulogic_vector(UNSIGNED(Immediate) + UNSIGNED(Address));
	
	WHEN JAL =>	
		L<=std_ulogic_vector( UNSIGNED(Immediate) +UNSIGNED(Address));  -- UNSIGNED(Immediate)
		R<=std_ulogic_vector( UNSIGNED(Address) +4); -- TO Rd.
		Extra<=ZEROS_32;
	
	WHEN JALR=>
		L<=std_ulogic_vector( UNSIGNED(Immediate) +UNSIGNED(DataA));
		L(0)<='0';
		R<=std_ulogic_vector( UNSIGNED(Address) +4); --to Rd.
		Extra<=ZEROS_32;
		
	
	WHEN BEQ|BNE|BLT |BGE |BLTU | BGEU =>
	--type branch
		L<=DataA;
		R<=DataB;
		Extra <= std_ulogic_vector(UNSIGNED(Address) + UNSIGNED(Immediate)); --maybe UNSIGNED??
	
	WHEN LB | LH | LW | LBU | LHU =>
	--type LOAD XXX
		L 	<= std_ulogic_vector(UNSIGNED(DataA) + UNSIGNED(Immediate));
		R 	<= ZEROS_32;
		Extra<= ZEROS_32;
		
	WHEN  SB| SH | SW  =>
	--type STORE XXX
		L <= std_ulogic_vector(UNSIGNED(DataA) + UNSIGNED(Immediate));
		R <= DataB;
		Extra <=ZEROS_32;
	
	WHEN  ADDI | SLTI | SLTIU | XORI |ORI | ANDI =>
	--type I
		L <= DataA;
		R <= Immediate;
		Extra <= ZEROS_32;
	
	
	
	
	-- type shamt
	WHEN SLLI | SRAI | SRLI =>
		L <=DataA; --rs1
		R(31 downto 5)<=(others=>'0');
		R(4 downto 0) <=Immediate(4 downto 0); 
		Extra <= ZEROS_32 ;
	--type R
	WHEN SLTr|SLTUr|XORr| ORr|ANDr| SLLr | SRAr| SRLr |SUBr |ADDr=>
		L <= DataA;
		R<=DataB;
		Extra <= ZEROS_32;
	

	WHEN OTHERS =>
	-- NOP and BAD;
		L <= ZEROS_32;
		R <= ZEROS_32;
		Extra<= ZEROS_32;
		
	END CASE;
END PROCESS;


END ARCHITECTURE behav;


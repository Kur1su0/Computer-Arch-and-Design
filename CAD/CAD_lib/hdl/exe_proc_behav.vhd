--
-- VHDL Architecture CAD_lib.exe_proc.behav
--
-- Created:
--          by - W.UNKNOWN (DESKTOP-86TQKQ1)
--          at - 16:47:30 03/28/2021
--
-- using Mentor Graphics HDL Designer(TM) 2018.2 (Build 19)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;
USE work.RV32I.ALL;

ENTITY exe_proc IS
  PORT(
    L,R,Extra : IN std_ulogic_vector(31 DOWNTO 0);
    FunC:  IN RV32I_Op;
    
    Address,Data,Jaddr : OUT std_ulogic_vector(31 DOWNTO 0);
    Jump,overflow :OUT std_ulogic
  );
END ENTITY exe_proc;

--
ARCHITECTURE behav OF exe_proc IS
signal bits_check :std_ulogic_vector(2 downto 0);
signal data_bit :std_ulogic;
BEGIN
  
	PROCESS (L,R,Extra,FunC)
	variable bits_check :std_ulogic_vector(2 downto 0);
	--variable data_bit :std_ulogic;
	variable data_var : std_ulogic_vector(31 downto 0);
	BEGIN
	
		CASE FunC IS
		  
			WHEN LUI|AUIPC =>
				Address	<=ZEROS_32;
				Jaddr	<=ZEROS_32;
				Jump 	<='0';
				Data	<=Extra;
				overflow<='0';
			--WHEN AUIPC =>
				
			WHEN JAL |JALR =>	
				Data	<=R;
				Jaddr	<=L;
				Jump	<='1';
				Address <= ZEROS_32;
				overflow<='0';
			--WHEN JALR=>

	
			--WHEN BEQ|BNE|BLT |BGE |BLTU | BGEU =>
			--type branch
			
			WHEN BEQ =>
			overflow<='0';
				Address	<= ZEROS_32; Data<= ZEROS_32; Jump<= '0';
				if L = R then Jaddr<= Extra; Jump<= '1';
				ELSE Jaddr<=ZEROS_32; end if;
				
			WHEN BNE =>
				overflow<='0';
				Address	<= ZEROS_32; Data<= ZEROS_32; Jump<= '0';
				-- IF L(0)='X' or L(0)='U' or R(0)='X' or R(0)='U' then Jaddr<= Extra;
				-- else
					if L /= R then Jaddr<= Extra;  Jump<= '1';
					ELSE Jaddr<=ZEROS_32; end if;
				
				-- end if;
			WHEN BLT =>
			overflow<='0';
				Address	<= ZEROS_32; Data<= ZEROS_32; Jump<= '0';
				IF SIGNED(L) < SIGNED(R) then Jaddr <= Extra;  Jump<= '1';
				ELSE Jaddr<=ZEROS_32; end if;
			WHEN BLTU =>
			overflow<='0';
				Address	<= ZEROS_32; Data<= ZEROS_32; Jump<= '0';
				IF UNSIGNED(L) < UNSIGNED(R) then Jaddr <= Extra;  Jump<= '1';
				ELSE Jaddr<=ZEROS_32; end if;
			WHEN BGE =>
			overflow<='0';
				Address	<= ZEROS_32; Data<= ZEROS_32; Jump<= '0';
				IF SIGNED(L) >= SIGNED(R) then Jaddr <= Extra;  Jump<= '1';
				ELSE Jaddr<=ZEROS_32; end if;
			WHEN BGEU =>
			overflow<='0';
				Address	<= ZEROS_32; Data<= ZEROS_32; Jump<= '0';
				IF UNSIGNED(L) >= UNSIGNED(R) then Jaddr <= Extra;  Jump<= '1';
				ELSE Jaddr<=ZEROS_32; end if;
				
				
			
			WHEN LB | LH | LW | LBU | LHU =>
			overflow<='0';
			--type LOAD XXX
				Address	<= L; Jaddr<= ZEROS_32; Jump<= '0';
				Data <= ZEROS_32;
				-- if 		FunC = LW then Data <= L;
				-- elsif	FunC = LH then 
					-- Data(15 downto 0)<=L(15 downto 0); 
					-- Data(31 downto 16) <= (others=>L(15));   --XXX
				-- elsif FunC = LHU then
				--	Data(15 downto 0)<=L(15 downto 0); 
				--	Data(31 downto 16) <= (others=>'0');   --XXX
				--elsif FunC = LB then
				--	Data (7 downto 0) <=L(7 downto 0);  
				--	Data (31 downto 8) <=(others=>L(7));
					
				--else  --LBU
				--	Data (7 downto 0) <=L(7 downto 0);  
				--	Data (31 downto 8) <=(others=>'0');
				--end if;
					
				

		
			WHEN  SB| SH | SW  =>
			--type STORE XXX
				overflow<='0';
				Address	<= L; Jaddr<= ZEROS_32; Jump<= '0';
				Data <= R;
				-- if 		FunC = SW then Data <= L;
				-- elsif	FunC = SH then
					-- Data(15 downto 0)<=L(15 downto 0); 
					-- Data(31 downto 16) <= (others=>L(15));   --XXX
				-- else -- SB
					-- Data (7 downto 0) <=L(7 downto 0);  
					-- Data (31 downto 8) <=(others=>L(7));
				-- end if;

	
			--WHEN  ADDI | SLTI | SLTIU | XORI |ORI | ANDI =>
			--type I
				--Address <= ZEROS_32; Jaddr<= ZEROS_32; Jump<= '0';
				
			-- WHEN ADDI =>
					-- overflow<='0';
					-- Address <= ZEROS_32; Jaddr<= ZEROS_32; Jump<= '0';
				    -- Data <= std_ulogic_vector(SIGNED(L) + SIGNED(R) );
				    -- if L(31)=R(31) then
						-- if  (L(31) xor  Data(31)) /= '0' then
							-- overflow <='1';
						-- else
							-- overflow<='0';
						-- end if;
					-- end if;
				    
			WHEN SLTI=>
					overflow<='0';
					Address <= ZEROS_32; Jaddr<= ZEROS_32; Jump<= '0';
					if SIGNED(L) < SIGNED(R) then
						Data <= ZEROS_32;
						Data(0) <='1';
					else
						Data <= ZEROS_32;
					end if;
			WHEN SLTIU=>
					overflow<='0';
					Address <= ZEROS_32; Jaddr<= ZEROS_32; Jump<= '0';
					if UNSIGNED(L) < UNSIGNED(R) then
						Data <= ONE_32;
					else
						Data <= ZEROS_32;
					end if;
					
			WHEN XORI =>
					overflow<='0';
					Address <= ZEROS_32; Jaddr<= ZEROS_32; Jump<= '0';
					Data <= L xor R;
			WHEN ORI =>
					overflow<='0';
					Address <= ZEROS_32; Jaddr<= ZEROS_32; Jump<= '0';
					Data <= L or R;
			WHEN ANDI =>
					overflow<='0';
					Address <= ZEROS_32; Jaddr<= ZEROS_32; Jump<= '0';
					Data <= L and R;
				

			-- type shamt
			--WHEN SLLI | SRAI | SRLI =>
			WHEN SLLI | SLLr=>
				overflow<='0';
				Address <= ZEROS_32; Jaddr<= ZEROS_32; Jump<= '0';
				Data <=std_ulogic_vector( shift_left(UNSIGNED(L),  to_integer(UNSIGNED(R))) );
			WHEN SRAI | SRAr=>
				overflow<='0';
				Address <= ZEROS_32; Jaddr<= ZEROS_32; Jump<= '0';
				Data <=std_ulogic_vector( shift_right(SIGNED(L),  to_integer(UNSIGNED(R))) );
			WHEN SRLI | SRLr =>
				overflow<='0';
			  Address <= ZEROS_32; Jaddr<= ZEROS_32; Jump<= '0';
				Data <=std_ulogic_vector( shift_right(UNSIGNED(L),  to_integer(UNSIGNED(R))) );
			
			
			
			--type R
			--SLTr|SLTUr|XORr| ORr|ANDr| SLLr | SRAr| SRLr |SUBr |ADDr
			--WHEN SLTr|SLTUr|XORr| ORr|ANDr| SUBr |ADDr=>
			--	Address <= ZEROS_32; Jaddr<= ZEROS_32; Jump<= '0';
			
			WHEN SLTr =>
						overflow<='0';
						Address <= ZEROS_32; Jaddr<= ZEROS_32; Jump<= '0';
						if SIGNED(L)<SIGNED(R) then Data<=ONE_32;
						else Data<=ZEROS_32;
						end if;
			WHEN SLTUr =>
						overflow<='0';
						Address <= ZEROS_32; Jaddr<= ZEROS_32; Jump<= '0';
						if UNSIGNED(L)<UNSIGNED(R) then Data<=ONE_32;
						else Data<=ZEROS_32;
						end if;
			WHEN XORr =>
						overflow<='0';
						Address <= ZEROS_32; Jaddr<= ZEROS_32; Jump<= '0';
						Data <= L xor R;
			WHEN ORr =>
						overflow<='0';
						Address <= ZEROS_32; Jaddr<= ZEROS_32; Jump<= '0';
						Data <= L or R;
			WHEN ANDr =>
						overflow<='0';
						Address <= ZEROS_32; Jaddr<= ZEROS_32; Jump<= '0';
						Data <= L and R;
					
			WHEN SUBr =>
						
						Address <= ZEROS_32; Jaddr<= ZEROS_32; Jump<= '0';
						Data <= std_ulogic_vector(SIGNED(L) - SIGNED(R) );
						data_var := std_ulogic_vector(SIGNED(L) - SIGNED(R) );
						bits_check:=L(31)&R(31)&data_var(31);
						case bits_check IS
							when "011" | "100" =>
								overflow <='1';
							when others =>
								overflow <='0';
						end case;
						
					--	if (L(31)='0') and (R(31)='1') then
--						  if Data(31) ='1' then overflow <='1';
--						  else overflow<='0';
--						  end if;    
--						else overflow<='0';
--						end if;
--						 
--						 
--						if (L(31)='1') and (R(31)='0') then
--						  if Data(31) ='0' then overflow <='1';
--						  else overflow<='0';
--						  end if;    
--						else overflow<='0';
--						end if; 
						
			WHEN ADDr|ADDI=>
						Address <= ZEROS_32; Jaddr<= ZEROS_32; Jump<= '0';
						Data <= std_ulogic_vector(UNSIGNED(L) + UNSIGNED(R) );
						
						data_var:=std_ulogic_vector(UNSIGNED(L) + UNSIGNED(R));

						
						bits_check :=L(31)&R(31)&data_var(31);
						case bits_check IS
							when "001" | "110" =>
								overflow <='1';
							when others =>
								overflow <='0';
						end case;
			
			WHEN OTHERS =>
				Address<=ZEROS_32;
				Data <=ZEROS_32;
				Jaddr <=ZEROS_32;
				Jump <='0';
				overflow<='0';
	
	
		END CASE;
	END PROCESS;
  
  
  
END ARCHITECTURE behav;


--
-- VHDL Architecture CAD_lib.lab3_fetch.behave
--
-- Created:
--          by - W.UNKNOWN (DESKTOP-86TQKQ1)
--          at - 22:56:02 02/22/2021
--
-- using Mentor Graphics HDL Designer(TM) 2018.2 (Build 19)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY lab3_fetch IS
GENERIC(width : NATURAL RANGE 1 TO 64 := 32);
Port(
     Jaddr, Mdata : IN std_ulogic_vector(31 downto 0);
     clk,Jmp,Reset,Delay: IN std_ulogic;
  
     Addr,Inst:OUT std_ulogic_vector(31 downto 0);
     Read : OUT std_ulogic
);
  
END ENTITY lab3_fetch;

--
ARCHITECTURE behave OF lab3_fetch IS
  --signal internal_pc : std_ulogic_vector(31 downto 0);
  
  
BEGIN
  --process(clk,Jaddr,Jmp,Reset,Delay)
counter: process(clk)
    VARIABLE get_sum : UNSIGNED(31 DOWNTO 0):=(others=>'0');
    begin
      
      if rising_edge(clk) then
        if Reset='1' then get_sum:= (others=>'0'); --internal_pc<=(others=>'0'); 
        elsif Jmp ='1' then   get_sum:=UNSIGNED(Jaddr);     --internal_pc<=Jaddr; 
        elsif (Delay='0') then
          --get_sum:= UNSIGNED(internal_pc) + 4; 
          get_sum:= get_sum + 4; 
          --internal_pc<= std_ulogic_vector(get_sum);
        end if;
        
          Addr <= std_ulogic_vector(get_sum); 
    
    end if;
  
  end process;

 --   if Reset='1' and Delay='0'  then 
--      --rst_counter<='1';
--      internal_pc<=(others=>'0');
--    elsif Jmp='1' and Delay='0' then
--      --jmp_counter<='1';
--      internal_pc<=Jaddr;
--    else
--      if Jmp='0' and Reset= '0' and rising_edge(clk) and (not(Delay)='1') then 
--        get_sum:= UNSIGNED(internal_pc) + 4; 
--        internal_pc<= std_ulogic_vector(get_sum);      
--      end if;
--   end if;
    
      

  
  process(Reset,Jmp)
  begin
    if(Reset='0' and Jmp='0') then Read<='1';
    else Read<='0';
    end if;
      
  end process;
  
  process(Jmp,Delay,Reset,Mdata)
  begin
    if Jmp='1' or Reset='1' or Delay='1' then 
      Inst(31 downto 5)<=(others=>'0');
      Inst(4 downto 0)<="10011";
    else Inst<=Mdata;
    end if;
  end process;
  
  -- process(Jmp,Delay,Reset,Mdata)
  -- begin
	-- if Reset='1' then
		-- Inst(31 downto 5)<=(others=>'0');
		-- Inst(4 downto 0)<="10011";
		-- Read <='0';
	-- elsif Reset='0' then
	
	
		-- if Jmp='1' then
			-- Read<='0';
			-- Inst(31 downto 5)<=(others=>'0');
			-- Inst(4 downto 0)<="10011";
		-- elsif Delay='0' then
			-- Read<='1';
			-- Inst<=Mdata;
		-- else
			-- Read<='1';
			-- Inst(31 downto 5)<=(others=>'0');
			-- Inst(4 downto 0)<="10011";
		-- end if;
	
	
	-- end if;
  
  
  --end process;


  


END ARCHITECTURE behave;


LIBRARY ieee;
library std;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;
USE std.textio.all;


ENTITY fetch_tb IS
END ENTITY fetch_tb;


ARCHITECTURE Testbench OF fetch_tb IS
  FILE test_vectors : text OPEN read_mode IS "vec.txt";	
 
	SIGNAL Jaddr : std_ulogic_vector(31 downto 0);
	SIGNAL Mdata : std_ulogic_vector(31 downto 0);
	SIGNAL clk   : std_ulogic;
	SIGNAL Jmp   : std_ulogic;
	SIGNAL Reset : std_ulogic;
	SIGNAL Delay : std_ulogic;
	SIGNAL Addr,Addrv  : std_ulogic_vector(31 downto 0);
	SIGNAL Inst,Instv  : std_ulogic_vector(31 downto 0);
	SIGNAL out_Read,Readv : std_ulogic;
	SIGNAL vecno : NATURAL := 0;

BEGIN 
  

  --test_fetch_tb : ENTITY work.lab3_fetch(behave)
  test_fetch_tb : ENTITY work.lab3_fetch_unit(struct)
	GENERIC MAP(width => 32)
	PORT MAP(Jaddr=>Jaddr, Mdata=>Jaddr,
			clk=>clk,Jmp=>Jmp,Reset=>Reset,Delay=>Delay,
			Addr=>Addr,Inst=>Inst,
			Read=>out_Read
	);
	

stim : process

    VARIABLE L : LINE;
    variable v_clk,v_Reset,v_Jmp,v_Delay,v_Read :std_ulogic;
    variable v_Inst, V_Mdata,V_Addr :std_ulogic_vector(31 downto 0);
begin 
    
    --clk<='1'; wait for 100ns;
    Jaddr<=32d"4";
    Mdata<=32d"4";
   -- Jaddr<=(others=>'0'); Jaddr(2)<='1';
--    Mdata<=(others=>'0'); Mdata(2)<='1'; 
    readline(test_vectors,L);
    
    WHILE NOT endfile(test_vectors) LOOP
      readline(test_vectors,L);
      --read(L,v_clk);    clk<=v_clk;
      read(L,v_Reset);  Reset<=v_Reset;
      read(L,v_Jmp);    Jmp<=v_Jmp;
      read(L,v_Delay);  Delay<=v_Delay;
      read(L,v_Read);  Readv<=v_Read;
      read(L,v_Inst);  Instv<=v_Inst;

      clk<='0';
      wait for 100ns;
      read(L,v_Addr);  Addrv<=v_Addr;
      
      clk<='1';
      wait for 100ns;
      
      
    END LOOP;
    report "END of TB";
    wait;
      

 
end process;

Check : PROCESS(clk)
variable flag : natural:=0;
BEGIN
    
    IF (rising_edge(clk)) THEN
      vecno <= vecno + 1;
       ASSERT out_Read = Readv
            REPORT "ERROR: read " & to_string(vecno)
            SEVERITY WARNING;
            
            
        ASSERT Inst = Instv
            REPORT "ERROR: Inst " & to_string(vecno)
            SEVERITY WARNING;
        
          
    ELSE
    
         ASSERT Addr = Addrv
            REPORT "ERROR: addr "& to_string(vecno)
            SEVERITY WARNING; 
                   
   END IF;
   
    

    
    

END PROCESS;
end ARCHITECTURE Testbench;




--process
--begin
--   Jaddr<=(others=>'0'); Jaddr(2)<='1';
--  Mdata<=(others=>'0'); Mdata(2)<='1';
--  
--  -- test reset
--  Reset<='0';Jmp <='0';Delay<='0';
--  clk<='1'; wait for 100ns; 
--  clk<='0'; wait for 100ns;
--  
--  Reset<='1';  Delay<='1';
--  clk<='1';wait for 100ns;
--  clk<='0'; wait for 100ns;
-- 
--  Reset<='1';  Delay<='0';
--  clk<='1';wait for 100ns;
--  clk<='0'; wait for 100ns;
--  
--  Reset<='0';  Delay<='0';
--  clk<='1';wait for 100ns;
--  clk<='0'; wait for 100ns;
--  
--   clk<='1';wait for 100ns;
--  clk<='0'; wait for 100ns;
--  
--   clk<='1';wait for 100ns;
--  clk<='0'; wait for 100ns; 
--   -- test jmp
--  Reset<='0'; 
--  
-- --7
--  Jmp<='1';Delay<='1';
--  clk<='1';wait for 100ns;
--  clk<='0'; wait for 100ns;
--  
--  
--  Jmp<='1';Delay<='0';
--  clk<='1';wait for 100ns;
--  clk<='0'; wait for 100ns;
--  --9
--  Jmp<='0';
--  clk<='1';wait for 100ns;
--  clk<='0'; wait for 100ns;
--  
--  --test Delay
--  --10
--  clk<='1';wait for 100ns;
--  Delay<='1';
--  clk<='0'; wait for 100ns;
--  
--  --11
-- 
--  clk<='1';wait for 100ns;
--  clk<='0'; wait for 100ns;
--  
--  --12
--  clk<='1'; wait for 100ns;
--  Delay<='0';
--  clk<='0';wait for 100ns;
--  
--  
--  
--  --13
--  
--  Jmp<='1'; 
--  clk<='1';wait for 100ns;
--  
--  clk<='0'; wait for 100ns;
--  --14
--  --test risingk
--  
--  clk<='1';wait for 100ns;
--  Jmp<='0';
--  clk<='0'; wait for 100ns;
--  --15
--  clk<='1'; wait for 100ns;
--  Jmp<='1';
--  clk<='0';wait for 100ns;
--
--wait;
  
  
--end process;
--end ARCHITECTURE Testbench;
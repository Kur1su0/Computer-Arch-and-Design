



--
ARCHITECTURE behave OF lab3_mem_system IS
BEGIN
  PROCESS(clk,Addr,Read)
  BEGIN
    if falling_edge(clk) then Delay<='1';
    else
      Delay <= '0';
      if Read='1' then 
        Mdata <= Addr;
        Delay <= '0';
      else 
        Delay <='1';
       
    
      end if;
    
    end if;
  END PROCESS;
  
  
END ARCHITECTURE behave;


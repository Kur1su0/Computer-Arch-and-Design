LIBRARY ieee  ; 
LIBRARY std  ; 
USE ieee.std_logic_1164.all  ; 
USE ieee.std_logic_arith.all  ; 
USE ieee.std_logic_textio.all  ; 
USE ieee.std_logic_unsigned.all  ; 
USE std.textio.all  ; 
ENTITY \Increment.vht\  IS 
  GENERIC (
    width  : INTEGER   := 8 ); 
END ; 
 
ARCHITECTURE \Increment.vht_arch\   OF \Increment.vht\   IS
  SIGNAL D   :  STD_ULOGIC_VECTOR (width - 1 downto 0)  ; 
  SIGNAL Q   :  STD_ULOGIC_VECTOR (width - 1 downto 0)  ; 
  SIGNAL Inc   :  STD_ULOGIC_VECTOR (1 downto 0)  ; 
  COMPONENT Increment  
    GENERIC ( 
      width  : INTEGER  );  
    PORT ( 
      D  : in STD_ULOGIC_VECTOR (width - 1 downto 0) ; 
      Q  : out STD_ULOGIC_VECTOR (width - 1 downto 0) ; 
      Inc  : in STD_ULOGIC_VECTOR (1 downto 0) ); 
  END COMPONENT ; 
BEGIN
  DUT  : Increment  
    GENERIC MAP ( 
      width  => width   )
    PORT MAP ( 
      D   => D  ,
      Q   => Q  ,
      Inc   => Inc   ) ; 



-- "Constant Pattern"
-- Start Time = 0 ns, End Time = 500 ns, Period = 0 ns
  Process
	Begin
	 D  <= "00000001"  ;
	wait for 500 ns ;
-- dumped values till 500 ns
	wait;
 End Process;


-- "Repeater Pattern" Repeat 2 times
-- Start Time = 0 ns, End Time = 500 ns, Period = 100 ns
  Process
	Begin
	    Inc  <= "00"  ;
	   wait for 100 ns ;
	    Inc  <= "01"  ;
	   wait for 100 ns ;
	    Inc  <= "10"  ;
	   wait for 100 ns ;
	    Inc  <= "11"  ;
	   wait for 100 ns ;
-- 400 ns, repeat pattern in loop.
	 Inc  <= "00"  ;
	wait for 100 ns ;
-- dumped values till 500 ns
	wait;
 End Process;
END;

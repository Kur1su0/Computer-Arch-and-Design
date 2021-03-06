LIBRARY ieee  ; 
LIBRARY std  ; 
USE ieee.std_logic_1164.all  ; 
USE ieee.std_logic_arith.all  ; 
USE ieee.std_logic_textio.all  ; 
USE ieee.std_logic_unsigned.all  ; 
USE std.textio.all  ; 
ENTITY \mux_4_to_1_tst.vht\  IS 
  GENERIC (
    width  : INTEGER   := 8 ); 
END ; 
 
ARCHITECTURE \mux_4_to_1_tst.vht_arch\   OF \mux_4_to_1_tst.vht\   IS
  SIGNAL Sel   :  STD_ULOGIC_VECTOR (1 downto 0)  ; 
  SIGNAL Data_In_1   :  STD_ULOGIC_VECTOR (width - 1 downto 0)  ; 
  SIGNAL Q   :  STD_ULOGIC_VECTOR (width - 1 downto 0)  ; 
  SIGNAL Data_In_2   :  STD_ULOGIC_VECTOR (width - 1 downto 0)  ; 
  SIGNAL Data_In_3   :  STD_ULOGIC_VECTOR (width - 1 downto 0)  ; 
  SIGNAL Data_In_0   :  STD_ULOGIC_VECTOR (width - 1 downto 0)  ; 
  COMPONENT mux_4_to_1  
    GENERIC ( 
      width  : INTEGER  );  
    PORT ( 
      Sel  : in STD_ULOGIC_VECTOR (1 downto 0) ; 
      Data_In_1  : in STD_ULOGIC_VECTOR (width - 1 downto 0) ; 
      Q  : out STD_ULOGIC_VECTOR (width - 1 downto 0) ; 
      Data_In_2  : in STD_ULOGIC_VECTOR (width - 1 downto 0) ; 
      Data_In_3  : in STD_ULOGIC_VECTOR (width - 1 downto 0) ; 
      Data_In_0  : in STD_ULOGIC_VECTOR (width - 1 downto 0) ); 
  END COMPONENT ; 
BEGIN
  DUT  : mux_4_to_1  
    GENERIC MAP ( 
      width  => width   )
    PORT MAP ( 
      Sel   => Sel  ,
      Data_In_1   => Data_In_1  ,
      Q   => Q  ,
      Data_In_2   => Data_In_2  ,
      Data_In_3   => Data_In_3  ,
      Data_In_0   => Data_In_0   ) ; 

init : PROCESS                                               
-- variable declarations                                     
BEGIN                                                        
        -- code that executes only once                      
WAIT;                                                       
END PROCESS init; 



-- "Constant Pattern"
-- Start Time = 0 ns, End Time = 100 ns, Period = 0 ns
 always: Process
	Begin
	 Sel(0)  <= '0'  ;
	  Sel(1)  <= '1'  ;
	 
	 Data_In_0 <="10000000";
	 Data_In_1 <="01000000";
	 Data_In_2 <="00100000";
	 Data_In_3 <="00010000";
	 
	wait for 100 ns ;
	
	Sel  <= "01"  ;
	wait for 100 ns ;
	
	Sel  <= "10"  ;
	wait for 100 ns ;
	
	Sel  <= "11"  ;
	wait for 100 ns ;
	



 End Process always;
END;

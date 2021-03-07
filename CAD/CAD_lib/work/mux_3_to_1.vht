LIBRARY ieee  ; 
LIBRARY std  ; 
USE ieee.std_logic_1164.all  ; 
USE ieee.std_logic_arith.all  ; 
USE ieee.std_logic_textio.all  ; 
USE ieee.std_logic_unsigned.all  ; 
USE std.textio.all  ; 
ENTITY \mux_3_to_1.vht\  IS 
  GENERIC (
    width  : INTEGER   := 8 ); 
END ; 
 
ARCHITECTURE \mux_3_to_1.vht_arch\   OF \mux_3_to_1.vht\   IS
  SIGNAL Sel   :  STD_ULOGIC_VECTOR (1 downto 0)  ; 
  SIGNAL Data_In_1   :  STD_ULOGIC_VECTOR (width - 1 downto 0)  ; 
  SIGNAL Q   :  STD_ULOGIC_VECTOR (width - 1 downto 0)  ; 
  SIGNAL Data_In_2   :  STD_ULOGIC_VECTOR (width - 1 downto 0)  ; 
  SIGNAL Data_In_0   :  STD_ULOGIC_VECTOR (width - 1 downto 0)  ; 
  COMPONENT mux_3_to_1  
    GENERIC ( 
      width  : INTEGER  );  
    PORT ( 
      Sel  : in STD_ULOGIC_VECTOR (1 downto 0) ; 
      Data_In_1  : in STD_ULOGIC_VECTOR (width - 1 downto 0) ; 
      Q  : out STD_ULOGIC_VECTOR (width - 1 downto 0) ; 
      Data_In_2  : in STD_ULOGIC_VECTOR (width - 1 downto 0) ; 
      Data_In_0  : in STD_ULOGIC_VECTOR (width - 1 downto 0) ); 
  END COMPONENT ; 
BEGIN
  DUT  : mux_3_to_1  
    GENERIC MAP ( 
      width  => width   )
    PORT MAP ( 
      Sel   => Sel  ,
      Data_In_1   => Data_In_1  ,
      Q   => Q  ,
      Data_In_2   => Data_In_2  ,
      Data_In_0   => Data_In_0   ) ; 



-- "Constant Pattern"
-- Start Time = 0 ns, End Time = 1 us, Period = 0 ns
  Process
	Begin
	 Data_In_0  <= "10001111"  ;
	wait for 1 us ;
-- dumped values till 1 us
	wait;
 End Process;
END;

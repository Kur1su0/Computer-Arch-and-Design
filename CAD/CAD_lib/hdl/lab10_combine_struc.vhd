--
-- VHDL Architecture CAD_lib.lab10_combine.struc
--
-- Created:
--          by - W.UNKNOWN (DESKTOP-86TQKQ1)
--          at - 17:08:51 04/20/2021
--
-- using Mentor Graphics HDL Designer(TM) 2018.2 (Build 19)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;
USE work.RV32I.all;


ENTITY lab10_combine IS
PORT(
  rst,clk :IN std_ulogic
  
);
    
END ENTITY lab10_combine;

--
ARCHITECTURE struc OF lab10_combine IS
  signal wire_delay :  std_ulogic;
  signal wire_dataout: std_ulogic_vector(31 DOWNTO 0);
  
  signal wire_MemSyst_Dout, wire_MemSyst_Addr  : std_ulogic_vector(31 DOWNTO 0);
  signal wire_MemSyst_read, wire_MemSyst_we: std_ulogic;
  
BEGIN
  processor : ENTITY work.lab10_whole_syst(struct)
  port map(
        rst=>rst,
        mdelay=> wire_delay,
        DataOut=> wire_dataout,
        clk=>clk,
        MemSyst_Dout=>wire_MemSyst_Dout,MemSyst_Addr=>wire_MemSyst_Addr,
        MemSyst_read=>wire_MemSyst_read, MemSyst_we=>wire_MemSyst_we
        
  );
  
  mem_syst: ENTITY work.MemorySystem(Behavior)
  PORT MAP(
        Addr=>wire_MemSyst_Addr, DataIn=>wire_MemSyst_Dout,
        clock=>clk, we=>wire_MemSyst_we, re=>wire_MemSyst_read,
        mdelay=>wire_delay,
        DataOut=>wire_dataout
    
  );
END ARCHITECTURE struc;


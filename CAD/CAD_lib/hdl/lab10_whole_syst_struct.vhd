--
-- VHDL Architecture CAD_lib.lab10_whole_syst.struct
--
-- Created:
--          by - W.UNKNOWN (DESKTOP-86TQKQ1)
--          at - 00:31:40 04/20/2021
--
-- using Mentor Graphics HDL Designer(TM) 2018.2 (Build 19)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;
USE work.RV32I.all;
ENTITY lab10_whole_syst IS
  port(
		rst :IN std_logic;
        mdelay : IN std_ulogic;
        DataOut : IN std_ulogic_vector(31 DOWNTO 0);
        clk :IN std_ulogic;
        MemSyst_Dout,MemSyst_Addr  :OUT std_ulogic_vector(31 DOWNTO 0);
        MemSyst_read, MemSyst_we:OUT std_ulogic
  );
END ENTITY lab10_whole_syst;

--
ARCHITECTURE struct OF lab10_whole_syst IS
  --arb
  --signal wire_MemSyst_DataOut : std_ulogic_vector(31 DOWNTO 0);
  signal wire_MStg_Din_to_arb,wire_MStg_Addr_to_arb : std_ulogic_vector(31 DOWNTO 0);
  --signal wire_Fetch_addr_to_arb : std_ulogic_vector(31 DOWNTO 0);
  signal wire_Mstg_w, wire_Mstg_r, wire_delayF,wire_delayM : std_ulogic;
  signal wire_arb_out_to_Mstg,wire_arb_out_to_MemSyst, wire_arb_out_to_fetch, wire_arb_addr_to_MemSyst : std_ulogic_vector(31 DOWNTO 0);
  --fetch
  signal wire_Jaddr : std_ulogic_vector(31 DOWNTO 0);
  signal wire_jmp,wire_fetch_read_MemSyst :std_ulogic;
  signal wire_stall:std_ulogic;
  signal wire_fetch_addr_to_Dec,wire_fetch_inst_to_Dec: std_ulogic_vector(31 DOWNTO 0);
  --dec
  signal wire_DataA,wire_DataB, wire_L,wire_R,wire_Extra : std_ulogic_vector(31 DOWNTO 0);
  signal wire_FunCode : RV32I_Op;
  signal wire_Rs1,wire_Rs2,wire_Rd   : std_ulogic_vector(4 DOWNTO 0);
  signal wire_Rs1v,wire_Rs2v,wire_Rdv : std_ulogic;
  --exe
  signal wire_EXE_FunOut : RV32I_Op;
  signal wire_EXE_rdout : std_ulogic_vector(4 DOWNTO 0);
  signal wire_EXE_Address,wire_EXE_Data : std_ulogic_vector(31 DOWNTO 0); --,wire_EXE_Jaddr
  signal wire_overf_junk: std_ulogic;
  -- mem stage
  signal wire_Mstg_Data_to_wback 		: std_ulogic_vector(31 DOWNTO 0);
  signal wire_Mstg_rd_to_wback 			: std_ulogic_vector(4 DOWNTO 0);
  signal wire_Mstg_funC_to_wback  		: RV32I_Op;
  --wback
  signal wire_wback_w_to_tracker  		:  std_ulogic;
  signal wire_wback_Dout_to_reg_file	:std_ulogic_vector(31 DOWNTO 0);	
  signal wire_wback_Rdout_to_tracker	: std_ulogic_vector(4 DOWNTO 0);
  --tracker
  signal wire_tracker_stall_to_Dec : std_ulogic;
  signal wire_bypass :std_ulogic_vector(1 DOWNTO 0);	
  --signal wire_Q1,wire_Q2 :std_logic_vector(31 DOWNTO 0);
BEGIN
	
    arb : ENTITY work.lab8_arbiter(behav)
      
    PORT MAP(
	     mdelay=>mdelay,
       MemSyst_Din=>DataOut,
       MStg_Din=>wire_MStg_Din_to_arb,
       Mstg_Addr =>wire_MStg_Addr_to_arb,
       Fetch_addr =>wire_fetch_addr_to_Dec,
	     Mstg_w=>wire_Mstg_w,
	     Mstg_r=>wire_Mstg_r,
	     Fetch_r =>wire_fetch_read_MemSyst,--wire_Fetch_r,							
	     MStg_Dout => wire_arb_out_to_Mstg,
	     MemSyst_Dout =>MemSyst_Dout,
	     Fetch_Dout =>wire_arb_out_to_fetch,
	     MemSyst_Addr=>MemSyst_Addr, 	
	     mdelayF =>wire_delayF,
	     mdelayM =>wire_delayM,
	     r=>MemSyst_read,
	     w=>MemSyst_we
	);
	-- MemSyst_Dout<=wire_arb_out_to_MemSyst;
	-- MemSyst_Addr<=wire_arb_addr_to_MemSyst;
	fetch:ENTITY work.lab3_fetch(behave)
	--fetch:ENTITY work.lab3_fetch_unit(struct)
	PORT MAP(
	   Jaddr=>wire_Jaddr,
	   Mdata =>wire_arb_out_to_fetch,
     clk=>clk,
     Jmp=>wire_jmp,
     Reset=>rst,
     Delay=>(wire_delayF or wire_stall or wire_tracker_stall_to_Dec),
  
     Addr=>wire_fetch_addr_to_Dec,
     Inst=>wire_fetch_inst_to_Dec,
     Read =>wire_fetch_read_MemSyst
	  );
	  
	  
  dec: ENTITY work.lab6_decode_pipeline(struc)
  PORT MAP(
    Inst=>wire_fetch_inst_to_Dec, Address=>wire_fetch_addr_to_Dec,
    DataA=>wire_DataA,DataB=>wire_DataB,
    clk => clk,
    L=>wire_L,R=>wire_R,Extra=>wire_Extra,
    Rs1=>wire_Rs1,Rs2=>wire_Rs2,Rd=>wire_Rd,
    Rs1v=>wire_Rs1v,Rs2v=>wire_Rs2v,Rdv=>wire_Rdv ,
    FunCode =>wire_FunCode,
    delay=>(wire_stall or wire_tracker_stall_to_Dec ),
	rst=>rst,
	jmp => wire_jmp
  );
  exe :ENTITY work.lab7_exe(struc)
  PORT MAP (
   clk=>clk,
   Left=>wire_L,Right=>wire_R,Extra=>wire_Extra,
   Rd_in=>wire_Rd,
   FunC_in=>wire_FunCode,
   Func_out=>wire_EXE_FunOut,
   Rd_out=>wire_EXE_rdout,
   Address=>wire_EXE_Address,Data=>wire_EXE_Data,Jaddr=>wire_Jaddr,
   Jump=>wire_jmp,overflow=>wire_overf_junk,
   delay=>wire_stall ,
   rst=>rst
  );
  
  mem_stage: ENTITY work.lab8_mem_stage_struc(struc)
  PORT MAP(
	Data=>wire_EXE_Data,
	Din=>wire_arb_out_to_Mstg,
	Address=>wire_EXE_Address,
	Rd_in=>wire_EXE_rdout,
	FunC_in=>wire_EXE_FunOut,
	mDelay=>wire_delayM,
	clk=>clk,

	r=>wire_Mstg_r,w=>wire_Mstg_w,
	stall=>wire_stall,
	Dout=>wire_MStg_Din_to_arb,
	Data_out_wback=>wire_Mstg_Data_to_wback,
	Address_out_arb=>wire_MStg_Addr_to_arb,
	Rd_out=>wire_Mstg_rd_to_wback,
	FunC_out=>wire_Mstg_funC_to_wback,
	rst=>rst
  );

  write_back : ENTITY work.lab8_writeback(mixed)
  PORT MAP(
	Data=>wire_Mstg_Data_to_wback,
	Rd_in=>wire_Mstg_rd_to_wback,
	FunC=>wire_Mstg_funC_to_wback,
	clk=>clk,
	Rd_out=>wire_wback_Rdout_to_tracker,
	Data_out=>wire_wback_Dout_to_reg_file,
	w =>wire_wback_w_to_tracker,
	rst=>rst
	
  );
  reg_tracker: ENTITY work.lab9_reg_tracker(behav)
  PORT MAP(
    --Data=>wire_Mstg_Data_to_wback,
		rst=>rst,
		jmp=>wire_jmp,
		read1=>wire_Rs1,read2=>wire_Rs2,write_from_dec=>wire_Rd,write_from_wback=>wire_wback_Rdout_to_tracker,
		read1_valid=>wire_Rs1v,read2_valid=>wire_Rs2v,reserve=>wire_Rdv,free=>wire_wback_w_to_tracker,
		clk=>clk,
		stall=>wire_tracker_stall_to_Dec,
		bypass=>wire_bypass
  
  );
  
  reg_file : ENTITY work.lab9_regFile(struc)
  GENERIC MAP(
	RegWidth=>32,
	RegSel=>5
	)
	
	
  PORT MAP(
  bypass=>wire_bypass,
	D=>wire_wback_Dout_to_reg_file,
	--D=>wire_wback_Dout_to_reg_file,
    Q1=>wire_DataA,Q2=>wire_DataB,
    --Q1=>wire_Q1,Q2=>wire_Q2,
    ReadSel_1=>wire_Rs1,ReadSel_2=>wire_Rs2, WriteSel=>wire_wback_Rdout_to_tracker,
    Clock=>clk, Load=>wire_wback_w_to_tracker
  );
  -- wire_DataA <=std_ulogic_vector( UNSIGNED(wire_Q1));
  -- wire_DataB<=std_ulogic_vector( UNSIGNED(wire_Q2));
 
 
  
END ARCHITECTURE struct;


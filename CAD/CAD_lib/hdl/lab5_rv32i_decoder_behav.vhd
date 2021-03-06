--
-- VHDL Architecture CAD_lib.lab5_rv32i_decoder.behav
--
-- Created:
--          by - W.UNKNOWN (DESKTOP-86TQKQ1)
--          at - 17:56:49 03/ 6/2021
--
-- using Mentor Graphics HDL Designer(TM) 2018.2 (Build 19)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;
USE work.RV32I.ALL;



ENTITY lab5_rv32i_decoder IS
  PORT( instruction : IN std_ulogic_vector(31 DOWNTO 0);
    Function_op : OUT RV32I_Op; -- Refer to package for enumeration type definition
    RS1, RS2, RD : OUT std_ulogic_vector(4 DOWNTO 0); -- Register IDs
    RS1v, RS2v, RDv : OUT std_ulogic; -- Valid indicators for Register IDs
    Immediate : OUT std_ulogic_vector(31 DOWNTO 0)); -- Immediate value
    
    
    
    
  END ENTITY lab5_rv32i_decoder;
  
  --
  ARCHITECTURE behav OF lab5_rv32i_decoder IS
    --SIGNAL which_type : InsType;
    
    BEGIN
      process(instruction)
      VARIABLE OpCode  : std_ulogic_vector(4 DOWNTO 0);
      VARIABLE FN3     : std_ulogic_vector(2 DOWNTO 0);
      VARIABLE FN7     : std_ulogic_vector(6 DOWNTO 0);
      VARIABLE RS2_val : std_ulogic_vector(4 DOWNTO 0);
      VARIABLE RS1_val : std_ulogic_vector(4 DOWNTO 0);
      VARIABLE RD_val  :std_ulogic_vector(4 DOWNTO 0);
      
      
      
      begin
        OpCode  := instruction(6 DOWNTO 2);
        FN3     :=instruction(14 DOWNTO 12);
        FN7     :=instruction(31 DOWNTO 25);
        RS2_val :=instruction(24 DOWNTO 20);
        RS1_val :=instruction(19 DOWNTO 15);
        RD_val  :=instruction(11 DOWNTO 7);
        
        if not(instruction(1 downto 0)="11") then
          Immediate<=ZEROS_32;
          Function_op<=BAD;
        RD<=(others=>'0');RS1<=(others=>'0'); RS2<=(others=>'0');
        RDv<='0'; RS1v<='0'; RS2v<='0';
      else
        
        
        CASE OpCode IS
          --WHEN "10010" => Function_op<=NOP;
        WHEN RV32I_OP_LUI | RV32I_OP_AUIPC =>
          --which_type<=U;
          RD<=RD_val;
          Immediate(31 downto 12)<=instruction(31 DOWNTO 12);
          Immediate(11 downto 0) <= (others=>'0');
          RD<=RD_val;RS1<=(others=>'0'); RS2<=(others=>'0');
          RDv<='1'; RS1v<='0'; RS2v<='0';
          if(OpCode=RV32I_OP_LUI) then Function_op<=LUI; else Function_op<=AUIPC;
          end if;
          
          
        WHEN RV32I_OP_JAL =>
          --which_type<=UJ;
          Immediate(31 downto 20)<=(others=>instruction(31));
          Immediate(19 downto 0)<=instruction(19 downto 12) & instruction(20) &instruction(30 downto 25)& instruction(24 downto 21) &'0';
          RDv<='1'; RS1v<='0'; RS2v<='0';
          RD<=RD_val;RS1<=(others=>'0'); RS2<=(others=>'0');
          Function_op<=JAL;
          
          
        WHEN RV32I_OP_JALR =>
          --which_type<=I;
          RDv<='1'; RS1v<='1'; RS2v<='0';
          RD<=RD_val;RS1<=RS1_val; RS2<=(others=>'0');
          Immediate(31 downto 11)<=(others=>instruction(31));
          Immediate(10 downto 0)<=instruction(30 downto 25) & instruction(24 downto 21) & instruction(20);
          Function_op<=JALR;
          
          
        WHEN RV32I_OP_BRANCH =>
          --which_type<=SB;
          RDv<='0'; RS1v<='1'; RS2v<='1';
          RD<=(others=>'0');RS1<=RS1_val; RS2<=RS2_val;
          Immediate(31 downto 12)<=(others=>instruction(31));
          Immediate(11 downto 0)<=instruction(7)&instruction(30 downto 25)&instruction(11 downto 8)&'0';
          CASE FN3 IS
          WHEN RV32I_FN3_BRANCH_EQ => Function_op <=BEQ;
          WHEN RV32I_FN3_BRANCH_NE =>	Function_op <=BNE;
          WHEN RV32I_FN3_BRANCH_LT => Function_op <=BLT;
          WHEN RV32I_FN3_BRANCH_GE => Function_op <=BGE;
          WHEN RV32I_FN3_BRANCH_LTU =>Function_op <=BLTU;
          WHEN RV32I_FN3_BRANCH_GEU =>Function_op <=BGEU;
          WHEN OTHERS => Function_op<=BAD;  RD<=(others=>'0');RS1<=(others=>'0'); RS2<=(others=>'0'); RDv<='0'; RS1v<='0'; RS2v<='0';
          END CASE;
          
          
          --statements;
        WHEN RV32I_OP_LOAD =>
          --which_type<=I;
          RDv<='1'; RS1v<='1'; RS2v<='0';
          RD<=RD_val;RS1<=RS1_val; RS2<=(others=>'0');
          Immediate(31 downto 11)<=(others=>instruction(31));
          Immediate(10 downto 0)<=instruction(30 downto 25) & instruction(24 downto 21) & instruction(20);
          CASE FN3 IS
          when RV32I_FN3_LOAD_B =>Function_op <=LB;
          when RV32I_FN3_LOAD_H =>Function_op <=LH;
          when RV32I_FN3_LOAD_W =>Function_op <=LW;
          when RV32I_FN3_LOAD_BU =>Function_op <=LBU;
          when RV32I_FN3_LOAD_HU =>Function_op <=LHU;
          WHEN OTHERS => Function_op<=BAD;  RD<=(others=>'0');RS1<=(others=>'0'); RS2<=(others=>'0'); RDv<='0'; RS1v<='0'; RS2v<='0';
          END CASE;
          
          
          
        WHEN RV32I_OP_STORE =>
          -- which_type<=S;
          RDv<='0'; RS1v<='1'; RS2v<='1';
          RD<=(others=>'0');RS1<=RS1_val; RS2<=RS2_val;
          Immediate(31 downto 11)<=(others=>instruction(31));
          Immediate(10 downto 0)<=instruction(30 downto 25) & instruction(11 downto 8)&instruction(7);
          CASE FN3 IS
          when RV32I_FN3_STORE_B => Function_op <= SB;
          when RV32I_FN3_STORE_H => Function_op <= SH;
          when RV32I_FN3_STORE_W => Function_op <= SW;
          WHEN OTHERS => Function_op<=BAD;  RD<=(others=>'0');RS1<=(others=>'0'); RS2<=(others=>'0'); RDv<='0'; RS1v<='0'; RS2v<='0';
          END CASE;
          
          
          
          
          
        WHEN RV32I_OP_ALUI =>
          if instruction=NOP_inst then
            RDv<='0'; RS1v<='0';RS2v<='0';
            RD<=(others=>'0');RS1<=(others=>'0'); RS2<=(others=>'0');
            Function_op <=NOP;
            Immediate<=ZEROS_32;
          else
            --shamt;
            RDv<='1'; RS1v<='1';RS2v<='0';
            RD<=RD_val;RS1<=RS1_val; RS2<=(others=>'0');
            --Immediate(31 downto 5)<=(others=>'0'); Immediate(4 downto 0)<=instruction(24 downto 20);
            Immediate(31 downto 11)<=(others=>instruction(31));
            Immediate(10 downto 0)<=instruction(30 downto 25) & instruction(24 downto 21) & instruction(20);
            
            
            CASE FN3 IS
            when RV32I_FN3_ALU_ADD => Function_op <=ADDI;                 
            when RV32I_FN3_ALU_SLT => Function_op <=SLTI;
            when RV32I_FN3_ALU_SLTU => Function_op <=SLTIU;
            when RV32I_FN3_ALU_XOR => Function_op <=XORI;
            when RV32I_FN3_ALU_OR => Function_op <=ORI;
            when RV32I_FN3_ALU_AND => Function_op <=ANDI;
            when RV32I_FN3_ALU_SLL =>
              if FN7="0000000" then 
                Function_op <=SLLI; 
                Immediate(31 downto 5)<=(others=>'0'); Immediate(4 downto 0)<=instruction(24 downto 20);
              else
                Function_op <=BAD;  RD<=(others=>'0');RS1<=(others=>'0'); RS2<=(others=>'0'); RDv<='0'; RS1v<='0'; RS2v<='0';
                Immediate<=ZEROS_32;
              end if;
            when RV32I_FN3_ALU_SRL =>
              Immediate(31 downto 5)<=(others=>'0'); Immediate(4 downto 0)<=instruction(24 downto 20);
              if FN7= RV32I_FN7_ALU_SA then 
                Function_op <=SRAI; 
              elsif FN7 =  "0000000" then
                Function_op <=SRLI;
              else
                Function_op<=BAD;  RD<=(others=>'0');RS1<=(others=>'0'); RS2<=(others=>'0'); RDv<='0'; RS1v<='0'; RS2v<='0';
                Immediate<=ZEROS_32;
              end if;
            WHEN OTHERS => Function_op<=BAD;  RD<=(others=>'0');RS1<=(others=>'0'); RS2<=(others=>'0'); RDv<='0'; RS1v<='0'; RS2v<='0';
              
              
              
            END CASE;
            
          end if;
          
        WHEN RV32I_OP_ALU =>
          --which_type<=R;
          RD<=RD_val;RS1<=RS1_val; RS2<=RS2_val;
          RDv<='1'; RS1v<='1'; RS2v<='1';
          Immediate<=(others=>'0');
          CASE FN3 IS
          WHEN RV32I_FN3_ALU_ADD => 
            if  FN7=RV32I_FN7_ALU_SUB then Function_op<=SUBr;
            elsif FN7=RV32I_FN7_ALU then Function_op <=ADDr; 
            else Function_op<=BAD;
            end if;             
          WHEN RV32I_FN3_ALU_SLT => 
            if FN7=RV32I_FN7_ALU then Function_op <=SLTr; else Function_op<=BAD; RD<=(others=>'0');RS1<=(others=>'0'); RS2<=(others=>'0'); RDv<='0'; RS1v<='0'; RS2v<='0';
            end if;
          WHEN RV32I_FN3_ALU_SLTU => 
            if FN7=RV32I_FN7_ALU then Function_op <=SLTUr; else Function_op<=BAD; RD<=(others=>'0');RS1<=(others=>'0'); RS2<=(others=>'0'); RDv<='0'; RS1v<='0'; RS2v<='0'; 
            end if;
          WHEN RV32I_FN3_ALU_XOR => 
            if FN7=RV32I_FN7_ALU then  Function_op <=XORr; else Function_op<=BAD;  RD<=(others=>'0');RS1<=(others=>'0'); RS2<=(others=>'0'); RDv<='0'; RS1v<='0'; RS2v<='0'; 
            end if;
            
          WHEN RV32I_FN3_ALU_OR =>
            if FN7=RV32I_FN7_ALU then  Function_op <=ORr; else Function_op<=BAD;  RD<=(others=>'0');RS1<=(others=>'0'); RS2<=(others=>'0'); RDv<='0'; RS1v<='0'; RS2v<='0'; 
            end if;
            
          WHEN RV32I_FN3_ALU_AND => 
            if FN7=RV32I_FN7_ALU then  Function_op <=ANDr;else Function_op<=BAD;  RD<=(others=>'0');RS1<=(others=>'0'); RS2<=(others=>'0'); RDv<='0'; RS1v<='0'; RS2v<='0'; 
            end if;
            
          WHEN RV32I_FN3_ALU_SLL => 
            if FN7=RV32I_FN7_ALU then Function_op <=SLLr; else Function_op<=BAD;  RD<=(others=>'0');RS1<=(others=>'0'); RS2<=(others=>'0'); RDv<='0'; RS1v<='0'; RS2v<='0'; 
            end if;
            
          WHEN RV32I_FN3_ALU_SRL =>
            if FN7=RV32I_FN7_ALU_SA then Function_op<=SRAr;
            elsif FN7=RV32I_FN7_ALU then Function_op<=SRLr;
            else Function_op<=BAD;  RD<=(others=>'0');RS1<=(others=>'0'); RS2<=(others=>'0'); RDv<='0'; RS1v<='0'; RS2v<='0';
            end if;
          WHEN OTHERS => Function_op<=BAD;  RD<=(others=>'0');RS1<=(others=>'0'); RS2<=(others=>'0'); RDv<='0'; RS1v<='0'; RS2v<='0';
            
          END CASE;
          
          
        WHEN OTHERS => 
          Immediate<=ZEROS_32;
          Function_op<=BAD;
          RD<=(others=>'0');RS1<=(others=>'0'); RS2<=(others=>'0');
          RDv<='0'; RS1v<='0'; RS2v<='0';
          
          
        END CASE;
        
      end if;
    end process;
    
    
    
  END ARCHITECTURE behav;
  
  
  
  
  
  
  
  
  
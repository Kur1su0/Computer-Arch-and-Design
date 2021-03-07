PACKAGE BODY RV32I IS
  
  FUNCTION Ftype(Func : Func_Name) RETURN RV32I_Op IS
    VARIABLE ret : RV32I_Op;
  BEGIN
    CASE Func IS
      WHEN "LUI--" => ret := LUI;
      WHEN "AUIPC" => ret := AUIPC;
      WHEN "JAL--" => ret := JAL;
      WHEN "JALR-" => ret := JALR;
      WHEN "BEQ--" => ret := BEQ;
      WHEN "BNE--" => ret := BNE;
      WHEN "BLT--" => ret := BLT;
      WHEN "BGE--" => ret := BGE;
      WHEN "BLTU-" => ret := BLTU;
      WHEN "BGEU-" => ret := BGEU;
      WHEN "LB---" => ret := LB;
      WHEN "LH---" => ret := LH;
      WHEN "LW---" => ret := LW;
      WHEN "LBU--" => ret := LBU;
      WHEN "LHU--" => ret := LHU;
      WHEN "SB---" => ret := SB;
      WHEN "SH---" => ret := SH;
      WHEN "SW---" => ret := SW;
      WHEN "ADDI-" => ret := ADDI;
      WHEN "SLTI-" => ret := SLTI;
      WHEN "SLTIU" => ret := SLTIU;
      WHEN "XORI-" => ret := XORI;
      WHEN "ORI--" => ret := ORI;
      WHEN "ANDI-" => ret := ANDI;
      WHEN "SLLI-" => ret := SLLI;
      WHEN "SRLI-" => ret := SRLI;
      WHEN "SRAI-" => ret := SRAI;
      WHEN "ADDr-" => ret := ADDr;
      WHEN "SUBr-" => ret := SUBr;
      WHEN "SLLr-" => ret := SLLr;
      WHEN "SLTr-" => ret := SLTr;
      WHEN "SLTUr" => ret := SLTUr;
      WHEN "XORr-" => ret := XORr;
      WHEN "SRLr-" => ret := SRLr;
      WHEN "SRAr-" => ret := SRAr;
      WHEN "ORr--" => ret := ORr;
      WHEN "ANDr-" => ret := ANDr;     
      WHEN OTHERS => ret := BAD;
    END CASE;
    RETURN ret;
  END;

END RV32I;


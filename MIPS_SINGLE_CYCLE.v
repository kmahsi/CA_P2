module mips_single_cycle(clk, rst);
  input clk, rst;
  controller CU(
    .clock(clk), 
    .rst(rst), lasttwoBits, lastthreeBits, twoBitFn, threeBitFn, 
  selectToWrite, selectR2, selectAluArg, ALUfunction, sh_roFunction, STM, LDM,
  rstPC, enablePC, rstZero, enableZero, rstCarry, enableCarry, memRead, memWrite);

  dataPath DP(
    .clk(clk), 
    .rst(rst), pcEn, CEn, ZEn, regWrite, regFileReadRegister2Select, ALUBInputSelect, ALUOperation, regFileWriteDataSelect, SHROOperation, DMMemWrite, DMMemRead);

endmodule
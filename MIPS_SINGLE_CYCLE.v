module mips_single_cycle(clk, rst);
  input clk, rst;
  wire [18:0] instruction;
  wire [1:0] regFileWriteDataSelect;
  wire selectR2, ALUBInputSelect;
  wire [2:0] ALUfunction;
  wire [1:0]sh_roFunction;
  wire memRead, memWrite, regWrite, pcEn, CEn, ZEn;
  wire push, pop, RET;
  wire [1:0] pc3inputMuxSelectAddress;
  wire Zero, CarryOut;
  
  controller CU(
    .clock(clk), 
    .allBits(instruction), 
    .Zero(Zero), 
    .CarryOut(CarryOut),
    .selectToWrite(regFileWriteDataSelect), 
    .selectR2(selectR2), 
    .selectAluArg(ALUBInputSelect), 
    .ALUfunction(ALUfunction), 
    .sh_roFunction(sh_roFunction),
    .STM(memWrite), 
    .LDM(regWrite), 
    .enablePC(pcEn), 
    .enableZero(ZEn), 
    .enableCarry(CEn), 
    .memRead(memRead),
    .selectAdress(pc3inputMuxSelectAddress), 
    .push(push), 
    .pop(pop),
    .RET(RET)
  );
  dataPath DP(
    .clk(clk), 
    .rst(rst),
    .push(push), 
    .pop(pop), 
    .RET(RET),
    .instruction(instruction),
    .pcEn(pcEn), 
    .CEn(CEn), 
    .ZEn(ZEn), 
    .regWrite(regWrite), 
    .regFileReadRegister2Select(selectR2), 
    .ALUBInputSelect(ALUBInputSelect), 
    .ALUOperation(ALUfunction), 
    .regFileWriteDataSelect(regFileWriteDataSelect), 
    .SHROOperation(sh_roFunction), 
    .DMMemWrite(memWrite), 
    .DMMemRead(memRead),
    .pc3inputMuxSelectAddress(pc3inputMuxSelectAddress), 
    .COutput(), 
    .ZOutput()
 );

endmodule
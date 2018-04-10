module dataPath(clk, rst,push, pop, RET, instruction, pcEn, CEn, ZEn, regWrite, regFileReadRegister2Select, ALUBInputSelect, ALUOperation, regFileWriteDataSelect, SHROOperation, DMMemWrite, DMMemRead, pc3inputMuxSelectAddress, COutput, ZOutput, selectCarry);
	
	input clk, rst;
	input pcEn, CEn, ZEn, push, pop, RET;
	input regWrite, DMMemWrite, DMMemRead;
	input [1:0] SHROOperation;
	input regFileReadRegister2Select, ALUBInputSelect;
	input [2:0] ALUOperation;
	input [1:0] regFileWriteDataSelect;
	input [1:0] pc3inputMuxSelectAddress;
	wire [11: 0] pcInput, pcOutput, increamentedPC, pcMuxInput1, pcMuxInput2, increamentedPCPlusDISP;
	wire CInput, ZInput;
	input selectCarry;
	output COutput, ZOutput;
	wire [7:0] regFileWriteData;
	wire [2:0] regFileWriteRegister;
	wire [7:0] readData1, readData2;
	wire [7:0] A, B, DataMemoryAddress;
	wire [7:0] ALUOUT, SHROOUT, dataMemoryOut;
	wire [2:0] regFileReadRegister2;

	output [18:0] instruction;

	register #(.size(12)) pc(
		.clock(clk),
		.reset(rst),
		.enable(pcEn),
		.regIn(pcInput),
		.regOut(pcOutput)
	);

	register #(.size(1)) C(
		.clock(clk),
		.reset(rst),
		.enable(CEn),
		.regIn(finalCarry),
		.regOut(COutput)
	);

	register #(.size(1)) Z(
		.clock(clk),
		.reset(rst),
		.enable(ZEn),
		.regIn(ZInput),
		.regOut(ZOutput)
	);

	adder #(.size(12)) pcAdder(
		.inputA(pcOutput),
		.inputB(12'd1),
		.result(increamentedPC)
	);

	stack  ST(
		.clock(clk), 
		.push(push), 
		.pop(pop), 
		.result(pcMuxInput2), 
		.in(increamentedPC)
	);

	adder #(.size(12)) branchIf(
		.inputA(increamentedPC),
		.inputB({{4{instruction[7]}},instruction[7:0]}),
		.result(increamentedPCPlusDISP)
	);	

	mux_3_input #(.WORD_LENGTH(12)) mux6(
		.in1(increamentedPC), 
		.in2(increamentedPCPlusDISP), 
		.in3(instruction[11:0]), 
		.sel(pc3inputMuxSelectAddress), 
		.out(pcMuxInput1)
		);

	mux_2_input  #(.WORD_LENGTH (12)) mux7 (
		.in1(pcMuxInput1), 
		.in2(pcMuxInput2), 
		.sel(RET), 
		.out(pcInput)
	);

	mux_2_input  #(.WORD_LENGTH (1)) mux8 (
		.in1(CInput), 
		.in2(Cshift), 
		.sel(selectCarry), 
		.out(finalCarry)
	);
	instructionMemory insMemory(
		.clock(clk), 
		.address(pcOutput), 
		.instruction(instruction)
	);
	mux_2_input  #(.WORD_LENGTH (3)) mux1 (
		.in1(instruction[13:11]), 
		.in2(instruction[7:5]), 
		.sel(regFileReadRegister2Select), 
		.out(regFileReadRegister2)
	);
	mux_2_input #(.WORD_LENGTH (8) ) mux2 (
		.in1(instruction[7:0]), // const
		.in2(readData2), 
		.sel(ALUBInputSelect), 
		.out(B)
	);

	mux_3_input #( .WORD_LENGTH (8)) mux3(
		.in1(ALUOUT), 
		.in2(SHROOUT), 
		.in3(dataMemoryOut), 
		.sel(regFileWriteDataSelect), 
		.out(regFileWriteData)
	);

	registerFile regFile(
		.clock(clk), 
		.regWrite(regWrite), 
		.writeRegister(instruction[13:11]), 
		.writeData(regFileWriteData), 
		.readRegister1(instruction[10:8]), 
		.readRegister2(regFileReadRegister2), 
		.readData1(readData1), 
		.readData2(readData2)
	);

	ALU alu(
		.inputA(A), 
		.inputB(B), 
		.carryIn(COutput), 
		.operation(ALUOperation), 
		.result(ALUOUT), 
		.carryOut(CInput), 
		.zero(ZInput)
	);

	assign A = readData1;

	shiftRotate SH_RO (
		.shiftCount(instruction[7:5]), 
		.data(readData1), 
		.operation(SHROOperation), 
		.result(SHROOUT),
		.c(Cshift)
	);

	adder #(.size(8)) dispAdder(
		.inputA(instruction[7:0]),
		.inputB(readData1),
		.result(DataMemoryAddress)
	);

	dataMemory DM(
		.clock(clk) ,
		.memWrite(DMMemWrite), 
		.memRead(DMMemRead), 
		.address(DataMemoryAddress) , 
		.data(readData2) , 
		.out(dataMemoryOut)
	);
endmodule
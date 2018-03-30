module dataPath(clk, rst, pcEn, CEn, ZEn, regWrite, regFileReadRegister2Select, ALUBInputSelect, ALUOperation, regFileWriteDataSelect, SHROOperation, DMMemWrite, DMMemRead);
	input clk, rst;
	input pcEn, CEn, ZEn;
	input regWrite, DMMemWrite, DMMemRead;
	wire [11: 0] pcInput, pcOutput;
	wire CInput, COutput, ZInput, ZOutput;
	wire [18:0] instruction;
	input [1:0] SHROOperation;
	input regFileReadRegister2Select, ALUBInputSelect;
	input [2:0] ALUOperation;
	input [1:0] regFileWriteDataSelect;
	wire [7:0] regFileWriteData;
	wire [2:0] regFileWriteRegister;
	wire [7:0] readData1, readData2;
	wire [7:0] A, B, DataMemoryAddress;
	wire [7:0] ALUOUT, SHROOUT, dataMemoryOut;
	wire [2:0] regFileReadRegister2;

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
		.regIn(CInput),
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
		.result(pcInput)
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
		.result(SHROOUT)
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
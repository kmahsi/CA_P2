module dataPathTB();
	reg clk = 0;
	reg rst = 0;
	reg pcEn = 1;
	reg CEn = 1;
	reg ZEn = 1;
	reg regWrite = 1;
	reg regFileReadRegister2Select = 1;
	reg ALUBInputSelect = 0;
	reg [2:0] ALUOperation = 3'b000;
	reg [1:0] regFileWriteDataSelect = 2'b00;
	reg [1:0] SHROOperation= 2'b00;
	reg DMMemWrite = 1;
	reg DMMemRead = 1;

	initial repeat (10) #50 clk = ~clk;

	initial begin
		#40
		rst = 1;
		#40
		rst = 0;
		#200
		ALUOperation = 3'b000;
		ALUBInputSelect = 1;
		
	end


	dataPath DP(
		.clk(clk), 
		.rst(rst),
		.pcEn(pcEn), 
		.CEn(CEn), 
		.ZEn(ZEn), 
		.regWrite(regWrite), 
		.regFileReadRegister2Select(regFileReadRegister2Select), 
		.ALUBInputSelect(ALUBInputSelect), 
		.ALUOperation(ALUOperation), 
		.regFileWriteDataSelect(regFileWriteDataSelect), 
		.SHROOperation(SHROOperation), 
		.DMMemWrite(DMMemWrite), 
		.DMMemRead(DMMemRead)
	);

endmodule
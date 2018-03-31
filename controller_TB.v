module controller_TB();
	reg clk = 0, rst = 0;
	reg[18:0] allBits;
	
	wire selectAluArg, selectR2, STM, LDM, enablePC, enableZero, enableCarry, memRead;
	wire [1:0]selectToWrite;
	wire [2:0]ALUfunction;
	wire [1:0]sh_roFunction;

	controller UTT(clk, rst, allBits, selectToWrite, selectR2, selectAluArg, ALUfunction, sh_roFunction, STM, LDM,
		enablePC, enableZero, enableCarry, memRead);

	initial repeat (1000) #1 clk = ~clk;

	initial begin 	
		#3;
		rst = 1'b1;
		#5;
		rst = 1'b0;
		#5;
		allBits = 19'b 0000010010101100000;
		#10;
		allBits = 19'b 0111111110000010000;
		#10;
		allBits = 19'b 1101100110001000000;
		#10;
		allBits = 19'b 1000010010100010000;
		#10;
		allBits = 19'b 1000110010100010000;
		#10;
	end 
endmodule 

// reg[1:0] lasttwoBits, twoBitFn;
// 	reg[2:0] lastthreeBits, threeBitFn;
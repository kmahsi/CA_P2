module controller_TB();
	reg clk = 0;
	reg[18:0] allBits;
	reg Zero =0; reg CarryOut=0;
	
	wire selectAluArg, selectR2, STM, LDM, enablePC, enableZero, enableCarry, memRead, push, pop, RET;
	wire [1:0]selectToWrite, selectAdress;
	wire [2:0]ALUfunction;
	wire [1:0]sh_roFunction;

	controller UTT(clk, allBits, Zero, CarryOut, selectToWrite, selectR2, selectAluArg, ALUfunction, sh_roFunction, STM, LDM,
		enablePC, enableZero, enableCarry, memRead, selectAdress, push, pop, RET);

	initial repeat (1000) #20 clk = ~clk;

	initial begin 	
		#3;
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
		allBits = 19'b 1010011111100010000;
		#10
		allBits = 19'b 1011100000000001000;
		#10 
		allBits = 19'b 1110011000100000000;
		#10 
		allBits = 19'b 1110100100000000000;
		#10
		allBits = 19'b 1111000000000000000;
	end 
endmodule 

// reg[1:0] lasttwoBits, twoBitFn;
// 	reg[2:0] lastthreeBits, threeBitFn;
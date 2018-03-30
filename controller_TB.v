module controller_TB();
	reg clk = 0, rst = 0;
	reg[1:0] lasttwoBits, twoBitFn;
	reg[2:0] lastthreeBits, threeBitFn;
	wire selectR2, STM, LDM,
	 rstPC, enablePC, rstZero, enableZero, rstCarry, enableCarry, memRead, memWrite;
	wire [1:0]selectAluArg, selectToWrite;
	wire [2:0]ALUfunction;
	wire [1:0]sh_roFunction;

	controller UTT(clk, rst, lasttwoBits, lastthreeBits, twoBitFn, threeBitFn, 
		selectToWrite, selectR2, selectAluArg, ALUfunction, sh_roFunction, STM, LDM,
		rstPC, enablePC, rstZero, enableZero, rstCarry, enableCarry, memRead, memWrite);

	initial repeat (1000) #1 clk = ~clk;

	initial begin 	
		#3;
		rst = 1'b1;
		#5;
		rst = 1'b0;
		#5;
		lasttwoBits = 2'b00;
		#10;
		lasttwoBits = 2'b01;
		#10;
		lastthreeBits = 3'b110;
		#10;
		lastthreeBits = 3'b100;
		
		#10;
	end 
endmodule 

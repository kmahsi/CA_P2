module instructionMemoryTB();
	reg clk = 0;
	reg [11:0] adr;
	wire [18:0] inst;

	initial repeat (15) #50 clk = ~clk;

	initial begin
	#40
		adr = 1;
	#50
		adr = 3;	
	#70
		adr = 8;
	end

	instructionMemory iMemory(
		.clock(clk), 
		.address(adr), 
		.instruction(inst)
	);
endmodule
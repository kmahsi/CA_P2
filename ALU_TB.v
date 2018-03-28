module ALUTB();
	reg [7:0] A, B;
	wire [7:0] rslt;
	reg ci;
	wire co, zo;	
	reg clk = 0;
	reg [2:0] operation = 3'b000;

	initial repeat (10) #50 clk = ~clk;
	initial begin
		#10
		A = 9;
		B = 11;
		ci = 1;
		operation = 3'b010;
	end

	ALU X(
		.inputA(A),
		.inputB(B), 
		.carryIn(ci), 
		.operation, 
		.result(rslt), 
		.carryOut(co), 
		.zero(zo)
	);

endmodule

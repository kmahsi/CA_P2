module adderTb();
	parameter integer adderSize = 8;
	wire [adderSize - 1: 0] rslt;
	reg clk = 1;
	wire [7:0] inputA = 8'd9;
	wire [7:0] inputB = 8'b11111001;
	initial repeat (10) #50 clk = ~clk;
	adder #(.size(adderSize))  X (
		.inputA(inputA), 
		.inputB(inputB), 
		.result(rslt)
	);

endmodule
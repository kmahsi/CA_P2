module adderTb();
	parameter integer adderSize = 8;
	wire [adderSize - 1: 0] rslt;
	reg clk = 1;

	initial repeat (10) #50 clk = ~clk;
	adder #(.size(adderSize))  X (
		.inputA(8'd5), 
		.inputB(8'd9), 
		.result(rslt)
	);

endmodule
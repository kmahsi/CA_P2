module shiftRotateTB();
	reg clk = 0;
	reg [2:0] shiftCnt = 2;
	reg [7:0] D = 5;
	reg [1:0] opt = 2'b00;
	wire [7:0] rslt;
	wire cshift;
	
	initial repeat (10) #50 clk = ~clk;
	initial begin
		#40 
		#20
		shiftCnt = 2;
		#40
		D = 8'b01001100;
		opt = 2'b00;
		#50
		opt = 2'b10;
		#30
		D = 7 + 127;
		#40
		opt = 2'b11;
	end

	shiftRotate shiftR(
		.shiftCount(shiftCnt), 
		.data(D), 
		.operation(opt),
		.result(rslt),
		.c(cshift)
	);

endmodule
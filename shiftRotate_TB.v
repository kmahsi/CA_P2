module shiftRotateTB();
	reg [2:0] shiftCnt = 3;
	reg [7:0] D = 5;
	wire [7:0] rslt;


	shiftRotate shiftR(
		.shiftCount(shiftCnt), 
		.data(D), 
		.result(rslt)
	);

endmodule
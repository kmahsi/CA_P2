module dataPathTB();
	reg clk = 0;
	reg rst = 0;
	reg pcEn = 1;


	initial repeat (10) #50 clk = ~clk;

	initial begin
		#40
		rst = 1;
		#40
		rst = 0;
	end
	dataPath DP(
		.clk(clk), 
		.rst(rst),
		.pcEn(pcEn)
	);

endmodule
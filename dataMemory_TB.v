module dataMemory_TB();
	reg clk = 0;
	reg [7:0] address;
	reg [7:0] data ;
	reg memWrite = 0;
	reg memRead = 0;
	wire[7:0] out;

	dataMemory UTT(clk, memWrite, memRead, address, data, out);

	initial repeat (1000) #5 clk = ~clk;

	initial begin 

		address = 19;
		data  = 8'b 01001000;
		memWrite = 1'b 1;
		#20;
		memWrite = 1'b0;
		memRead = 1'b1;
		#15;
		memRead = 1'b0;
		address = 23;
		data = 8'b 10101010;
		memWrite = 1'b 1;
		#10
		memWrite = 1'b0;
		memRead = 1'b1;

		end 
endmodule 

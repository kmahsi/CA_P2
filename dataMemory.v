module dataMemory(clock, memWrite, memRead, address, data, out);
	input clock, memWrite, memRead;
	input[7:0] address, data;
	output reg[7:0] out;

	reg[7:0] word[255:0];

	always @(clock)begin
		word[8'd100] <= 8'd150;
		word[8'd101] <= 8'd7;
		word[8'd102] <= 8'd151;
		word[8'd103] <= 8'd9;	
	end
	
	always @(posedge clock) begin
		if (memWrite)begin
			word[address] <= data;
		end
	end
	always @(memRead , address) begin
		if (memRead)begin
			out <= word[address] ;
		end
	end
endmodule 
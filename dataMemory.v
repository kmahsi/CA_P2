module dataMemory(clock ,memWrite, memRead, address , data , out);
	input clock, memWrite, memRead;
	input[7:0] address, data;
	output reg[7:0] out;

	reg[7:0] word[255:0];

	always @(posedge clock) begin
		if (memWrite)begin
			word[address] <= data;
		end
	end
		always @(posedge clock) begin
		if (memRead)begin
			out <= word[address] ;
		end
	end
endmodule 
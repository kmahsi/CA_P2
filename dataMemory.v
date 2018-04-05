module dataMemory(clock, memWrite, memRead, address, data, out);
	input clock, memWrite, memRead;
	input[7:0] address, data;
	output reg[7:0] out;

	reg[7:0] word[255:0];

	always @(clock)begin
		word[8'd100] <= 8'd10;
		word[8'd101] <= 8'd7;
		word[8'd102] <= 8'd75;
		word[8'd103] <= 8'd9;	
		word[8'd104] <= 8'd3;
		word[8'd105] <= 8'd4;
		word[8'd106] <= 8'd5;
		word[8'd107] <= 8'd6;
		word[8'd108] <= 8'd7;
		word[8'd109] <= 8'd8;
		word[8'd110] <= 8'd9;
		word[8'd111] <= 8'd90;
		word[8'd112] <= 8'd10;
		word[8'd113] <= 8'd12;
		word[8'd114] <= 8'd13;
		word[8'd115] <= 8'd14;
		word[8'd116] <= 8'd15;
		word[8'd117] <= 8'd120;
		word[8'd118] <= 8'd1;
		word[8'd119] <= 8'd1;
		word[8'd120] <= 8'd1;
		word[8'd121] <= 8'd1;
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
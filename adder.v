module adder #(parameter integer size = 8)(inputA, inputB, result);
	input [size - 1: 0] inputA, inputB;
	output reg [size - 1: 0] result;
	always @(*) begin
		if ( inputB[size - 1] == 1)begin
			result = inputA - (~(inputB) + 1);
		end
		else result = inputA + inputB;
	end	

endmodule
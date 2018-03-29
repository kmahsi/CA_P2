module adder #(parameter integer size = 8)(inputA, inputB, result);
	input [size - 1: 0] inputA, inputB;
	output [size - 1: 0] result;
	assign result = inputB + inputA;
	

endmodule
module ALU(inputA, inputB, carryIn, operation, result, carryOut, zero);
	input [7:0] inputA, inputB;
	input carryIn;
	input [2:0] operation;
	output reg [7:0] result;
	output reg carryOut, zero;

	always @(*) begin
		case(operation)
			3'b000: {carryOut, result} = inputA + inputB;
			3'b001: {carryOut, result} = inputA + inputB + carryIn;
			3'b010: {carryOut, result} = inputA - inputB;
			3'b011: {carryOut, result} = inputA - inputB - carryIn;
			3'b100: result = inputB & inputA;
			3'b101: result = inputB | inputA;
			3'b110: result = inputB ^ inputA;
			3'b111: result = inputB &^ inputA;
			default: result = result;
		endcase
		zero = ~(|result);
	end

endmodule
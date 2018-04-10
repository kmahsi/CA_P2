module shiftRotate (shiftCount, data, operation, result, c);
	input [7:0] data;	
	input [2:0] shiftCount;
	input [1:0] operation;
	output reg [7:0] result;
	output reg c;
	integer i;
	always @(*) begin
		result = data;
			case (operation)
				2'b00: {c ,result} <= (result << shiftCount);
				2'b01: {result, c} <= (result >> shiftCount);
				2'b10:
					for ( i = 0; i < shiftCount; i = i + 1) begin
						result = {result[6:0], result[7]};
					end
				2'b11: 
					for ( i = 0; i < shiftCount; i = i + 1) begin
						result = {result[0], result[7:1]};
					end
				default: result <= result;
			endcase
	end

endmodule
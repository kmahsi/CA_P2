module shiftRotate (shiftCount, data, result);
	input [7:0] data;	
	input [2:0] shiftCount;
	output reg [7:0] result;

	wire [3:0] finishShifting = shiftCount;

	integer i;
	always @(*) begin
		for ( i = 0; i < shiftCount; i = i + 1) begin
			result <= i;
		end	
	end

endmodule
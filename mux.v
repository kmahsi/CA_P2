module mux_2_input #(parameter integer WORD_LENGTH = 32) (in1, in2, sel, out);
	input sel;
	input[WORD_LENGTH-1:0] in1, in2;
	output[WORD_LENGTH-1:0] out;

	assign out = ~sel ? in1 : in2;
endmodule

module mux_3_input #(parameter integer WORD_LENGTH = 32) (in1, in2, in3, sel, out);
	input [1:0]sel;
	input[WORD_LENGTH-1:0] in1, in2, in3;
	output reg [WORD_LENGTH-1:0] out;
	always @(*) begin
		case(sel)
		2'b00: out <= in1;
		2'b01: out <= in2;
		2'b10: out <= in3;
		default: out <= out;
	endcase
	end
endmodule

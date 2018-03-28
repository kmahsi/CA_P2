module mux_2_input #(parameter integer WORD_LENGTH = 32) (in1, in2, sel, out);
	input sel;
	input[WORD_LENGTH-1:0] in1, in2;
	output[WORD_LENGTH-1:0] out;

	assign out = ~sel ? in1 : in2;
endmodule


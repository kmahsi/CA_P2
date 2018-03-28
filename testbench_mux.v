module testbench ();
	wire out;
	reg sel;
	wire in1 ; 
	wire in2;

	assign in1 = 1'b 1;
	assign in2 = 1'b 0;
	mux_2_input UTT(in1 , in2, sel, out);
	initial begin 
		sel = 0;
		#100;

	end 
endmodule // testbench
module stackTB();
	
	reg push, pop, clock = 0 ;
	reg [11:0] in;
	wire [11:0] result;


	initial repeat (15) #50 clock = ~clock;

	initial begin
		in = 100;
		push = 1;
		#70
		in = 7;
		push  = 1;
		#100
		push = 0;
		#100
		pop = 1;
	end
	stack  ST(
		.clock(clock),
		.push(push), 
		.pop(pop), 
		.result(result), 
		.in(in)
	);

endmodule
module controller (clock, rst, zero, carryOut, lasttwoBits, lastthreeBits, twoBitFn, threeBitFn, 
	selectToWrite, selectRd, selectAluArg, ALUfunction, sh_roFunction, STM, LDM, rstPC, enablePC);
	input clock, rst, zero, carryOut;
	input [1:0]lasttwoBits, twoBitFn; 
	input  [2:0]lastthreeBits, threeBitFn;
	output reg selectToWrite, selectRd, selectAluArg, STM, LDM, rstPC, enablePC;
	output reg[2:0]ALUfunction;
	output reg[1:0]sh_roFunction;
	
	always @(posedge clock)
		enablePC <= 1'b1;

	always @(*) begin
			case(lasttwoBits)
				2'b 00 : ALUfunction <= threeBitFn;
				2'b 01 : selectAluArg <= 1'b0; // with 0 signal the mux choses const number
			endcase
	end

	always @(*) begin
			case(lastthreeBits)
				3'b 110: sh_roFunction <= twoBitFn;
				// 3'b 100: 
				// 3'b 101:  conditional jump
			endcase
	end	
// these lines had error what says Illegal reference to net variable , 
//which is actually true because zero and carryout are inputs in this code.
	// always @(posedge clock)
	// 	if(rst) begin 
	// 		zero <= 1'b0;
	// 		carryOut <= 1'b0;
	// 		rstPC <= 1'b1;
	// 	end 
endmodule

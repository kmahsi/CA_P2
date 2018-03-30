module controller (clock, rst, lasttwoBits, lastthreeBits, twoBitFn, threeBitFn, 
	selectToWrite, selectRd, selectAluArg, ALUfunction, sh_roFunction, STM, LDM,
	rstPC, enablePC, rstZero, enableZero, rstCarry, enableCarry, memRead, memWrite);

	input clock, rst;
	input [1:0]lasttwoBits, twoBitFn; 
	input  [2:0]lastthreeBits, threeBitFn;
	output reg selectRd, STM, LDM,
	 rstPC, enablePC, rstZero, enableZero, rstCarry, enableCarry, memRead, memWrite;
	output reg[1:0]selectAluArg, selectToWrite;
	output reg[2:0]ALUfunction;
	output reg[1:0]sh_roFunction;
	reg[1:0] memFunction;
	
	always @(posedge clock)
		enablePC <= 1'b1;

	always @(*) begin
		case(lasttwoBits)
			2'b 00 : begin 
				ALUfunction <= threeBitFn;
				selectAluArg <= lasttwoBits;
				selectToWrite <= 2'b00; // with 00 signal the mux choses result of ALU
				enableCarry= 1'b1;
				enableZero= 1'b1;
				end
			2'b 01 : begin 
				ALUfunction <= threeBitFn;
				selectAluArg <= lasttwoBits; 
				selectToWrite <= 2'b01; // with 01 signal the mux choses result of immediate  
				enableCarry = 1'b1;
				enableZero = 1'b1;
				end
		endcase
	end

	always @(*) begin
		case(lastthreeBits)
			3'b 110: begin
				sh_roFunction <= twoBitFn;
				selectToWrite <= 2'b10; // with 10 signal the mux choses result of shift_rotate


				// shift and rotate does not have enable but in picture there is a line for it !!!!!!
				end
			3'b 100: begin 
				if(twoBitFn == 2'b00) begin
					LDM <=1'b1;
					memRead <= 1'b1;
				end

				if(twoBitFn == 2'b01) begin	
					STM <=1'b1;
					memWrite <= 1'b1;
				end
			end 
		endcase
	end

	always @(posedge clock)
		if(rst) begin 
			rstZero <= 1'b1;
			rstCarry <= 1'b1;
			rstPC <= 1'b1;
		end 

endmodule

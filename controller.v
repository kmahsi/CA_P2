module controller (clock, allBits, selectToWrite, selectR2, selectAluArg, ALUfunction, sh_roFunction,
	STM, LDM, enablePC, enableZero, enableCarry, memRead);

	input clock;
	input[18:0]allBits;

	output reg selectR2, selectAluArg, STM, LDM, enablePC, enableZero, enableCarry, memRead;
	output reg[1:0]selectToWrite;
	output reg[2:0]ALUfunction;
	output reg[1:0]sh_roFunction;
	
	wire bit_17_;
	assign bit_17_ = allBits[17];

	always @(posedge clock)
		enablePC <= 1'b1;

	wire[1:0]lasttwoBits;
	assign lasttwoBits = allBits[18:17];
	wire[2:0]threeBitFn;
	assign threeBitFn = allBits[16:14];

	always @(*) begin
		case(lasttwoBits)
			2'b 00 : begin 
				ALUfunction <= threeBitFn;
				selectAluArg <= ~bit_17_; // with 1 signal the mux choses usual 
				selectR2 <= 1'b1; // with 1 signal the mux choses[7:5]
				selectToWrite <= 2'b00; // with 00 signal the mux choses result of ALU
				enableCarry= 1'b1;
				enableZero= 1'b1;
				end
			2'b 01 : begin 
				ALUfunction <= threeBitFn;
				selectAluArg <= ~bit_17_; //with 0 signal the mux choses immediate 
				selectR2 <= 1'b1; // with 1 signal the mux choses[7:5]
				selectToWrite <= 2'b00; // with 00 signal the mux choses result of ALU 
				enableCarry = 1'b1;
				enableZero = 1'b1;
				end
		endcase
	end

	wire[2:0]lastthreeBits;
	assign lastthreeBits = allBits[18:16];
	wire[1:0]twoBitFn;
	assign twoBitFn = allBits[15:14];

	always @(*) begin
		case(lastthreeBits)
			3'b 110: begin
				sh_roFunction <= twoBitFn;
				selectToWrite <= 2'b01; // with 01 signal the mux choses result of shift_rotate
				enableCarry = 1'b0;
				enableZero = 1'b0;
				end
			3'b 100: begin 
				if(twoBitFn == 2'b00) begin
					LDM <=1'b1;
					memRead <= 1'b1;
					selectToWrite <= 2'b10; // with 01 signal the mux choses result of dataMemory
					enableCarry = 1'b0;
					enableZero = 1'b0;
				end

				if(twoBitFn == 2'b01) begin	
					STM <=1'b1;
					selectR2 <= 1'b0; // with 0 signal the mux choses[13:11]
					enableCarry = 1'b0;
					enableZero = 1'b0;
				end
			end 
		endcase
	end

endmodule

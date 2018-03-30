module instructionMemory(clock, address, instruction);
	input clock;
	input [11:0] address;
	output reg [18:0] instruction;
	wire [18:0] commands [4095:0];
	// value              2nd dimension of array
	always @(posedge clock) begin
		instruction <= commands[address];
	end




	assign commands[0] = 25;
	assign commands[1] = 23;
	assign commands[2] = 20;
	assign commands[3] = 12;
	assign commands[4] = 13;
	assign commands[5] = 14;
	assign commands[6] = 15;
	assign commands[7] = 16;
	assign commands[8] = 17;
	assign commands[9] = 18;
	assign commands[10] = 19;
	assign commands[11] = 21;
	assign commands[100] = 30;
endmodule
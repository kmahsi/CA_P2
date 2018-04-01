module instructionMemory(clock, address, instruction);
	input clock;
	input [11:0] address;
	output reg [18:0] instruction;
	wire [18:0] commands [4095:0];
	// value              2nd dimension of array
	always @(posedge clock) begin
		instruction <= commands[address];
	end


// assign commands[0] = {2'b01, 3'b000, 3'b001, 3'b000, 8'd7};
// 	assign commands[1] = {2'b00, 3'b000, 3'b011, 3'b001, 3'b001, 5'b00000};
// 	assign commands[2] = {2'b00, 3'b010, 3'b010, 3'b001, 3'b011, 5'b00000};
// 	assign commands[3] = {3'b100, 2'b01, 3'b010, 3'b001, 8'd60};
// 	assign commands[4] = {3'b110, 2'b00, 3'b100, 3'b011, 3'd3, 5'b00000};
	

	assign commands[0] = {3'b100, 2'b00, 3'b001, 3'b000, 8'd100};
	assign commands[1] = {3'b100, 2'b00, 3'b010, 3'b000, 8'd102};
	assign commands[2] = {2'b00, 3'b000, 3'b011, 3'b001, 3'b010, 5'b00000}; //ADD
	assign commands[3] = {3'b100, 2'b01, 3'b011, 3'b000, 8'd104};
	assign commands[4] = {3'b100, 2'b00, 3'b001, 3'b000, 8'd101};
	assign commands[5] = {3'b100, 2'b00, 3'b010, 3'b000, 8'd103};
	assign commands[6] = {2'b00, 3'b001, 3'b011, 3'b001, 3'b010, 5'b00000}; //ADDC
	assign commands[7] = {3'b100, 2'b01, 3'b011, 3'b000, 8'd105};
	assign commands[8] = 17;
	assign commands[9] = 18;
	assign commands[10] = 19;
	assign commands[11] = 21;
	assign commands[100] = 30;
endmodule
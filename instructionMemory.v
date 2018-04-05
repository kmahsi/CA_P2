module instructionMemory(clock, address, instruction);
	input clock;
	input [11:0] address;
	output wire [18:0] instruction;
	reg [18:0] commands [4095:0];
	// value              2nd dimension of array
		assign instruction = commands[address];


// assign commands[0] = {2'b01, 3'b000, 3'b001, 3'b000, 8'd7};
// 	assign commands[1] = {2'b00, 3'b000, 3'b011, 3'b001, 3'b001, 5'b00000};
// 	assign commands[2] = {2'b00, 3'b010, 3'b010, 3'b001, 3'b011, 5'b00000};
// 	assign commands[3] = {3'b100, 2'b01, 3'b010, 3'b001, 8'd60};
// 	assign commands[4] = {3'b110, 2'b00, 3'b100, 3'b011, 3'd3, 5'b00000};
	
	initial begin
		
		// commands[0] = {3'b100, 2'b00, 3'b001, 3'b000, 8'd100};
		// commands[1] = {3'b100, 2'b00, 3'b010, 3'b000, 8'd102};
		// commands[2] = {2'b00, 3'b000, 3'b011, 3'b001, 3'b010, 5'b00000}; //ADD
		// commands[3] = {3'b100, 2'b01, 3'b011, 3'b000, 8'd104}; // STORE
		// commands[4] = {3'b100, 2'b00, 3'b001, 3'b000, 8'd101};
		// commands[5] = {3'b100, 2'b00, 3'b010, 3'b000, 8'd103};
		// commands[6] = {2'b00, 3'b001, 3'b011, 3'b001, 3'b010, 5'b00000}; //ADDC
		// commands[7] = {3'b100, 2'b01, 3'b011, 3'b000, 8'd105}; // STORE
	end
		initial  
      begin  
                commands[0] = {2'b00, 3'b000, 3'b111, 3'b000, 3'b000, 5'b00000};  //ADD R7, R0, R0
                commands[1] = {2'b00, 3'b000, 3'b001, 3'b000, 3'b000, 5'b00000};  //ADD R1, R0, R0
                commands[2] = {2'b01, 3'b010, 3'b011, 3'b001, 8'd20};    // SUBI R3, R1, 20
                commands[3] = {3'b101, 2'b00, 6'd0, 8'd10};  				//BZ END
                commands[4] = {3'b100, 2'b00, 3'b010, 3'b001, 8'd100 };    //LDM R2, 100(R1)
                commands[5] = {2'b00, 3'b010, 3'b011, 3'b111, 3'b010, 5'b00000};   //SUB R3, R7, R2 
                commands[6] = {3'b101, 2'b11, 6'b000000, 8'd1};   //BNC L1
                commands[7] = {2'b00, 3'b000, 3'b111, 3'b010, 3'b000, 5'b00000};   //ADD R7, R2, R0
                commands[8] = {2'b01, 3'b000, 3'b001, 3'b001, 8'd1};  			//ADDI R1, R1, 1
                commands[9] = {5'b11100, 2'b00, 12'd2};  //JMP LOOP;
                commands[10] = {19'b0};
                // commands[10] = 19'b0000000000000000000;  
                // commands[11] = 19'b0000000000000000000;  
                // commands[12] = 19'b0000000000000000000;  
                // commands[13] = 19'b0000000000000000000;  
                // commands[14] = 19'b0000000000000000000;  
                // commands[15] = 19'b0000000000000000000;  
      end  
	// assign commands[8] = 17;
	// assign commands[9] = 18;
	// assign commands[10] = 19;
	// assign commands[11] = 21;
	// assign commands[100] = 30;
endmodule
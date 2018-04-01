module stack  (clock, push, pop, result, in);
    input push, pop, clock;
    input [11:0] in;
    output reg [11:0] result;

    reg [11:0] registers [7:0];
    reg [2:0]top = 0;
    always @(posedge clock)begin
	    if(push)begin
	    	registers[top] = in;
	    	top = top + 1;
	    end
	    else if (pop) begin
	    	result <= registers[top - 1];
	    	top = top - 1;
	    end
	end
endmodule
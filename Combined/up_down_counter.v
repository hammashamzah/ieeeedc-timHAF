module up_down_counter
#(parameter WIDTH = 19)(
	out      	,   // Output of the counter
	up 			,   // Up control for counter
	down  		,   // Down control for counter
	clk      	,   // Clock input
	reset       	// Reset input
);

/*	With 200kHz sampling, 1 second window is 200k clock cycles
 *	200k = 0b‭0011 0000 1101 0100 0000‬; 18bit + 1 sign bit
 */

	//----------Output Ports--------------
	output reg [WIDTH-1:0] out;
	//------------Input Ports-------------- 
	input up, down, clk, reset;

	//-------------Code Starts Here-------
	always @(posedge clk) begin
		if (!reset) begin // active low reset
		  out <= {WIDTH{1'b0}};
		end
		else if (up & !(down)) begin
		  out <= out + {{(WIDTH-1){1'b0}},1'b1};
		end
		else if (!up & down) begin
		  out <= out - {{(WIDTH-1){1'b0}},1'b1};
		end
	end
endmodule

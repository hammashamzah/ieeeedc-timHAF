module up_down_counter
#(parameter WIDTH = 20)(
	out      	,   // Output of the counter
	up 			,   // Up control for counter
	down  		,   // Down control for counter
	clk      	,   // Clock input
	reset       	// Reset input
);
	//----------Output Ports--------------
	output [WIDTH-1:0] out;
	//------------Input Ports-------------- 
	input up, down, clk, reset;
	//------------Internal Variables--------
	reg [7:0] out;
	//-------------Code Starts Here-------
	always @(posedge clk) begin
		if (!reset) begin // active low reset
		  out <= {WIDTH{1'b0}};
		end
		else if (up & !(down)) begin
		  out <= out + 1;
		end
		else if (!up & down) begin
		  out <= out - 1;
		end
	end
endmodule

module
#(parameter WIDTH = 8)
(
	clk,
	rst,
	x1_k,
	x2_k_delayed,
	x2_k_delayed_minus_1,

);

	output out;
	
	input clk;
	input rst;

	input x1_k;
	input x2_k_delayed;
	input x2_k_delayed_minus_1;
	

	up_down_counter updowncounter
	(
		.out(out[WIDTH-1])      ,   // Output of the counter
		.up (up_signal)			,   // Up control for counter
		.down(down_signal)  	,   // Down control for counter
		.clk(clk)		      	,   // Clock input
		.reset(rst)     		  	// Reset input
	);

	assign up_signal = x1_k AND (x2_k_delayed AND NOT(x2_k_delayed_minus_1));
	assign down_signal = x1_k AND (NOT(x2_k_delayed) AND x2_k_delayed_minus_1);

endmodule
module ccd
#(parameter WIDTH = 20)
(
	clk,
	rst,
	x1_k,
	x2_k_delayed,
	x2_k_delayed_minus_1,
	out
);

	output out;
	
	input clk;
	input rst;

	input x1_k;
	input x2_k_delayed;
	input x2_k_delayed_minus_1;
	
	wire [WIDTH-1:0] out_temp;

	up_down_counter updowncounter
	(
		.out(out_temp)      ,   // Output of the counter
		.up (up_signal)		,   // Up control for counter
		.down(down_signal)  	,   // Down control for counter
		.clk(clk)		      	,   // Clock input
		.reset(rst)     		  	// Reset input
	);

	assign up_signal = x1_k & (x2_k_delayed & !(x2_k_delayed_minus_1));
	assign down_signal = x1_k & (!(x2_k_delayed) & x2_k_delayed_minus_1);
	assign out = out_temp[WIDTH-1];
endmodule
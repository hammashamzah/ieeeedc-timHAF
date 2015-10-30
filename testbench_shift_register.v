module testbench_shift_register;
	parameter clk_periode = 10; 

	reg clk;
	reg rst;
	reg en;
	reg data_in;
	wire[31:0] data_out;


	shift_register#(32) shiftregister
	(
	.clk(clk),
	.rst(rst),
	.en(en),
	.data_in(data_in),
	.data_out(data_out)
	);
	
	initial begin
		rst = 1'b0;
		en = 1'b0;
		clk = 1'b0;
		data_in = 1'b0;
		#(clk_periode*2) rst = 1'b1;
		#(clk_periode*5) en = 1'b1;
		
	end
	always #(clk_periode/2) clk = !clk;
	always #(clk_periode*2) data_in = !data_in;
endmodule
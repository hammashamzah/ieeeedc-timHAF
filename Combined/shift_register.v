module shift_register
#(parameter WIDTH = 87)
(
	clk,
	rst,
	en,
	data_in,
	data_out
);
	input clk;
	input rst;
	input en;
	input data_in;

	output[WIDTH-1:0] data_out;

	reg[WIDTH-1:0] data;

	always @(posedge clk) begin
		if (rst) begin
			data <= {WIDTH{1'b0}};
		end
		else if (en) begin
			data <= {data[WIDTH-2:0],data_in};
		end
	end

	assign data_out = data;

endmodule

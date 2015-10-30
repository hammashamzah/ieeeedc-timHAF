module cda_top_level
#(parameter STAGES = 87)
(
	clk,
	rst,
	en,
	x1,
	x2,
	out
);


	input clk;
	input rst;
	input en;
	input x1;
	input x2;

	output out;

	wire[STAGES:0] x2_delayed;
	wire[STAGES-2:0] msb_cc;
	wire[STAGES-2:0] encoder_input;

	shift_register#(88) x2_shifted
	(
		.clk(clk),
		.rst(rst),
		.en(en),
		.data_in(x1),
		.data_out(x2_delayed)
	);

	encoder encdr(
		.binary_out(out),
		.encoder_in(encoder_input),
		.en(en)
	);

	genvar i;
	generate
		for (i = 0; i < STAGES; i = i + 1)
		begin: ccd_block
			ccd ccd_block(clk,rst,x1,x2_delayed[i+1],x2_delayed[i],msb_cc[i]);
		end
	endgenerate

	genvar j;
	generate
		for (j = 0; j < STAGES; j = j + 1)
		begin: encoderinput
			assign encoder_input[j] = msb_cc[j] ^ msb_cc[j+1];
		end
	endgenerate
endmodule
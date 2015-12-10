module top_level
(
	input	clk,
	input	en,
	input	rst,
	input	x1,
	input	x2,
	input	y1,
	input	y2,
	output	[8:0]angle
);

	reg		rst_cda;
	wire	[6:0]	code_12,
					code_21,
					code_34,
					code_43;
					
	reg		[19:0]counter;

	cda_top_level cda12
	(
		.clk	(clk),
		.rst	(rst_cda),
		.en		(en),
		.x1		(x1),
		.x2		(x2),
		.out	(code_12)
	);
	
	cda_top_level cda21
	(
		.clk	(clk),
		.rst	(rst_cda),
		.en		(en),
		.x1		(x2),
		.x2		(x1),
		.out	(code_21)
	);
	
	cda_top_level cda34
	(
		.clk	(clk),
		.rst	(rst_cda),
		.en		(en),
		.x1		(y1),
		.x2		(y2),
		.out	(code_34)
	);
	
	cda_top_level cda43
	(
		.clk	(clk),
		.rst	(rst_cda),
		.en		(en),
		.x1		(y2),
		.x2		(y1),
		.out	(code_43)
	);
	
	LUT_toplevel LUT
	(
		.clock		(clk),
		.code_x1	(code_12),
		.code_x2	(code_21),
		.code_y1	(code_34),
		.code_y2	(code_43),
		.theta		(angle)
	);

	/** 1 second counter **/
	/*	With 200kHz sampling, 1 second window is 200k clock cycles
	 *	200k = 0b‭0011 0000 1101 0100 0000‬; 18bit + 1 sign bit
	 */
	always @(posedge clk)
	begin
		if(en || rst)
		begin
			if(rst || counter >= 19'd199999)
			begin
				counter <= 19'd0;
				rst_cda <= 1'b1;
			end
			else
			begin
				counter <= counter + 19'd1;
				rst_cda <= 1'b0;
			end
		end
	end
	
endmodule 

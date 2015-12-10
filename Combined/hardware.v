module hardware
(
	input		clk,
	input		reset,
	input		enable,
	input		[7:0]x1,
	input		[7:0]x2,
	input		[7:0]y1,
	input		[7:0]y2,
	output reg	[6:0]segment0,
	output reg	[6:0]segment1,
	output reg	[6:0]segment2,
	output		msb_x1,
	output		msb_x2,
	output		msb_y1,
	output		msb_y2
);

	wire	clock;
	reg	[7:0]	x1_in,
				x2_in,
				y1_in,
				y2_in;
	wire	x1_quant,
			x2_quant,
			y1_quant,
			y2_quant;
	wire	reset_inv;
	wire	[8:0]angle;
	wire	[3:0]	bcd0,
					bcd1,
					bcd2;
	wire	[6:0]	seg0,
					seg1,
					seg2;

	/** Reset signal handling **/
	assign reset_inv = !reset;
	
	/** Clock Divider **/
	clockDIV newClock(	.enable		(enable),
						.reset		(reset_inv),
						.clock		(clk),
						.newClock	(clock));
	
	/** Input register **/
	always @(posedge clock)
	begin
		if(reset_inv)
		begin
			x1_in <= 8'd0;
			x2_in <= 8'd0;
			y1_in <= 8'd0;
			y2_in <= 8'd0;
		end
		else
		begin
			x1_in <= x1;
			x2_in <= x2;
			y1_in <= y1;
			y2_in <= y2;
		end
	end
	
	/** Quantization **/
	quantizer x1q(	.in		(x1_in),
					.out	(x1_quant));
	quantizer x2q(	.in		(x2_in),
					.out	(x2_quant));
	quantizer y1q(	.in		(y1_in),
					.out	(y1_quant));
	quantizer y2q(	.in		(y2_in),
					.out	(y2_quant));
	
	/** Processing unit **/
	top_level processor(	.clk	(clock),
							.en		(enable),
							.rst	(reset_inv),
							.x1		(x1_quant),
							.x2		(x2_quant),
							.y1		(y1_quant),
							.y2		(y2_quant),
							.angle	(angle));
	
	/** Binary to BCD Converter **/
	bcd converter(	.number	(angle),
					.bcd0	(bcd0),
					.bcd1	(bcd1),
					.bcd2	(bcd2));
	
	/** Seven-segment converter **/
	bcdto7seg seg0conv(	.bcd	(bcd0),
						.seg	(seg0));
	bcdto7seg seg1conv(	.bcd	(bcd1),
						.seg	(seg1));
	bcdto7seg seg2conv(	.bcd	(bcd2),
						.seg	(seg2));
	
	/** Output register **/
	always @(posedge clock)
	begin
		if(enable)
		begin
			segment0 <= seg0;
			segment1 <= seg1;
			segment2 <= seg2;
		end
	end
	
	/** LED Output for Debugging **/
	assign	msb_x1 = x1[7],
			msb_x2 = x2[7],
			msb_y1 = y1[7],
			msb_y2 = y2[7];
	
endmodule 
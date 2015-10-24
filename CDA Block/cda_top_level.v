module cda_top_level
(

);


	input clock;
	input rst;
	input en;
	input x1;
	input x2;

	output out;

	genvar i;
	generate
		for (i = 0; i < STAGES; i = i + 1)
		begin: ccd_block
			ccd ccd_block(clk,rst,x1,x2_delayed[i],x2_delayed[i-1],msb_cc[i]);
		end
	endgenerate
		
	genvar i;
	generate
		for(i = 0; i< STAGES; i = i + 1)
		begin: 
			assign  = ;
		end
	endgenerate



	always @(posedge clk) begin
		if (!rst) begin
			// reset
			
		end
		else if () begin
			
		end
	end
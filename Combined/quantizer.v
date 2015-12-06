module quantizer(in,out);
	parameter	WIDTH = 8,
				THRESHOLD = 8'b10000000;
				
	input   [WIDTH-1:0] in;
	output  out;
	
	assign out = (in >= THRESHOLD)? 1'b1 : 1'b0;
	
endmodule 
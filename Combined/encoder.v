module encoder
#(parameter WIDTH = 87)(
	
	en			,	//  Enable for the encoder
	encoder_in	,	//  16-bit Input
	binary_out		//  7 bit binary Output
);
	output [6:0] binary_out  ;
	input  en ; 
	input [WIDTH - 2:0] encoder_in ;
	
	assign binary_out  = (!en) ? 7'd127 : (
						(encoder_in[0 ]) ? 7'd1  : 
						(encoder_in[1 ]) ? 7'd2  : 
						(encoder_in[2 ]) ? 7'd3  : 
						(encoder_in[3 ]) ? 7'd4  : 
						(encoder_in[4 ]) ? 7'd5  : 
						(encoder_in[5 ]) ? 7'd6  : 
						(encoder_in[6 ]) ? 7'd7  : 
						(encoder_in[7 ]) ? 7'd8  : 
						(encoder_in[8 ]) ? 7'd9  : 
						(encoder_in[9 ]) ? 7'd10 : 
						(encoder_in[10]) ? 7'd11 : 
						(encoder_in[11]) ? 7'd12 : 
						(encoder_in[12]) ? 7'd13 : 
						(encoder_in[13]) ? 7'd14 : 
						(encoder_in[14]) ? 7'd15 : 
						(encoder_in[15]) ? 7'd16 : 
						(encoder_in[16]) ? 7'd17 : 
						(encoder_in[17]) ? 7'd18 : 
						(encoder_in[18]) ? 7'd19 : 
						(encoder_in[19]) ? 7'd20 : 
						(encoder_in[20]) ? 7'd21 : 
						(encoder_in[21]) ? 7'd22 : 
						(encoder_in[22]) ? 7'd23 : 
						(encoder_in[23]) ? 7'd24 : 
						(encoder_in[24]) ? 7'd25 : 
						(encoder_in[25]) ? 7'd26 : 
						(encoder_in[26]) ? 7'd27 : 
						(encoder_in[27]) ? 7'd28 : 
						(encoder_in[28]) ? 7'd29 : 
						(encoder_in[29]) ? 7'd30 : 
						(encoder_in[30]) ? 7'd31 : 
						(encoder_in[31]) ? 7'd32 : 
						(encoder_in[32]) ? 7'd33 : 
						(encoder_in[33]) ? 7'd34 : 
						(encoder_in[34]) ? 7'd35 : 
						(encoder_in[35]) ? 7'd36 : 
						(encoder_in[36]) ? 7'd37 : 
						(encoder_in[37]) ? 7'd38 : 
						(encoder_in[38]) ? 7'd39 : 
						(encoder_in[39]) ? 7'd40 : 
						(encoder_in[40]) ? 7'd41 : 
						(encoder_in[41]) ? 7'd42 : 
						(encoder_in[42]) ? 7'd43 : 
						(encoder_in[43]) ? 7'd44 : 
						(encoder_in[44]) ? 7'd45 : 
						(encoder_in[45]) ? 7'd46 : 
						(encoder_in[46]) ? 7'd47 : 
						(encoder_in[47]) ? 7'd48 : 
						(encoder_in[48]) ? 7'd49 : 
						(encoder_in[49]) ? 7'd50 : 
						(encoder_in[50]) ? 7'd51 : 
						(encoder_in[51]) ? 7'd52 : 
						(encoder_in[52]) ? 7'd53 : 
						(encoder_in[53]) ? 7'd54 : 
						(encoder_in[54]) ? 7'd55 : 
						(encoder_in[55]) ? 7'd56 : 
						(encoder_in[56]) ? 7'd57 : 
						(encoder_in[57]) ? 7'd58 : 
						(encoder_in[58]) ? 7'd59 : 
						(encoder_in[59]) ? 7'd60 : 
						(encoder_in[60]) ? 7'd61 : 
						(encoder_in[61]) ? 7'd62 : 
						(encoder_in[62]) ? 7'd63 : 
						(encoder_in[63]) ? 7'd64 : 
						(encoder_in[64]) ? 7'd65 : 
						(encoder_in[65]) ? 7'd66 : 
						(encoder_in[66]) ? 7'd67 : 
						(encoder_in[67]) ? 7'd68 : 
						(encoder_in[68]) ? 7'd69 : 
						(encoder_in[69]) ? 7'd70 : 
						(encoder_in[70]) ? 7'd71 : 
						(encoder_in[71]) ? 7'd72 : 
						(encoder_in[72]) ? 7'd73 : 
						(encoder_in[73]) ? 7'd74 : 
						(encoder_in[74]) ? 7'd75 : 
						(encoder_in[75]) ? 7'd76 : 
						(encoder_in[76]) ? 7'd77 : 
						(encoder_in[77]) ? 7'd78 : 
						(encoder_in[78]) ? 7'd79 : 
						(encoder_in[79]) ? 7'd80 : 
						(encoder_in[80]) ? 7'd81 : 
						(encoder_in[81]) ? 7'd82 : 
						(encoder_in[82]) ? 7'd83 : 
						(encoder_in[83]) ? 7'd84 : 
						(encoder_in[84]) ? 7'd85 : 
						(encoder_in[85]) ? 7'd86 : 7'd127);
	
endmodule

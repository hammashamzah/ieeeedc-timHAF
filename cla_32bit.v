/*
	Author : Fauzan Akbar Sahri
	Carry Lookahead Adder 32 bit (use 8 cla_4bit)
*/

module cla_32bit(a,b,s,cin,cout);
	input 	cin;
	input	[31:0]a,b;
	output	[31:0]s;
	output  cout;
	wire [7:0] c;
	
          cla_4bit G0(a[3:0],  b[3:0]  ,s[3:0]  ,cin, c[0]);
	  cla_4bit G1(a[7:4],  b[7:4]  ,s[7:4]  ,c[0],c[1]);
	  cla_4bit G2(a[11:8], b[11:8] ,s[11:8] ,c[1],c[2]);
  	  cla_4bit G3(a[15:12],b[15:12],s[15:12],c[2],c[3]);
	  cla_4bit G4(a[19:16],b[19:16],s[19:16],c[3],c[4]);
	  cla_4bit G5(a[23:20],b[23:20],s[23:20],c[4],c[5]);
	  cla_4bit G6(a[27:24],b[27:24],s[27:24],c[5],c[6]);
	  cla_4bit G7(a[31:28],b[31:28],s[31:28],c[6],c[7]);

	assign cout = c[7];

endmodule


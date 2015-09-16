/*
	Author : Fauzan Akbar Sahri
	Carry Lookahead Adder 4 bit
*/
module cla_4bit(a,b,s,cin,cout);
	input 	cin;
	input 	[3:0] a,b;
	output [3:0] s;
	output 	cout;

	wire	[3:0] p;	//carry propagate
	wire	[3:0] g;	//carry generate
	wire	[4:0] c;	//intermediete carry

	assign p[3:0] = a[3:0]^b[3:0];
	assign g[3:0] = a[3:0]&b[3:0];

	assign c[0] = cin; 
	assign c[1] = g[0]|(p[0]&c[0]); 
	assign c[2] = g[1]|(p[1]&g[0])|(p[1]&p[0]&c[0]);
	assign c[3] = g[2]|(p[2]&g[1])|(p[2]&p[1]&g[0])|(p[2]&p[1]&p[0]&c[0]);
	assign c[4] = g[3]|(p[3]&g[2])|(p[3]&p[2]&g[1])|(p[3]&p[2]&p[1]&g[0])|(p[3]&p[2]&p[1]&p[0]&c[0]);
	
	assign s[3:0] = p[3:0]^c[3:0];
	assign cout	= c[4];
endmodule


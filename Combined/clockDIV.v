`define OFF		2'd0
`define HIGH	2'd1
`define LOW		2'd2

module clockDIV
(
	input		enable,
	input		reset,
	input		clock,
	output reg	newClock
);

	// Divide 50 MHz clock to 200 kHz = 250 : 1
	// Each state will change every 250/2 = 125 clock cycles
	// 124 = 7'b‭111 1100‬

	reg	[6:0]counter;
	reg	[1:0]	state,
				nextState;
	
	/** nextState handling **/
	always @(reset or state or counter)
	begin
		if(reset)
			nextState <= `OFF;
		else
		begin
			case(state)
				`OFF :		nextState <= `HIGH;
				`HIGH:		nextState <= (counter >= 7'd124)? `LOW  : state;
				`LOW :		nextState <= (counter >= 7'd124)? `HIGH : state;
				default:	nextState <= `OFF;
			endcase
		end
	end
	
	/** state handling **/
	always @(posedge clock)
	begin
		if(enable)
			state <= nextState;
	end

	/** Counter handling **/
	always @(posedge clock)
	begin
		if(reset || (nextState != state))
			counter <= 7'd0;
		else if(enable)
		begin
			counter <= counter + 7'd1;
		end
	end
	
	/** Output handling **/
	always @(state)
	begin
		case(state)
			`HIGH:		newClock <= 1'b1;
			`LOW:		newClock <= 1'b0;
			default:	newClock <= 1'b0;
		endcase
	end
	
endmodule 
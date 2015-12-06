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

	// Divide 24 MHz clock to 200 kHz = 120 : 1
	// Each state will change every 120/2 = 60 clock cycles
	// 59 = 6'b11 1011

	reg	[5:0]counter;
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
				`HIGH:		nextState <= (counter >= 6'd59)? `LOW  : state;
				`LOW :		nextState <= (counter >= 6'd59)? `HIGH : state;
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
			counter <= 6'd0;
		else if(enable)
		begin
			counter <= counter + 6'd1;
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
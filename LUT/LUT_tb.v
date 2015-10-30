`timescale 1ns/1ns
module LUT_tb(theta);

    reg      clock;
    reg [7:0]code_x1,
             code_x2,
             code_y1,
             code_y2;
    output [8:0]theta;

    LUT_toplevel top
    (
        .clock   (clock),
        .code_x1 (code_x1),
        .code_x2 (code_x2),
        .code_y1 (code_y1),
        .code_y2 (code_y2),
        .theta   (theta)
    );

    initial begin
        clock = 1'b1;
        code_x1 = 8'd255;
        code_x2 = 8'd255;
        code_y1 = 8'd255;
        code_y2 = 8'd255;

        #3
        code_x1 = 8'd86;
        code_y2 = 8'd0;

        #50
        code_x1 = 8'd86;
        code_y2 = 8'd1;

        #50
        code_x1 = 8'd86;
        code_y2 = 8'd3;

        #50
        code_x1 = 8'd86;
        code_y2 = 8'd4;

        #50
        code_x1 = 8'd86;
        code_y2 = 8'd6;

        #50
        code_x1 = 8'd86;
        code_y2 = 8'd7;

        #50
        code_x1 = 8'd86;
        code_y2 = 8'd9;

        #50
        code_x1 = 8'd86;
        code_y2 = 8'd10;

        #50
        code_x1 = 8'd86;
        code_y2 = 8'd12;

        #50
        code_x1 = 8'd85;
        code_y2 = 8'd13;

        #50
        code_x1 = 8'd85;
        code_y2 = 8'd15;

        #50
        code_x1 = 8'd85;
        code_y2 = 8'd16;

        #50
        code_x1 = 8'd85;
        code_y2 = 8'd18;

        #50
        code_x1 = 8'd84;
        code_y2 = 8'd19;

        #50
        code_x1 = 8'd84;
        code_y2 = 8'd21;

        #50
        code_x1 = 8'd83;
        code_y2 = 8'd22;

        #50
        code_x1 = 8'd83;
        code_y2 = 8'd23;

        #50
        code_x1 = 8'd83;
        code_y2 = 8'd25;

        #50
        code_x1 = 8'd82;
        code_y2 = 8'd26;

        #50
        code_x1 = 8'd82;
        code_y2 = 8'd28;

        #50
        code_x1 = 8'd81;
        code_y2 = 8'd29;

        #50
        code_x1 = 8'd81;
        code_y2 = 8'd31;

        #50
        code_x1 = 8'd80;
        code_y2 = 8'd32;

        #50
        code_x1 = 8'd80;
        code_y2 = 8'd33;

        #50
        code_x1 = 8'd79;
        code_y2 = 8'd35;

        #50
        code_x1 = 8'd78;
        code_y2 = 8'd36;

        #50
        code_x1 = 8'd78;
        code_y2 = 8'd38;

        #50
        code_x1 = 8'd77;
        code_y2 = 8'd39;

        #50
        code_x1 = 8'd76;
        code_y2 = 8'd40;

        #50
        code_x1 = 8'd76;
        code_y2 = 8'd42;

        #50
        code_x1 = 8'd75;
        code_y2 = 8'd43;

        #50
        code_x1 = 8'd74;
        code_y2 = 8'd44;

        #50
        code_x1 = 8'd73;
        code_y2 = 8'd46;

        #50
        code_x1 = 8'd72;
        code_y2 = 8'd47;

        #50
        code_x1 = 8'd72;
        code_y2 = 8'd48;

        #50
        code_x1 = 8'd71;
        code_y2 = 8'd49;

        #50
        code_x1 = 8'd70;
        code_y2 = 8'd51;

        #50
        code_x1 = 8'd69;
        code_y2 = 8'd52;

        #50
        code_x1 = 8'd68;
        code_y2 = 8'd53;

        #50
        code_x1 = 8'd67;
        code_y2 = 8'd54;

        #50
        code_x1 = 8'd66;
        code_y2 = 8'd55;

        #50
        code_x1 = 8'd65;
        code_y2 = 8'd57;

        #50
        code_x1 = 8'd64;
        code_y2 = 8'd58;

        #50
        code_x1 = 8'd63;
        code_y2 = 8'd59;

        #50
        code_x1 = 8'd62;
        code_y2 = 8'd60;

        #50
        code_x1 = 8'd61;
        code_y2 = 8'd61;

        #50
        code_x1 = 8'd60;
        code_y2 = 8'd62;

        #50
        code_x1 = 8'd59;
        code_y2 = 8'd63;

        #50
        code_x1 = 8'd58;
        code_y2 = 8'd64;

        #50
        code_x1 = 8'd57;
        code_y2 = 8'd65;

        #50
        code_x1 = 8'd55;
        code_y2 = 8'd66;

        #50
        code_x1 = 8'd54;
        code_y2 = 8'd67;

        #50
        code_x1 = 8'd53;
        code_y2 = 8'd68;

        #50
        code_x1 = 8'd52;
        code_y2 = 8'd69;

        #50
        code_x1 = 8'd51;
        code_y2 = 8'd70;

        #50
        code_x1 = 8'd49;
        code_y2 = 8'd71;

        #50
        code_x1 = 8'd48;
        code_y2 = 8'd72;

        #50
        code_x1 = 8'd47;
        code_y2 = 8'd72;

        #50
        code_x1 = 8'd46;
        code_y2 = 8'd73;

        #50
        code_x1 = 8'd44;
        code_y2 = 8'd74;

        #50
        code_x1 = 8'd43;
        code_y2 = 8'd75;

        #50
        code_x1 = 8'd42;
        code_y2 = 8'd76;

        #50
        code_x1 = 8'd40;
        code_y2 = 8'd76;

        #50
        code_x1 = 8'd39;
        code_y2 = 8'd77;

        #50
        code_x1 = 8'd38;
        code_y2 = 8'd78;

        #50
        code_x1 = 8'd36;
        code_y2 = 8'd78;

        #50
        code_x1 = 8'd35;
        code_y2 = 8'd79;

        #50
        code_x1 = 8'd33;
        code_y2 = 8'd80;

        #50
        code_x1 = 8'd32;
        code_y2 = 8'd80;

        #50
        code_x1 = 8'd31;
        code_y2 = 8'd81;

        #50
        code_x1 = 8'd29;
        code_y2 = 8'd81;

        #50
        code_x1 = 8'd28;
        code_y2 = 8'd82;

        #50
        code_x1 = 8'd26;
        code_y2 = 8'd82;

        #50
        code_x1 = 8'd25;
        code_y2 = 8'd83;

        #50
        code_x1 = 8'd23;
        code_y2 = 8'd83;

        #50
        code_x1 = 8'd22;
        code_y2 = 8'd83;

        #50
        code_x1 = 8'd21;
        code_y2 = 8'd84;

        #50
        code_x1 = 8'd19;
        code_y2 = 8'd84;

        #50
        code_x1 = 8'd18;
        code_y2 = 8'd85;

        #50
        code_x1 = 8'd16;
        code_y2 = 8'd85;

        #50
        code_x1 = 8'd15;
        code_y2 = 8'd85;

        #50
        code_x1 = 8'd13;
        code_y2 = 8'd85;

        #50
        code_x1 = 8'd12;
        code_y2 = 8'd86;

        #50
        code_x1 = 8'd10;
        code_y2 = 8'd86;

        #50
        code_x1 = 8'd9;
        code_y2 = 8'd86;

        #50
        code_x1 = 8'd7;
        code_y2 = 8'd86;

        #50
        code_x1 = 8'd6;
        code_y2 = 8'd86;

        #50
        code_x1 = 8'd4;
        code_y2 = 8'd86;

        #50
        code_x1 = 8'd3;
        code_y2 = 8'd86;

        #50
        code_x1 = 8'd1;
        code_y2 = 8'd86;

        #50
        code_x1 = 8'd255;
        code_y1 = 8'd255;
        code_x2 = 8'd0;
        code_y2 = 8'd86;

        #50
        code_x2 = 8'd1;
        code_y2 = 8'd86;

        #50
        code_x2 = 8'd3;
        code_y2 = 8'd86;

        #50
        code_x2 = 8'd4;
        code_y2 = 8'd86;

        #50
        code_x2 = 8'd6;
        code_y2 = 8'd86;

        #50
        code_x2 = 8'd7;
        code_y2 = 8'd86;

        #50
        code_x2 = 8'd9;
        code_y2 = 8'd86;

        #50
        code_x2 = 8'd10;
        code_y2 = 8'd86;

        #50
        code_x2 = 8'd12;
        code_y2 = 8'd86;

        #50
        code_x2 = 8'd13;
        code_y2 = 8'd85;

        #50
        code_x2 = 8'd15;
        code_y2 = 8'd85;

        #50
        code_x2 = 8'd16;
        code_y2 = 8'd85;

        #50
        code_x2 = 8'd18;
        code_y2 = 8'd85;

        #50
        code_x2 = 8'd19;
        code_y2 = 8'd84;

        #50
        code_x2 = 8'd21;
        code_y2 = 8'd84;

        #50
        code_x2 = 8'd22;
        code_y2 = 8'd83;

        #50
        code_x2 = 8'd23;
        code_y2 = 8'd83;

        #50
        code_x2 = 8'd25;
        code_y2 = 8'd83;

        #50
        code_x2 = 8'd26;
        code_y2 = 8'd82;

        #50
        code_x2 = 8'd28;
        code_y2 = 8'd82;

        #50
        code_x2 = 8'd29;
        code_y2 = 8'd81;

        #50
        code_x2 = 8'd31;
        code_y2 = 8'd81;

        #50
        code_x2 = 8'd32;
        code_y2 = 8'd80;

        #50
        code_x2 = 8'd33;
        code_y2 = 8'd80;

        #50
        code_x2 = 8'd35;
        code_y2 = 8'd79;

        #50
        code_x2 = 8'd36;
        code_y2 = 8'd78;

        #50
        code_x2 = 8'd38;
        code_y2 = 8'd78;

        #50
        code_x2 = 8'd39;
        code_y2 = 8'd77;

        #50
        code_x2 = 8'd40;
        code_y2 = 8'd76;

        #50
        code_x2 = 8'd42;
        code_y2 = 8'd76;

        #50
        code_x2 = 8'd43;
        code_y2 = 8'd75;

        #50
        code_x2 = 8'd44;
        code_y2 = 8'd74;

        #50
        code_x2 = 8'd46;
        code_y2 = 8'd73;

        #50
        code_x2 = 8'd47;
        code_y2 = 8'd72;

        #50
        code_x2 = 8'd48;
        code_y2 = 8'd72;

        #50
        code_x2 = 8'd49;
        code_y2 = 8'd71;

        #50
        code_x2 = 8'd51;
        code_y2 = 8'd70;

        #50
        code_x2 = 8'd52;
        code_y2 = 8'd69;

        #50
        code_x2 = 8'd53;
        code_y2 = 8'd68;

        #50
        code_x2 = 8'd54;
        code_y2 = 8'd67;

        #50
        code_x2 = 8'd55;
        code_y2 = 8'd66;

        #50
        code_x2 = 8'd57;
        code_y2 = 8'd65;

        #50
        code_x2 = 8'd58;
        code_y2 = 8'd64;

        #50
        code_x2 = 8'd59;
        code_y2 = 8'd63;

        #50
        code_x2 = 8'd60;
        code_y2 = 8'd62;

        #50
        code_x2 = 8'd61;
        code_y2 = 8'd61;

        #50
        code_x2 = 8'd62;
        code_y2 = 8'd60;

        #50
        code_x2 = 8'd63;
        code_y2 = 8'd59;

        #50
        code_x2 = 8'd64;
        code_y2 = 8'd58;

        #50
        code_x2 = 8'd65;
        code_y2 = 8'd57;

        #50
        code_x2 = 8'd66;
        code_y2 = 8'd55;

        #50
        code_x2 = 8'd67;
        code_y2 = 8'd54;

        #50
        code_x2 = 8'd68;
        code_y2 = 8'd53;

        #50
        code_x2 = 8'd69;
        code_y2 = 8'd52;

        #50
        code_x2 = 8'd70;
        code_y2 = 8'd51;

        #50
        code_x2 = 8'd71;
        code_y2 = 8'd49;

        #50
        code_x2 = 8'd72;
        code_y2 = 8'd48;

        #50
        code_x2 = 8'd72;
        code_y2 = 8'd47;

        #50
        code_x2 = 8'd73;
        code_y2 = 8'd46;

        #50
        code_x2 = 8'd74;
        code_y2 = 8'd44;

        #50
        code_x2 = 8'd75;
        code_y2 = 8'd43;

        #50
        code_x2 = 8'd76;
        code_y2 = 8'd42;

        #50
        code_x2 = 8'd76;
        code_y2 = 8'd40;

        #50
        code_x2 = 8'd77;
        code_y2 = 8'd39;

        #50
        code_x2 = 8'd78;
        code_y2 = 8'd38;

        #50
        code_x2 = 8'd78;
        code_y2 = 8'd36;

        #50
        code_x2 = 8'd79;
        code_y2 = 8'd35;

        #50
        code_x2 = 8'd80;
        code_y2 = 8'd33;

        #50
        code_x2 = 8'd80;
        code_y2 = 8'd32;

        #50
        code_x2 = 8'd81;
        code_y2 = 8'd31;

        #50
        code_x2 = 8'd81;
        code_y2 = 8'd29;

        #50
        code_x2 = 8'd82;
        code_y2 = 8'd28;

        #50
        code_x2 = 8'd82;
        code_y2 = 8'd26;

        #50
        code_x2 = 8'd83;
        code_y2 = 8'd25;

        #50
        code_x2 = 8'd83;
        code_y2 = 8'd23;

        #50
        code_x2 = 8'd83;
        code_y2 = 8'd22;

        #50
        code_x2 = 8'd84;
        code_y2 = 8'd21;

        #50
        code_x2 = 8'd84;
        code_y2 = 8'd19;

        #50
        code_x2 = 8'd85;
        code_y2 = 8'd18;

        #50
        code_x2 = 8'd85;
        code_y2 = 8'd16;

        #50
        code_x2 = 8'd85;
        code_y2 = 8'd15;

        #50
        code_x2 = 8'd85;
        code_y2 = 8'd13;

        #50
        code_x2 = 8'd86;
        code_y2 = 8'd12;

        #50
        code_x2 = 8'd86;
        code_y2 = 8'd10;

        #50
        code_x2 = 8'd86;
        code_y2 = 8'd9;

        #50
        code_x2 = 8'd86;
        code_y2 = 8'd7;

        #50
        code_x2 = 8'd86;
        code_y2 = 8'd6;

        #50
        code_x2 = 8'd86;
        code_y2 = 8'd4;

        #50
        code_x2 = 8'd86;
        code_y2 = 8'd3;

        #50
        code_x2 = 8'd86;
        code_y2 = 8'd1;

        #50
        code_x1 = 8'd255;
        code_y2 = 8'd255;
        code_x2 = 8'd86;
        code_y1 = 8'd0;

        #50
        code_x2 = 8'd86;
        code_y1 = 8'd1;

        #50
        code_x2 = 8'd86;
        code_y1 = 8'd3;

        #50
        code_x2 = 8'd86;
        code_y1 = 8'd4;

        #50
        code_x2 = 8'd86;
        code_y1 = 8'd6;

        #50
        code_x2 = 8'd86;
        code_y1 = 8'd7;

        #50
        code_x2 = 8'd86;
        code_y1 = 8'd9;

        #50
        code_x2 = 8'd86;
        code_y1 = 8'd10;

        #50
        code_x2 = 8'd86;
        code_y1 = 8'd12;

        #50
        code_x2 = 8'd85;
        code_y1 = 8'd13;

        #50
        code_x2 = 8'd85;
        code_y1 = 8'd15;

        #50
        code_x2 = 8'd85;
        code_y1 = 8'd16;

        #50
        code_x2 = 8'd85;
        code_y1 = 8'd18;

        #50
        code_x2 = 8'd84;
        code_y1 = 8'd19;

        #50
        code_x2 = 8'd84;
        code_y1 = 8'd21;

        #50
        code_x2 = 8'd83;
        code_y1 = 8'd22;

        #50
        code_x2 = 8'd83;
        code_y1 = 8'd23;

        #50
        code_x2 = 8'd83;
        code_y1 = 8'd25;

        #50
        code_x2 = 8'd82;
        code_y1 = 8'd26;

        #50
        code_x2 = 8'd82;
        code_y1 = 8'd28;

        #50
        code_x2 = 8'd81;
        code_y1 = 8'd29;

        #50
        code_x2 = 8'd81;
        code_y1 = 8'd31;

        #50
        code_x2 = 8'd80;
        code_y1 = 8'd32;

        #50
        code_x2 = 8'd80;
        code_y1 = 8'd33;

        #50
        code_x2 = 8'd79;
        code_y1 = 8'd35;

        #50
        code_x2 = 8'd78;
        code_y1 = 8'd36;

        #50
        code_x2 = 8'd78;
        code_y1 = 8'd38;

        #50
        code_x2 = 8'd77;
        code_y1 = 8'd39;

        #50
        code_x2 = 8'd76;
        code_y1 = 8'd40;

        #50
        code_x2 = 8'd76;
        code_y1 = 8'd42;

        #50
        code_x2 = 8'd75;
        code_y1 = 8'd43;

        #50
        code_x2 = 8'd74;
        code_y1 = 8'd44;

        #50
        code_x2 = 8'd73;
        code_y1 = 8'd46;

        #50
        code_x2 = 8'd72;
        code_y1 = 8'd47;

        #50
        code_x2 = 8'd72;
        code_y1 = 8'd48;

        #50
        code_x2 = 8'd71;
        code_y1 = 8'd49;

        #50
        code_x2 = 8'd70;
        code_y1 = 8'd51;

        #50
        code_x2 = 8'd69;
        code_y1 = 8'd52;

        #50
        code_x2 = 8'd68;
        code_y1 = 8'd53;

        #50
        code_x2 = 8'd67;
        code_y1 = 8'd54;

        #50
        code_x2 = 8'd66;
        code_y1 = 8'd55;

        #50
        code_x2 = 8'd65;
        code_y1 = 8'd57;

        #50
        code_x2 = 8'd64;
        code_y1 = 8'd58;

        #50
        code_x2 = 8'd63;
        code_y1 = 8'd59;

        #50
        code_x2 = 8'd62;
        code_y1 = 8'd60;

        #50
        code_x2 = 8'd61;
        code_y1 = 8'd61;

        #50
        code_x2 = 8'd60;
        code_y1 = 8'd62;

        #50
        code_x2 = 8'd59;
        code_y1 = 8'd63;

        #50
        code_x2 = 8'd58;
        code_y1 = 8'd64;

        #50
        code_x2 = 8'd57;
        code_y1 = 8'd65;

        #50
        code_x2 = 8'd55;
        code_y1 = 8'd66;

        #50
        code_x2 = 8'd54;
        code_y1 = 8'd67;

        #50
        code_x2 = 8'd53;
        code_y1 = 8'd68;

        #50
        code_x2 = 8'd52;
        code_y1 = 8'd69;

        #50
        code_x2 = 8'd51;
        code_y1 = 8'd70;

        #50
        code_x2 = 8'd49;
        code_y1 = 8'd71;

        #50
        code_x2 = 8'd48;
        code_y1 = 8'd72;

        #50
        code_x2 = 8'd47;
        code_y1 = 8'd72;

        #50
        code_x2 = 8'd46;
        code_y1 = 8'd73;

        #50
        code_x2 = 8'd44;
        code_y1 = 8'd74;

        #50
        code_x2 = 8'd43;
        code_y1 = 8'd75;

        #50
        code_x2 = 8'd42;
        code_y1 = 8'd76;

        #50
        code_x2 = 8'd40;
        code_y1 = 8'd76;

        #50
        code_x2 = 8'd39;
        code_y1 = 8'd77;

        #50
        code_x2 = 8'd38;
        code_y1 = 8'd78;

        #50
        code_x2 = 8'd36;
        code_y1 = 8'd78;

        #50
        code_x2 = 8'd35;
        code_y1 = 8'd79;

        #50
        code_x2 = 8'd33;
        code_y1 = 8'd80;

        #50
        code_x2 = 8'd32;
        code_y1 = 8'd80;

        #50
        code_x2 = 8'd31;
        code_y1 = 8'd81;

        #50
        code_x2 = 8'd29;
        code_y1 = 8'd81;

        #50
        code_x2 = 8'd28;
        code_y1 = 8'd82;

        #50
        code_x2 = 8'd26;
        code_y1 = 8'd82;

        #50
        code_x2 = 8'd25;
        code_y1 = 8'd83;

        #50
        code_x2 = 8'd23;
        code_y1 = 8'd83;

        #50
        code_x2 = 8'd22;
        code_y1 = 8'd83;

        #50
        code_x2 = 8'd21;
        code_y1 = 8'd84;

        #50
        code_x2 = 8'd19;
        code_y1 = 8'd84;

        #50
        code_x2 = 8'd18;
        code_y1 = 8'd85;

        #50
        code_x2 = 8'd16;
        code_y1 = 8'd85;

        #50
        code_x2 = 8'd15;
        code_y1 = 8'd85;

        #50
        code_x2 = 8'd13;
        code_y1 = 8'd85;

        #50
        code_x2 = 8'd12;
        code_y1 = 8'd86;

        #50
        code_x2 = 8'd10;
        code_y1 = 8'd86;

        #50
        code_x2 = 8'd9;
        code_y1 = 8'd86;

        #50
        code_x2 = 8'd7;
        code_y1 = 8'd86;

        #50
        code_x2 = 8'd6;
        code_y1 = 8'd86;

        #50
        code_x2 = 8'd4;
        code_y1 = 8'd86;

        #50
        code_x2 = 8'd3;
        code_y1 = 8'd86;

        #50
        code_x2 = 8'd1;
        code_y1 = 8'd86;

        #50
        code_x2 = 8'd255;
        code_y2 = 8'd255;
        code_x1 = 8'd0;
        code_y1 = 8'd86;

        #50
        code_x1 = 8'd1;
        code_y1 = 8'd86;

        #50
        code_x1 = 8'd3;
        code_y1 = 8'd86;

        #50
        code_x1 = 8'd4;
        code_y1 = 8'd86;

        #50
        code_x1 = 8'd6;
        code_y1 = 8'd86;

        #50
        code_x1 = 8'd7;
        code_y1 = 8'd86;

        #50
        code_x1 = 8'd9;
        code_y1 = 8'd86;

        #50
        code_x1 = 8'd10;
        code_y1 = 8'd86;

        #50
        code_x1 = 8'd12;
        code_y1 = 8'd86;

        #50
        code_x1 = 8'd13;
        code_y1 = 8'd85;

        #50
        code_x1 = 8'd15;
        code_y1 = 8'd85;

        #50
        code_x1 = 8'd16;
        code_y1 = 8'd85;

        #50
        code_x1 = 8'd18;
        code_y1 = 8'd85;

        #50
        code_x1 = 8'd19;
        code_y1 = 8'd84;

        #50
        code_x1 = 8'd21;
        code_y1 = 8'd84;

        #50
        code_x1 = 8'd22;
        code_y1 = 8'd83;

        #50
        code_x1 = 8'd23;
        code_y1 = 8'd83;

        #50
        code_x1 = 8'd25;
        code_y1 = 8'd83;

        #50
        code_x1 = 8'd26;
        code_y1 = 8'd82;

        #50
        code_x1 = 8'd28;
        code_y1 = 8'd82;

        #50
        code_x1 = 8'd29;
        code_y1 = 8'd81;

        #50
        code_x1 = 8'd31;
        code_y1 = 8'd81;

        #50
        code_x1 = 8'd32;
        code_y1 = 8'd80;

        #50
        code_x1 = 8'd33;
        code_y1 = 8'd80;

        #50
        code_x1 = 8'd35;
        code_y1 = 8'd79;

        #50
        code_x1 = 8'd36;
        code_y1 = 8'd78;

        #50
        code_x1 = 8'd38;
        code_y1 = 8'd78;

        #50
        code_x1 = 8'd39;
        code_y1 = 8'd77;

        #50
        code_x1 = 8'd40;
        code_y1 = 8'd76;

        #50
        code_x1 = 8'd42;
        code_y1 = 8'd76;

        #50
        code_x1 = 8'd43;
        code_y1 = 8'd75;

        #50
        code_x1 = 8'd44;
        code_y1 = 8'd74;

        #50
        code_x1 = 8'd46;
        code_y1 = 8'd73;

        #50
        code_x1 = 8'd47;
        code_y1 = 8'd72;

        #50
        code_x1 = 8'd48;
        code_y1 = 8'd72;

        #50
        code_x1 = 8'd49;
        code_y1 = 8'd71;

        #50
        code_x1 = 8'd51;
        code_y1 = 8'd70;

        #50
        code_x1 = 8'd52;
        code_y1 = 8'd69;

        #50
        code_x1 = 8'd53;
        code_y1 = 8'd68;

        #50
        code_x1 = 8'd54;
        code_y1 = 8'd67;

        #50
        code_x1 = 8'd55;
        code_y1 = 8'd66;

        #50
        code_x1 = 8'd57;
        code_y1 = 8'd65;

        #50
        code_x1 = 8'd58;
        code_y1 = 8'd64;

        #50
        code_x1 = 8'd59;
        code_y1 = 8'd63;

        #50
        code_x1 = 8'd60;
        code_y1 = 8'd62;

        #50
        code_x1 = 8'd61;
        code_y1 = 8'd61;

        #50
        code_x1 = 8'd62;
        code_y1 = 8'd60;

        #50
        code_x1 = 8'd63;
        code_y1 = 8'd59;

        #50
        code_x1 = 8'd64;
        code_y1 = 8'd58;

        #50
        code_x1 = 8'd65;
        code_y1 = 8'd57;

        #50
        code_x1 = 8'd66;
        code_y1 = 8'd55;

        #50
        code_x1 = 8'd67;
        code_y1 = 8'd54;

        #50
        code_x1 = 8'd68;
        code_y1 = 8'd53;

        #50
        code_x1 = 8'd69;
        code_y1 = 8'd52;

        #50
        code_x1 = 8'd70;
        code_y1 = 8'd51;

        #50
        code_x1 = 8'd71;
        code_y1 = 8'd49;

        #50
        code_x1 = 8'd72;
        code_y1 = 8'd48;

        #50
        code_x1 = 8'd72;
        code_y1 = 8'd47;

        #50
        code_x1 = 8'd73;
        code_y1 = 8'd46;

        #50
        code_x1 = 8'd74;
        code_y1 = 8'd44;

        #50
        code_x1 = 8'd75;
        code_y1 = 8'd43;

        #50
        code_x1 = 8'd76;
        code_y1 = 8'd42;

        #50
        code_x1 = 8'd76;
        code_y1 = 8'd40;

        #50
        code_x1 = 8'd77;
        code_y1 = 8'd39;

        #50
        code_x1 = 8'd78;
        code_y1 = 8'd38;

        #50
        code_x1 = 8'd78;
        code_y1 = 8'd36;

        #50
        code_x1 = 8'd79;
        code_y1 = 8'd35;

        #50
        code_x1 = 8'd80;
        code_y1 = 8'd33;

        #50
        code_x1 = 8'd80;
        code_y1 = 8'd32;

        #50
        code_x1 = 8'd81;
        code_y1 = 8'd31;

        #50
        code_x1 = 8'd81;
        code_y1 = 8'd29;

        #50
        code_x1 = 8'd82;
        code_y1 = 8'd28;

        #50
        code_x1 = 8'd82;
        code_y1 = 8'd26;

        #50
        code_x1 = 8'd83;
        code_y1 = 8'd25;

        #50
        code_x1 = 8'd83;
        code_y1 = 8'd23;

        #50
        code_x1 = 8'd83;
        code_y1 = 8'd22;

        #50
        code_x1 = 8'd84;
        code_y1 = 8'd21;

        #50
        code_x1 = 8'd84;
        code_y1 = 8'd19;

        #50
        code_x1 = 8'd85;
        code_y1 = 8'd18;

        #50
        code_x1 = 8'd85;
        code_y1 = 8'd16;

        #50
        code_x1 = 8'd85;
        code_y1 = 8'd15;

        #50
        code_x1 = 8'd85;
        code_y1 = 8'd13;

        #50
        code_x1 = 8'd86;
        code_y1 = 8'd12;

        #50
        code_x1 = 8'd86;
        code_y1 = 8'd10;

        #50
        code_x1 = 8'd86;
        code_y1 = 8'd9;

        #50
        code_x1 = 8'd86;
        code_y1 = 8'd7;

        #50
        code_x1 = 8'd86;
        code_y1 = 8'd6;

        #50
        code_x1 = 8'd86;
        code_y1 = 8'd4;

        #50
        code_x1 = 8'd86;
        code_y1 = 8'd3;

        #50
        code_x1 = 8'd86;
        code_y1 = 8'd1;
    end

    always
        #5  clock =  ! clock;

endmodule 
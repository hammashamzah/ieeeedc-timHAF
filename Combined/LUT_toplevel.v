module LUT_toplevel(clock,code_x1,code_x2,code_y1,code_y2,theta);
    input       clock;
    input  [6:0]code_x1,
                code_x2,
                code_y1,
                code_y2;
    output [8:0]theta;
    
    // code_x1: x1 telat terhadap x2, lebih dekat ke x2
    // code_x2: x2 telat terhadap x1, lebih dekat ke x1
    // code_y1: y1 telat terhadap y2, lebih dekat ke y2
    // code_y2: y2 telat terhadap y1, lebih dekat ke y1
    //
    //     y1
    //
    // x1      x2
    //
    //     y2
    
    
    reg [8:0]theta;
    reg [6:0]thetaout_x1,
             thetaout_x2,
             thetaout_y1,
             thetaout_y2;
    wire [6:0]theta_x1,
              theta_x2,
              theta_y1,
              theta_y2;
    wire inrange_x1,
         inrange_x2,
         inrange_y1,
         inrange_y2;
    wire [8:0]temp_x1,
              temp_x2,
              temp_y1,
              temp_y2,
              temp_x12,
              temp_x22,
              temp_y12,
              temp_y22;
    
    LUT LUT_x1
    (
        .clock(clock),
        .code(code_x1),
        .theta(theta_x1)
    );
    
    LUT LUT_x2
    (
        .clock(clock),
        .code(code_x2),
        .theta(theta_x2)
    );
    
    LUT LUT_y1
    (
        .clock(clock),
        .code(code_y1),
        .theta(theta_y1)
    );
    
    LUT LUT_y2
    (
        .clock(clock),
        .code(code_y2),
        .theta(theta_y2)
    );
    
    always @(posedge clock)
    begin
        thetaout_x1 <= theta_x1;
        thetaout_x2 <= theta_x2;
        thetaout_y1 <= theta_y1;
        thetaout_y2 <= theta_y2;
    end
    
    assign inrange_x1 = (thetaout_x1 >= 7'd40) && (thetaout_x1 <= 7'd90),
           inrange_x2 = (thetaout_x2 >= 7'd40) && (thetaout_x2 <= 7'd90),
           inrange_y1 = (thetaout_y1 >= 7'd40) && (thetaout_y1 <= 7'd90),
           inrange_y2 = (thetaout_y2 >= 7'd40) && (thetaout_y2 <= 7'd90);
           
    assign temp_x1  = {2'b0,thetaout_x1},
           temp_x12 = 9'd360 - {2'b0,thetaout_x1},
           temp_x2  = 9'd180 - {2'b0,thetaout_x2},
           temp_x22 = 9'd180 + {2'b0,thetaout_x2},
           temp_y1  = 9'd270 + {2'b0,thetaout_y1},
           temp_y12 = 9'd270 - {2'b0,thetaout_y1},
           temp_y2  =  9'd90 - {2'b0,thetaout_y2},
           temp_y22 =  9'd90 + {2'b0,thetaout_y2};
    
    always @(inrange_x1 or inrange_x2 or inrange_y1 or inrange_y2
          or thetaout_x1 or thetaout_x2 or thetaout_y1 or thetaout_y2
			 or temp_x1 or temp_x2 or temp_y1 or temp_y2
			 or temp_x12 or temp_x22 or temp_y12 or temp_y22
			 or code_x1 or code_x2 or code_y1 or code_y2)
    begin
        if(inrange_x1)
        begin
            if(thetaout_y2 > 7'd0)
                theta = temp_x1 + 9'd1;
            else
                theta = temp_x12 + 9'd1;
        end
        else if(inrange_x2)
        begin
            if(thetaout_y2 > 7'd0)
                theta = temp_x2 + 9'd1;
            else
                theta = temp_x22  + 9'd1;
        end
        else if(inrange_y1)
        begin
            if(thetaout_x1 > 7'd0)
                theta = temp_y1  + 9'd1;
            else
                theta = temp_y12  + 9'd1;
        end
        else if(inrange_y2)
        begin
            if(thetaout_x1 > 7'd0)
                theta = temp_y2  + 9'd1;
            else
                theta = temp_y22  + 9'd1;
        end /*
        else if(code_x1 != 7'b1111111 && code_x2 == 7'b1111111 && code_y1 == 7'b1111111 && code_y2 == 7'b1111111)
        begin
            theta = 9'd0;
        end
        else if(code_y1 == 7'b1111111 && code_y2 != 7'b1111111 && code_x1 == 7'b1111111 && code_x2 == 7'b1111111)
        begin
            theta = 9'd90;
        end
        else if(code_x1 == 7'b1111111 && code_x2 != 7'b1111111 && code_y1 == 7'b1111111 && code_y2 == 7'b1111111)
        begin
          theta = 9'd180;
        end
        else if(code_y1 != 7'b1111111 && code_y2 == 7'b1111111 && code_x1 == 7'b1111111 && code_x2 == 7'b1111111)
        begin
          theta = 9'd270;
        end */
		else
			theta = 9'b111111111;
            
    end
    
endmodule 

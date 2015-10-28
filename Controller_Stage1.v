module Controller_Stage1( clk,
                          rst,
                          write_FIFO1,
                          write_FIFO2,
                          write_FIFO3,
                          write_FIFO4,
                          read_FIFO1,
                          read_FIFO2,
                          read_FIFO3,
                          read_FIFO4,
                          sel_demux1,
                          sel_demux2,
                          sel_demux3,
                          done
                        );

  input clk;
  input rst;
  output reg write_FIFO1;
  output reg write_FIFO2;
  output reg write_FIFO3;
  output reg write_FIFO4;
  output reg read_FIFO1;
  output reg read_FIFO2;
  output reg read_FIFO3;
  output reg read_FIFO4;
  output reg sel_demux1;
  output reg sel_demux2;
  output reg sel_demux3;
  output reg done;
  
  reg [2:0] CurrentState;
  reg [2:0] NextState;
  reg [6:0] count;
  reg en_count;
  
  
  `define IDLE  3'd0
  `define FIFO1 3'd1
  `define FIFO2 3'd2
  `define FIFO3 3'd3
  `define FIFO4 3'd4
  `define DONE  3'd5
  
  always@(posedge clk)
  begin
    if(rst)
      CurrentState <= `IDLE;
    else
      CurrentState <= NextState;
  end

  always@(posedge clk)
	begin
		if(rst)
			count <= 7'b0;
		else if(en_count)
			count <= count + 1'b1;
		else 
			count <= count;
	end
  
  always@(*)
  begin
    case(CurrentState)
      `IDLE :
        begin
          en_count    <= 1'b1;
          write_FIFO1 <= 1'b1;
          read_FIFO1  <= 1'b0;
          NextState   <= `FIFO1;
        end
      `FIFO1 :
       begin
          if(count == 7'd87)
          begin
            write_FIFO1 <= 1'b1;
            read_FIFO1  <= 1'b1;
            write_FIFO2 <= 1'b1;
            sel_demux1  <= 1'b1;
            count       <= 7'd0;
            NextState   <= `FIFO2;
          end
      end
      `FIFO2 :
        begin
          if(count == 7'd87)
          begin
            write_FIFO1 <= 1'b1;
            read_FIFO1  <= 1'b1;
            write_FIFO2 <= 1'b1;
            read_FIFO2  <= 1'b1;
            write_FIFO3 <= 1'b1;
            sel_demux1  <= 1'b1;
            sel_demux2  <= 1'b1;
            count       <= 7'd0;
            NextState   <= `FIFO3;
          end
        end
      `FIFO3 :
        begin
          if(count == 7'd87)
          begin  
            write_FIFO1 <= 1'b1;
            read_FIFO1  <= 1'b1;
            write_FIFO2 <= 1'b1;
            read_FIFO2  <= 1'b1;
            write_FIFO3 <= 1'b1;
            read_FIFO3  <= 1'b1;
            write_FIFO4 <= 1'b1;
            sel_demux1  <= 1'b1;
            sel_demux2  <= 1'b1;
            sel_demux3  <= 1'b1;
            count       <= 7'd0;
            NextState   <= `FIFO4;
          end
        end
      `FIFO4 :
        begin
          if(count == 7'd87)
          begin  
            count       <= 7'd0;
            read_FIFO4  <= 1'b1;
            NextState   <= `DONE;
          end
        end
      `DONE :
        done <= 1;
      default :
        NextState <= NextState;
    endcase
  end
endmodule

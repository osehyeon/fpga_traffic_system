module motor_counter(clk, rst_n, state, mcount);
    input clk;
    input rst_n;
    input state;
   
    output [2:0] mcount;
    reg [2:0] mcount;
    
    always @(posedge clk or negedge rst_n) begin

      if(rst_n == 0) begin
          mcount <= 0;
      end
      else begin
        if (state == 0)  begin
					if (mcount < 7) begin 
						mcount <= mcount + 1;
					end else begin 
						mcount <= 0;
					end
 
			  end else begin
					if (mcount < 7) begin 
						if (mcount < 5) begin
							mcount <= mcount + 1;
						end else begin 
							mcount <= mcount; 
						end 
					end
					else begin 
						mcount <= 0;
					end
				end
			end 
    end
				
endmodule

module sig_counter(clk, rst_n, en, ones, state);
    input clk;
    input rst_n;
    input en;
    
    output [3:0] ones;
    output state;
    
    reg [3:0] ones;
    reg state;
    
    always @(posedge clk or negedge rst_n) begin

      if(rst_n == 0) begin
          state <= 0;
          ones <= 0;
      end
      
      else begin
        if (en == 1)  begin
            state <= 1;
        end 
        else begin
          if (state == 1) begin
              if(ones < 15) begin
                ones <= ones + 1;
              end
              else begin
                ones <= 0;
                state <= 0;
              end
          end
        end
      end 
  end

endmodule

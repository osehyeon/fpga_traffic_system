module frq_div125(clk, rst_n, clk_out);
 
    input clk;
    input rst_n;
    output clk_out;
    
    reg [7:0] cnt;
    
    assign clk_out = (cnt < 62) ? 0 : 1;
    
    always @(posedge clk or negedge rst_n) begin
        if(rst_n == 0) begin
            cnt <= 0;
        end
        else begin
            if (cnt == 124) 
                cnt <= 0;
            else cnt <= cnt + 1;
        end
    end
    
endmodule
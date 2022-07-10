module frq_div4(clk, rst_n, clk_out);

    input clk;
    input rst_n;
    output clk_out;
 
    reg cnt;
    reg clk_out;
    
    always @(posedge clk or negedge rst_n) begin
        if (rst_n == 0) begin
            cnt <= 0;
            clk_out <= 0;
        end else begin
            if (cnt == 1) begin
                cnt <= 0;
                clk_out <= ~clk_out;
            end else 
                cnt <= cnt + 1;
        end
    end   
    
endmodule

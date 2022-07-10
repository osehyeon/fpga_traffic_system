module tb_top();

    parameter PERIOD = 10; 
        
    reg clk; 
    reg rst_n;
    reg en; 
    
    wire state;
    wire [4:0] led;
    wire [7:0] motor_led;
    wire [6:0] gfnd;
    wire fnd_sel;
    wire OUT_A;
    wire OUT_B;
    wire OUT_nA;
    wire OUT_nB;
    
    always # (PERIOD/2) clk = ~clk ;
   
    always # (PERIOD*11000000) en = ~en;
    
    always # (PERIOD*111111) en = 0; 
    
    signal SIGNAL(.clk(clk), .rst_n(rst_n), .en(en), .state(state), .led(led) , .motor_led(motor_led), .gfnd(gfnd), 
                  .fnd_sel(fnd_sel), .OUT_A(OUT_A), .OUT_B(OUT_B), .OUT_nA(OUT_nA), .OUT_nB(OUT_nB));
                  
    initial begin
        clk = 0;
        rst_n = 0;
        en = 0; 
        
        #10 rst_n = 1;
        
    end 
        
       
endmodule

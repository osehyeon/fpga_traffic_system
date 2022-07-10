module sig_led(clk, rst_n, ones, led);
    input clk;
    input rst_n;
    input [3:0] ones; //ones랑 연결
        
    output [4:0] led;
    reg [4:0] led;
    
    //앞 3 bit 차량 뒤 2bit 사람
    //초 주 파      파 빨
    //0 0 1 0 1

    always @(clk) begin
        if(rst_n == 0) begin 
            led = 5'b00000;
        end else begin 
            case(ones)
                4'd0 : led <= 5'b00101;
                4'd1 : led <= 5'b01001;
                4'd2 : led <= 5'b01001;
                4'd3 : led <= 5'b01001;
                4'd4 : led <= 5'b01001;
                4'd5 : led <= 5'b01001;
                4'd6 : led <= 5'b10010;
                4'd7 : led <= 5'b10010;
                4'd8 : led <= 5'b10010;
                4'd9 : led <= 5'b10010;
                4'd10: led <= 5'b10010;
                4'd11: led <= 5'b10010;
                4'd12: led <= 5'b10010;
                4'd13: led <= 5'b10010;
                4'd14: led <= 5'b10010;
                default : led <= 5'b00101;
            endcase
        end
    end
    
endmodule

module motor_state_led(rst_n, mcount, motor_led);
    
    input rst_n;
    input [2:0] mcount;
    
    output [7:0] motor_led;
    reg [7:0] motor_led;

    always @(mcount) begin 
        if(rst_n == 0 ) begin
            motor_led = 8'b00000000;
        end else begin
            case(mcount)
                3'd0 : motor_led = 8'b00000001;
                3'd1 : motor_led = 8'b00000010;
                3'd2 : motor_led = 8'b00000100;
                3'd3 : motor_led = 8'b00001000;
                3'd4 : motor_led = 8'b00010000;
                3'd5 : motor_led = 8'b00100000;
                3'd6 : motor_led = 8'b01000000;
                3'd7 : motor_led = 8'b10000000;
                default : motor_led = 8'b00000000;
            endcase
        end
    end

endmodule

module fnd_decoder(clk_1KHz,fnd_sel, gfnd, ones, state);
    input clk_1KHz;
    input [3:0] ones;
    input state;
    
    output fnd_sel;
    output [6:0] gfnd;
    
    reg [6:0] gfnd;
    
    assign fnd_sel = clk_1KHz;
    
    always @(fnd_sel or state) begin
        if(fnd_sel == 0) begin
            if(state == 1) begin
                    case(ones)
                        4'd15 : gfnd <= 7'b0111111; //0
                        4'd14 : gfnd <= 7'b0000110; //1
                        4'd13 : gfnd <= 7'b1011011; //2
                        4'd12 : gfnd <= 7'b1001111; //3
                        4'd11 : gfnd <= 7'b1100110; //4
                        4'd10 : gfnd <= 7'b1101101; //5
                        4'd9 : gfnd <= 7'b1111101; //6
                        4'd8 : gfnd <= 7'b0100111; //7
                        4'd7 : gfnd <= 7'b1111111; //8
                        4'd6 : gfnd <= 7'b1101111; //9
                        default : gfnd <= 7'b0000000;
                    endcase
             end
         end
        else begin
        gfnd <= 7'b0000000;
        end
        
    end
endmodule

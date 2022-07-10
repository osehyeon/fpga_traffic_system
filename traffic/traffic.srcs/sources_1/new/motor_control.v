module motor_control(clk_250Hz, rst_n, state, mcount, OUT_A, OUT_B, OUT_nA, OUT_nB);

    input clk_250Hz;
    input rst_n;
    input state;
    input [2:0] mcount;   
   
   
    output OUT_A;
    output OUT_B;
    output OUT_nA;
    output OUT_nB;

    reg [1:0] m_cnt;
    reg [3:0] m_pulse;

		always @(posedge clk_250Hz or negedge rst_n) begin
        if (rst_n == 0) begin
            m_cnt <= 0;
        end
        else begin
            m_cnt <= m_cnt + 1;
        end
    end


	always @ (m_cnt) begin
        if(rst_n == 0) begin
            m_pulse <= 4'b1001;
        end
        else begin
            if(state == 0) begin
                case(m_cnt)
                    2'b00 : m_pulse <= 4'b0011;
                    2'b01 : m_pulse <= 4'b0110;
                    2'b10 : m_pulse <= 4'b1100;
                    2'b11 : m_pulse <= 4'b1001;
                endcase
            end else begin
                //if(mcount < 3'd7) begin
                    if(mcount < 3'd5) begin 
                        case(m_cnt)
                            2'b00 : m_pulse <= 4'b0011;
                            2'b01 : m_pulse <= 4'b0110;
                            2'b10 : m_pulse <= 4'b1100;
                            2'b11 : m_pulse <= 4'b1001;
                        endcase                  
                    end else begin
                        m_pulse <= 4'b1001;
                    end
               // end
            end
        end
    end
    
    assign OUT_A = m_pulse[0];
    assign OUT_B = m_pulse[1];
    assign OUT_nA = m_pulse[2];
    assign OUT_nB = m_pulse[3];

endmodule


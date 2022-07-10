module signal(clk, rst_n, en, state, led , motor_led, gfnd, fnd_sel, OUT_A, OUT_B, OUT_nA, OUT_nB);

    input clk;
    input rst_n;
    input en;
    
    output [4:0] led;
    output state;
    output [7:0] motor_led;

    output [6:0] gfnd;
    output fnd_sel;		

    output OUT_A;
    output OUT_B;
    output OUT_nA;
    output OUT_nB;
		
    wire clk_1MHz;
    wire clk_1KHz;
    wire clk_1Hz;
    wire clk_250Hz;
    wire [3:0] ones;
    wire [2:0] mcount;
    
    frq_div125 DIV_125(.clk(clk),.rst_n(rst_n), .clk_out(clk_1MHz));
    frq_div1000 DIV_1000_1(.clk(clk_1MHz), .rst_n(rst_n), .clk_out(clk_1KHz));
    frq_div1000 DIV_1000_2(.clk(clk_1KHz), .rst_n(rst_n),.clk_out(clk_1Hz));
    frq_div4 DIV_4(.clk(clk_1KHz), .rst_n(rst_n), .clk_out(clk_250Hz));
    sig_counter SIG_FSM_COUNTER(.clk(clk_1Hz), .rst_n(rst_n),.en(en),.ones(ones),.state(state)); // clk 변경 
    sig_led SIG_LED_DECODER (.clk(clk_1KHz), .rst_n(rst_n), .ones(ones), .led(led));
    fnd_decoder FND_DECODER(.clk_1KHz(clk_1KHz), .fnd_sel(fnd_sel), .gfnd(gfnd), .ones(ones), .state(state));
    motor_counter MOTOR_COUNTER (.clk(clk_1Hz) ,.rst_n(rst_n), .state(state), .mcount(mcount)); // clk 변경 
    motor_control MOTOR_PULSE(.clk_250Hz(clk_250Hz), .rst_n(rst_n), .state(state), .mcount(mcount), .OUT_A(OUT_A), .OUT_B(OUT_B), .OUT_nA(OUT_nA), .OUT_nB(OUT_nB)); // clk 변경 
    motor_state_led MOTOR_LED_DECODER (.rst_n(rst_n), .mcount(mcount), .motor_led(motor_led));
endmodule

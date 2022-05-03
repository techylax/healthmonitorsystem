`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/26/2022 10:26:25 PM
// Design Name: 
// Module Name: reaction_timer
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module reaction_timer( input logic clk ,start , enter, rst, 
                       output logic led_r ,led_g , led_b, rs_en ,
                       output logic [3:0] d0,d1,d2,d3); 

// Logic Instantiations 

//Random Wait 
logic start_rwait, rwait_done; 

//Delay Counter 
logic start_wait5 , wait5_done ; 

//RGB PWM 
logic [2:0] color_r, color_g, color_b ; 

//Time Count 
logic time_clr, time_en, time_late ; 


//Creating Instance of Reaction FSM 

reaction_fsm FSM(.clk(clk),.rst(rst),.start(start),.enter(enter), .rwait_done(rwait_done), .wait5_done(wait5_done),
 .time_late(time_late) , .start_rwait(start_rwait),.start_wait5(start_wait5), .rs_en(rs_en), .time_clr(time_clr),.time_en(time_en),
 .color_r(color_r) , .color_g(color_g), .color_b(color_b)); 
 
// Creating Instance of Random Wait

random_wait RW(.clk(clk), .rst(rst), .start_wait(start_rwait), .rwait_done(rwait_done)); 

// Creating Instance of Delay Counter 

delay_counter_react DELAY (.clk(clk),.rst(rst),.start_wait5(start_wait5), .wait5_done(wait5_done)); 

//Creating Instance of Time Count 

time_count TIME_COUNT(.clk(clk), .time_clr(time_clr),.rst(rst),.time_en(time_en),.time_late(time_late), .d0(d0), .d1(d1), .d2(d2), .d3(d3)); 

// Creating an instance of rgb_pwm 

rgb_pwm RGB(.clk(clk),.rst(rst), .color_r(color_r), .color_g(color_g) , .color_b(color_b), .rgb_r(led_r) , .rgb_g(led_g), .rgb_b(led_b));

 
 
endmodule

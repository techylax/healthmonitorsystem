`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/26/2022 10:16:34 PM
// Design Name: 
// Module Name: health_moniter_top_level
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


module health_moniter_top_level( input logic clk100Mhz, rst, start, enter, pulse_in, mode,
                       output logic [7:0] an_l ,
                       output logic [6:0] segs_l ,
                       output logic dp_l, led_r, led_b, led_g);

 // Logic Declarations
   logic clk ;
   logic clk_60, clk_go ; // Coming in from a second clock divider

   logic rs_en ;

 //Outputs for the Pulse Moniter
   logic [3:0] d0,d1,d2,d3 ;

 //Ouputs for the Reaction Timer
   logic [3:0] r0,r1,r2,r3 ;

  // Single Pulse and Debounce of Start Button
   logic start_debounce , start_go ;

  //Single Pulse and Debounce of Enter Button
   logic enter_debounce, enter_go ;

   // Single Pulse and Debounce of Reset Button
   logic rst_debounce , rst_go ;

   // Holds the concatination output of the Pulse Monitor & Reaction Timer
   logic [15:0] pulsemon_out , reaction_out ,q;


// Clock Divider for the clk signal of the entire circuit
clkdiv #(.DIVFREQ(1000)) U_CLKDIV(.clk(clk100Mhz), .reset(1'b0), .sclk(clk));

//Clock Divider for simulated pulse
//clkdiv #(.DIVFREQ(60)) CLOCK_60(.clk(clk100Mhz), .reset(1'b0), .sclk(clk_60));

// Debouncer and Single Pulser  START
   debounce START_1(.clk(clk), .pb(start) , .pb_debounced(start_debounce));

   single_pulser START_2(.clk(clk), .din(start_debounce), .d_pulse(start_go));


// Debouncer and Single Pulser ENTER
   debounce ENTER_1(.clk(clk), .pb(enter) , .pb_debounced(enter_debounce));

    single_pulser ENTER_2(.clk(clk), .din(enter_debounce), .d_pulse(enter_go));

 // Debouncer and Single Puler RESET
  debounce RST_1(.clk(clk), .pb(rst) , .pb_debounced(rst_debounce));

  single_pulser RST_2(.clk(clk), .din(rst_debounce), .d_pulse(rst_go));



//Creating an instance of Pulse Monitor

pulse_moniter PULSE (.clk(clk),.rst(rst_go), .pulse_in(pulse_in), .pd0(d0), .pd1(d1), .pd2(d2), .pd3(d3));

//pulse_moniter PULSE (.clk(clk),.rst(rst_go), .pulse_in(clk_60), .pd0(d0), .pd1(d1), .pd2(d2), .pd3(d3));

//Creating an instance of Reaction Timer
reaction_timer REACT(.clk(clk), .rst(rst_go), .start(start_go), .enter(enter_go), .led_r(led_r), .led_g(led_g), .led_b(led_b),.rs_en(rs_en),.d0(r0),.d1(r1),.d2(r2),.d3(r3)) ;

// Concatinating the Outputs of the Pulse Monitor and the Reaction Timer

assign pulsemon_out = {d3,d2,d1,d0} ;
assign reaction_out = {r3,r2,r1,r0};


// Creating an instance of 16 bit 2 to 1 Multiplixer
mux_16bit_2to1 SEL(.mode(mode) , .reaction_timer(reaction_out), .pulse_mon(pulsemon_out) , .q(q)) ;


//Showing decimal 127  will c
sevenseg_control_hm U_C_5(.clk(clk), .rst(rst),.mode(mode),.rs_en(rs_en),.d0(q[3:0]), .d1(q[7:4]), .d2(q[11:8]), .d3(q[15:12]), .d4(4'd0), .d5(4'd0),.d6(4'd0), .d7(4'd0),.segs_l(segs_l), .an_l(an_l), .dp_l(dp_l));


endmodule
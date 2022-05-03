`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/26/2022 10:29:01 PM
// Design Name: 
// Module Name: time_count
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


module time_count( input logic clk, time_clr, time_en,rst,
					output logic time_late, 
					output logic [3:0] d0,d1,d2,d3); 


// Logic Instantiations 
logic c0,c1,c2,c3 ; // Used for the carry of our counters
//logic [3:0] d; // The output of the millisecond conunter which is not used
logic q ; 

dec_counter milisecond(.clk(clk),.rst(time_clr),.enb(time_en),.q(d0), .carry(c0)) ;
dec_counter hundreths(.clk(clk), .rst(time_clr),.enb(c0) ,.q(d1), .carry(c1)) ;
dec_counter tenths(.clk(clk), .rst(time_clr), .enb(c1),.q(d2), .carry(c2)) ;
dec_counter ones(.clk(clk), .rst(time_clr), .enb(c2),.q(d3), .carry(c3)) ;


//assign time_late = (c3==1) ; 
   
ten_sec_count tensec_count(.clk(clk) , .enb(time_en),.rst(rst), .time_late(time_late));
 
endmodule 
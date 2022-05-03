`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/26/2022 10:27:23 PM
// Design Name: 
// Module Name: sevenseg_control_hm
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


module sevenseg_control_hm(input logic clk, rst, mode, rs_en,
                           input logic  [3:0] d0,d1,d2,d3,d4,d5,d6,d7,
                           output logic [6:0]segs_l,
                           output logic [7:0] an_l, 
                            output logic dp_l ); 

logic [3:0]  data ; 
logic [2:0] count ;  

count_3bit U_C_1 (.clk(clk),.rst(rst),.q(count)) ;

dec_3_8_hm U_C_2 (.a(count),.mode(mode),.rs_en(rs_en),.an_l); 

   

mux_4bit_8to1 U_C_3 (.sel(count),.d0,.d1,.d2,.d3,.d4,.d5,.d6,.d7,.y(data)) ; 

sevenseg_hex U_C_4(.data(data), .segs_l); 

 
//Setting the decimal point 
assign dp_l = ~(an_l == 8'b11110111);
endmodule
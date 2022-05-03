`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/08/2018 10:10:03 AM
// Design Name: 
// Module Name: pulse_adder_tb
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


module pulse_adder_tb; 
logic [3:0] q1,q2,q3 ; 
logic [3:0] sum ; 

pulse_adder ADDER (.q1,.q2 , .q3 , .sum ) ; 
       

initial begin 

q1 = 4'd5 ; 
q2 = 4'd5 ; 
q3 = 4'd5 ; 


end
endmodule



`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/26/2022 10:43:02 PM
// Design Name: 
// Module Name: single_pulser
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

module single_pulser(input logic clk, din, 
                     output logic d_pulse);
   logic dq1, dq2;

   always_ff @(posedge clk)
     begin
	   dq1 <= din;
	   dq2 <= dq1;
     end

   assign d_pulse = dq1 & ~dq2;
endmodule // single_pulser

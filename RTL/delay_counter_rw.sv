`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/26/2022 10:15:31 PM
// Design Name: 
// Module Name: delay_counter_rw
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


module delay_counter_rw( input logic clk, rst, 
	                     output logic [13:0] q_delay);


always_ff @(posedge clk)
	if (rst) q_delay<= 0;
	
	else q_delay<= q_delay + 1;
	
endmodule // delay counter 
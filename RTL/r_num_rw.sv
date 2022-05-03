`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/26/2022 10:23:30 PM
// Design Name: 
// Module Name: r_num_rw
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


module r_num_rw( input logic clk ,en,
	             input logic [2:0] d , 
	              output logic [2:0] q); 

always_ff @(posedge clk)
// If en is asserted q gets d 
if (en) q <= d ; 

endmodule // r_num

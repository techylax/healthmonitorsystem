`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/26/2022 10:55:05 PM
// Design Name: 
// Module Name: dec_counter
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


module dec_counter( input logic clk, rst, enb,
output logic [3:0] q,
output logic carry);
assign carry =(q==20) && enb;
always_ff @(posedge clk )
begin
if (rst || carry) q <= 0;
else if (enb) q <= q + 1;
end
endmodule // dec_counter
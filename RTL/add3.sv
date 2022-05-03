`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/26/2022 10:51:48 PM
// Design Name: 
// Module Name: add3
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


module add3( input logic[3:0] a, output logic [3:0] y);
always_comb
begin
if (a[3:0] >= 4'b0101) y[3:0] = a[3:0] + 4'b0011;
else if (a[3:0] <= 4'b0101) y[3:0] = a[3:0];
end
endmodule
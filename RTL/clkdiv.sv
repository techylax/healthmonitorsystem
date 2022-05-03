`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/26/2022 10:48:35 PM
// Design Name: 
// Module Name: clkdiv
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


module clkdiv(input logic clk, input logic reset, output logic sclk);
   parameter DIVFREQ = 100;  // desired frequency in Hz (change as needed)
   parameter DIVBITS = 26;   // enough bits to divide 100MHz down to 1 Hz
   parameter CLKFREQ = 100_000_000;
   parameter DIVAMT = (CLKFREQ / DIVFREQ) / 2;

   logic [DIVBITS-1:0] q;

   always_ff @(posedge clk)
     if (reset) begin
	    q <= 0;
	    sclk <= 0;
     end
     else if (q == DIVAMT-1) begin
	    q <= 0;
	    sclk <= ~sclk;
     end
     else q <= q + 1;
endmodule // clkdiv

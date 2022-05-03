`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/08/2018 09:38:58 AM
// Design Name: 
// Module Name: pulse_counter_tb
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


module pulse_counter_tb;
	logic enb, clk, clr;
	logic [3:0]q;

	pulse_counter DUV (.clk, .clr, .enb, .q);

	
parameter CLK_PD = 10;
        
always begin
   clk = 1'b0; #(CLK_PD/2);
   clk = 1'b1; #(CLK_PD/2);
  end


initial begin
	enb = 0;
	clr = 1;

@(posedge clk) #1;
 enb = 1 ; 
  clr = 0; 

//Testing to see if the pulse counter resets when clr signal is recieved
// Regardless of if the enb is 1; 	
repeat(5) @(posedge clk) #1;
    enb = 1;
    clr = 1;

repeat(5) @(posedge clk) #1;
	enb =  0 ;
	clr = 1;
	

$stop;
end
endmodule


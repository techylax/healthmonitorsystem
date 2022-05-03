`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/08/2018 10:28:15 AM
// Design Name: 
// Module Name: pcount_registers_tb
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


module pcount_registers_tb;

logic clk, iden;
logic [3:0] q_in;
logic [3:0] c1, c2, c3;

pcount_registers PULSECOUNT (.clk, .iden, .q_in, .c1, .c2, .c3);

parameter CLK_PD = 10;

 always begin
     clk = 1'b0; #(CLK_PD/2);
     clk = 1'b1; #(CLK_PD/2);
  end

initial begin
    iden = 0; 
    q_in = 4'd0; 

@(posedge clk) #1;
    iden = 1 ; 
    q_in = 4'd5; 

@(posedge clk) #1;
    iden = 1 ; 
    q_in = 4'd6; 

@(posedge clk) #1;
    iden = 1 ; 
    q_in = 4'd9; 

@(posedge clk) #1;
    iden = 1 ; 
 

 $stop; 
   end 
   endmodule 









  

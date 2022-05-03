`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/26/2022 10:19:37 PM
// Design Name: 
// Module Name: pcount_registers
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


module pcount_registers( input logic clk, iden,rst,
                        input logic [3:0] q_in, 
                        output logic[3:0] c1 ,c2,c3 );
                       

//Instantiating Registers

p_register R3 (.clk,.iden,.rst(rst), .d(q_in),.q(c3)) ; 
p_register R2 (.clk,.iden,.rst(rst), .d(c3),.q(c2)) ;
p_register R1 (.clk,.iden,.rst(rst), .d(c2),.q(c1)) ;
 
 
                       
                    

   
endmodule
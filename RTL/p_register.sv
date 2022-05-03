`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/26/2022 10:18:44 PM
// Design Name: 
// Module Name: p_register
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


module p_register( input logic clk , iden, rst,
                   input logic [3:0] d , 
                   output logic [3:0] q  ); 
                  
 // Iden will tell the register to store its inputed value from the previos register 
 
  always_ff @(posedge clk) 
 
    begin 
   
    if (iden) 
        q <= d ;  
    
    else if (rst)
         q <= 0;
    
    end                 
                 

   
endmodule
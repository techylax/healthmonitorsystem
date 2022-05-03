`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/26/2022 10:20:26 PM
// Design Name: 
// Module Name: pulse_adder
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


module pulse_adder( input logic [3:0] q1, q2, q3, 
                     output logic [5:0] sum);
   
 // Wires for adder
 
 logic [4:0] firstadd; 
 logic [5:0] secondadd; 
                    
always_comb
       begin
       firstadd = 0; 
       secondadd = 0;
         //Computing first add 
         firstadd = q1 + q2 ; 
         //Computing second add
         secondadd = firstadd + q3 ; 
       end 
          
  //assign sum = secondadd ; 
  assign sum = secondadd; 
 
  
endmodule
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/26/2022 10:13:25 PM
// Design Name: 
// Module Name: delay_counter
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


module delay_counter( input logic clk, 
                      output logic delay_done); 
                      
   // Logic Instantiation                   
  logic [12:0] q; 
      
  always_ff @(posedge clk) 
       begin 
            // Increment the counter by 1 
              q <= q +1;          
           if (q == 13'd5000) 
             begin
             // 5 sec counter is up and delay done is asserted to be 1
                 delay_done <= 1 ;
                 q <= 0;
             end
        
         else 
            delay_done <= 0;
             
       end
     
endmodule
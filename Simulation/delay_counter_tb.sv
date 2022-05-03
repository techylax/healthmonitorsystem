`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/01/2018 09:27:02 AM
// Design Name: 
// Module Name: delay_counter_tb
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


module delay_counter_tb; 

logic clk , delay_done, rst ; 
logic [2:0] q; 

// instantiate DUV
   delay_counter DUV ( .clk, .delay_done, .q,.rst );
   
   //    generate clock
   parameter CLK_PD = 10;
   
   always begin
      clk = 1'b0; #(CLK_PD/2);
      clk = 1'b1; #(CLK_PD/2);
   end

// sequence input stimulus
    
      initial begin
         rst = 1;  // reset the counter
         @(posedge clk) #1; // wait till first clock edge + 1
         rst = 0;
         #(CLK_PD*10); // let it run for 10 clock cycles
         rst = 1'b1;  //reset it again
         @(posedge clk) #1;  // wait till next clock edge + 1
         rst = 1'b0;
         @(posedge clk) #1;  // wait till next clock edge + 1
         $stop;
      end
      
      
      
endmodule // delay_counter tb 
   


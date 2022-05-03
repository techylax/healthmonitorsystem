`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/26/2022 10:24:13 PM
// Design Name: 
// Module Name: random_wait
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


module random_wait( input logic clk, rst, start_wait, 
                    output logic rwait_done );
  
  //Logic Instantiations 
       logic [2:0] random_num;
       logic [2:0] add;
       logic [13:0] wait_cycles;
       logic [13:0] d_count;
       logic [3:0] add_output; 
                    
    // Instantiating Count 3 Module 
                    
        count_3bit COUNT3 (.clk(clk), .rst(rst), .q(random_num)) ; 
                    
   // Instantiating FlipFLop for Random Num capture 
                    
         r_num_rw RANDOM_NUM (.clk(clk) , .en(start_wait),.d(random_num), .q(add));
                    
    // Creatting instance of Delay Counter 
                    
       delay_counter_rw DC (.clk(clk), .rst(start_wait), .q_delay(d_count)); 
                    
     // Computing the addition 
                    
        assign add_output = add + 1 ;
                    
      // Computing the multiplication by performing a shift           
      //Shifting to the left 10 which is representative of multiplying  by 1024 
        assign wait_cycles =  add_output << 10 ;  
                    
    // Checking if the values of wait cycle equals the output of the delay counter so we can assert wait_done true 
                    
         assign rwait_done = (wait_cycles == d_count) ; 
 
   
endmodule
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/26/2022 10:14:37 PM
// Design Name: 
// Module Name: delay_counter_react
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

module delay_counter_react( input logic clk, rst, start_wait5,
						     output logic wait5_done); 

// Logic Instantiation 
logic [12:0] q ; 

always_ff @ (posedge clk) 
begin
 
    if(rst) 
        q <= 0 ; 
   	   
	else if  (start_wait5 && q == 13'd5000)														
		begin 
	// Want to set wait done equal to one 
		wait5_done <= 1 ; 
		q <= 0 ; 
		end 
	else if (start_wait5 && q != 13'd5000)
	   begin 
	       q <= q+1 ; 
	       wait5_done <= 0 ; 
	   end
end 
 
endmodule
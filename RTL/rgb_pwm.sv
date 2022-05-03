`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/26/2022 10:32:02 PM
// Design Name: 
// Module Name: rgb_pwm
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

module rgb_pwm (input logic clk, rst,
                input logic [2:0] color_r , color_g, color_b,
                output logic rgb_r, rgb_g, rgb_b);
// Logic Instantiations
                logic [3:0] q;

always_ff @(posedge clk)
            if(rst) q <= 0;
            else q <= q + 1 ;
            
always_comb
begin

        if (q < color_r) rgb_r <= 1;
        else rgb_r <= 0 ;
        if (q < color_g) rgb_g <= 1;
        else rgb_g <= 0 ;
        if (q < color_b) rgb_b <= 1;
        else rgb_b <= 0 ;
end
endmodule
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/26/2022 10:17:22 PM
// Design Name: 
// Module Name: mux_16bit_2to1
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


module mux_16bit_2to1(input logic mode,
					  input logic [15:0] reaction_timer ,pulse_mon,
					  output logic [15:0] q ); 

always_comb 
	case(mode)
	// SW0 is off, so mode is reaction timer
		1'd0 : q = reaction_timer ; 
	// SW1 is on, so mode is pulse moniter 
		1'd1 : q = pulse_mon ; 


		default : q = 16'd0; 

	endcase 
endmodule
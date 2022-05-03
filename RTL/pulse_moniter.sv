`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/26/2022 10:22:33 PM
// Design Name: 
// Module Name: pulse_moniter
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


module pulse_moniter( input logic clk,rst, pulse_in ,
                    output logic [3:0] pd0, pd1, pd2, pd3); 
   
   //Logic Instantiations for  Module
   
    logic pulse_go; // Single Pulsed pulse in put 
    logic d_done; // Wire holding the output of the delay counter 
    
  //Wire for the register that will hold the beats 
  logic[3:0] q0, q1, q2 , p_counter ; 
  
  // Wires for Results for Adder 
   logic [5:0] adder_sum; 
  
  //Wire for BPM Convertion 
  logic [7:0] bpm_out;  
  
  //Wire for 15 sec counter 
  logic add_time ; 
  
  // pd3 is connected to 0 
  assign pd3 = 4'd0; 
  
   
      
 // Single Pulser for Pulse_In input 
 
  single_pulser S_PULSE(.clk(clk), .din(pulse_in), .d_pulse(pulse_go)) ; 
  
  //Creating an instance of delay counter 
  
  delay_counter DELAY (.clk(clk), .delay_done(d_done)); 
  
    // Creating an instance of pulse counter 
  
  pulse_counter PULSE (.clk(clk), .clr(d_done), .enb(pulse_go) , .q(p_counter)); 
  
  pcount_registers PCOUNT (.clk(clk),.iden(d_done), .rst(rst), .q_in(p_counter), .c1(q0) , .c2(q1), .c3(q2)) ; 
  
    
  // Instantiating the adder module to sum up the pulse 
    pulse_adder ADD (.q1(q0), .q2(q1),.q3(q2), .sum(adder_sum));
      
      
  // Converting to BPM
  convert_to_bpm BPM (.sum(adder_sum), .bpm(bpm_out)); 
  
  //Instanstantiate Binary_to_bcd module
  
  binary_to_bcd BTBCD (.b(bpm_out), .hundreds(pd2), .tens(pd1) , .ones(pd0)); 
  
   

endmodule
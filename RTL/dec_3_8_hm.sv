`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/26/2022 10:11:28 PM
// Design Name: 
// Module Name: dec_3_8_hm
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


module dec_3_8_hm( input logic [2:0] a, 
                   input mode, rs_en,
                   output logic [7:0] an_l); 

logic [7:0] an;

always_comb 

// If Mode is zero, we are in reaction timer 
if(~mode) 
    begin
    case (a)
           3'd0: an= 8'b00000001; 
           3'd1: an= 8'b00000010; 
           3'd2: an= 8'b00000100; 
           3'd3: an= 8'b00001000; 
           
           //3'd4: an= 8'b00010000; 
           //3'd5: an= 8'b00100000; 
           //3'd6: an= 8'b01000000; 
           //3'd7: an= 8'b10000000;

        default: an = 8'b00000000; 
    endcase 
       end 
else // Pulse Monitor 
    begin 
    case (a)
               3'd0: an= 8'b00000001; 
               3'd1: an= 8'b00000010; 
               3'd2: an= 8'b00000100; 
               // 3'd3: an= 8'b00001000; 
                       
                //3'd4: an= 8'b00010000; 
                //3'd5: an= 8'b00100000; 
                //3'd6: an= 8'b01000000; 
                //3'd7: an= 8'b10000000;
                default: an = 8'b00000000; 
     endcase 
    end
    
      // Since we only want the segments on when rs_en is on 
           assign an_l = (rs_en || mode) ? ~an : 8'b11111111 ;
     
endmodule
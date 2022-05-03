`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/26/2022 10:28:08 PM
// Design Name: 
// Module Name: ten_sec_count
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

module ten_sec_count( input clk, enb,rst,
					   output logic time_late); 

// Logic Instantiation 
logic [13:0] q ; 

always_ff @ (posedge clk) 
        begin 
	   
        if (~enb || rst) q <= 0;  // Serves as the reset for the counter 
	    else if (enb && q != 14'd9999)	
	       begin
	            q<= q + 1 ; 													
	           time_late <= 0; 
		    end
	   else if (enb && q == 14'd9999)
		  begin  
			time_late <= 1 ; 
			q <= 0 ;
		  end 
		

end 

endmodule 
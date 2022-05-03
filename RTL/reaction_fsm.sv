`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/26/2022 10:25:27 PM
// Design Name: 
// Module Name: reaction_fsm
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


module reaction_fsm( input logic clk,rst, start, enter , rwait_done, wait5_done, time_late,
					 output logic start_rwait, start_wait5, rs_en, time_clr, time_en,
					 output logic [2:0] color_r , color_g , color_b);


//States for the FSM 
 
 typedef enum logic [2:0]{ 
    IDLE= 3'b000, R_WAIT = 3'b001, EARLY = 3'b010, TIME = 3'b011, DISPLAY = 3'b100, LATE = 3'b101  
    }state_t ; 

 state_t state, next ; 

 always_ff @(posedge clk) 

 	if(rst) state <= IDLE ; 
 	else state <= next ; 

 	always_comb 
 		begin 

 			// Want all the led's to be turned off in the beginging 
 			color_r = 3'b000; 
 			color_g = 3'b000;
 			color_b = 3'b000; 

 			start_rwait = 0 ; 
 			start_wait5 = 0 ; 
 			time_clr = 0; 
 			rs_en = 0 ; 
 			time_en = 0; 

 			// We want to start in the IDLE state so that is the next state 
 			next = IDLE; 

 			// Starting the case statements for the states 

 			case(state) 

 				IDLE: 
 					begin 
 						color_r = 3'b000; 
 						color_g = 3'b001;
 						color_b = 3'b000;
 						rs_en = 0 ;
 						
 			// If the start button is pressed in the idle we want to intiate the random wait 
 					if(start)
 							begin 
 								start_rwait = 1 ; 
 								next = R_WAIT ; 
 							end 
 			//if the start button is not pressed, we must remain in the idle state 
 					else 
 						next = IDLE ;
 					end 

 				R_WAIT: 
 					begin 
 						// Want to clear the time when the start button  
 						time_clr = 1 ; 

 						// LEDS are off in Random Wait 
 						color_r = 3'b000; 
 						color_g = 3'b000;
 						color_b = 3'b000;
 						rs_en = 0 ; 

 						//If to check if Enter is pressed while the random wait isnt finished 
 						 if (enter && ~rwait_done)
 						 	// Go into the early state 
 						 	next = EARLY ; 
 						 // If enter is not pressed and ranom wait is not finished 
 						 else if (~enter && ~rwait_done) 
 						 	// Remain in the R_wait state 
 						 	next = R_WAIT ; 
 						 // If the random counter is finsihed, we want to enter into the time state 
 						 else if (rwait_done) 
 						 begin 
 						       time_en = 1 ;
 						 	   next = TIME ; 
 						 end 
 					end 

 				EARLY : 
 					begin 
 						// Turn on the RED light 
 							color_r = 3'b1; 
 							color_g = 3'b0;
 							color_b = 3'b0;

 						// Start the delay counter 
 						start_wait5 = 1 ; 

 						// After the delay counter is done, since we want the user to have to use the start button to intiate a new reaction sequence 
 						// We go back to the idle state 

 						if (~wait5_done)
 							next = EARLY;
 					   // If the 5 second timer is not done we want to remain in idle 
 					   else
 					      next = IDLE; 
 					    
 					end 

 				TIME: 
 					begin 
 						// Want to intiate the timer keeping track of the reaction time 
 						time_en = 1 ; 

 						// Turn on the White LED light 
 							color_r = 3'b001; 
 							color_g = 3'b001;
 							color_b = 3'b001;

 						if (enter && ~time_late)
 							begin 
 								time_en= 0; // Stop  the timer
 								next = DISPLAY ; 
 							end 

 						else if(~enter && ~time_late)
 							next = TIME ; 

 						else if (time_late) 
 						next = LATE ; 
 					end


 				DISPLAY: 
 					begin 

 						//Green LED remains on 
 							color_r = 3'b000; 
 							color_g = 3'b000;
 							color_b = 3'b000;

                    // Tells the seven seg to display the digits 
 						rs_en = 1 ; 
 						// If the start button is pressed we want to go to the R_Wait State 
 							if (start) 
 								begin
 									start_wait5 = 1 ; 
 									next = R_WAIT; 
 								end 
 							else 
 							// If start button is not pressed
 								next = DISPLAY ; 
 					end 

 				LATE: 
 					begin 

 						// Initiate our five second counter 
 						start_wait5 = 1 ;

 						//Yellow light must be on 
 							color_r = 3'b001; 
 							color_g = 3'b001;
 							color_b = 3'b000;

 						// Once the five second time period is up we want to return to the idle state 

 							if(~wait5_done) 
 								next = LATE ; 
 							else if (wait5_done)
 								next = IDLE ; 
 						end 

 					endcase 
 				end 
 			endmodule
 			
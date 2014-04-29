`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:07:08 04/24/2014 
// Design Name: 
// Module Name:    unsign_extend 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module unsign_extend(unsign_immediate,out
    );
	input [11:0] unsign_immediate;
	output [31:0] out;
	
	assign out = {20'b0,unsign_immediate};

endmodule

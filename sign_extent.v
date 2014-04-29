`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:03:15 04/24/2014 
// Design Name: 
// Module Name:    sign_extent 
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
module sign_extent(sign_immediate,out
    );
	input signed [23:0] sign_immediate;
	output [31:0] out;
	
	wire signed [25:0] sign_immediate_mul4;
	
	assign sign_immediate_mul4 = sign_immediate*4;
	
	assign out = sign_immediate_mul4[25]? ( {6'b111111,sign_immediate_mul4}):({6'b000000,sign_immediate_mul4} );

endmodule

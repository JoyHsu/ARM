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
	
	wire [31:0] sign_extend_immediate ;

	assign sign_extend_immediate = sign_immediate[23]? ( {8'b11111111,sign_immediate} ):( {8'b00000000,sign_immediate} );
	assign out = sign_extend_immediate << 2 ;
	
endmodule

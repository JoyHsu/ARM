`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:57:46 04/21/2014 
// Design Name: 
// Module Name:    ins_mem 
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
module ins_mem(pc, ins);

	input [31:0] pc;
	output [31:0] ins;
	
	parameter INS_MEM_SIZE = 32;
	
	reg [31:0] mem [INS_MEM_SIZE-1:0];

	//register
	assign ins = mem [ pc[31:2] ];

endmodule

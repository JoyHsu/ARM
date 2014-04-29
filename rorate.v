`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:40:56 04/24/2014 
// Design Name: 
// Module Name:    rorate 
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
module rorate(immediate,out
    );
	 input [11:0] immediate;
	 output [31:0] out;
	 
	 //wire
	 wire [5:0] rorate_num;
	 reg [31:0] out;
	 
	 
	 assign rorate_num = immediate[11:8]*2;
	 
	 always@(*)
	 begin
		case(rorate_num)
			5'd30:out = {22'b0,immediate[7:0],2'b0};
			5'd28:out = {20'b0,immediate[7:0],4'b0};
			5'd26:out = {18'b0,immediate[7:0],6'b0};
			5'd24:out = {16'b0,immediate[7:0],8'b0};
			5'd22:out = {14'b0,immediate[7:0],10'b0};
			5'd20:out = {12'b0,immediate[7:0],12'b0};
			5'd18:out = {10'b0,immediate[7:0],14'b0};
			5'd16:out = {8'b0,immediate[7:0],16'b0};
			5'd14:out = {6'b0,immediate[7:0],18'b0};
			5'd12:out = {4'b0,immediate[7:0],20'b0};
			5'd10:out = {2'b0,immediate[7:0],22'b0};
			5'd8:out = {immediate[7:0],24'b0};
			5'd6:out = {immediate[5:0],24'b0,immediate[7:6]};
			5'd4:out = {immediate[3:0],24'b0,immediate[7:4]};
			5'd2:out = {immediate[1:0],24'b0,immediate[7:2]};
			5'd0:out = {24'b0,immediate[7:0]};
			default:out = {24'b0,immediate[7:0]};
		endcase
	 end


endmodule

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:42:18 04/25/2014 
// Design Name: 
// Module Name:    shift 
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
module shift( reg_data , shift_type, shift_num, out
    );
	input [31:0] reg_data;
	input [1:0] shift_type;
	input [4:0] shift_num;
	output [31:0] out;
	
	//wire
	reg [31:0] unsign_out;
	reg signed [31:0] sign_out;
	
	assign out = (shift_type == 2'b10)? (sign_out):(unsign_out);
	
	always@(*)
	begin
		case(shift_type)
			2'b00:begin
						unsign_out = reg_data << shift_num;
						sign_out = reg_data << shift_num;
					end
			2'b01:begin
						unsign_out = reg_data >> shift_num;
						sign_out = reg_data >> shift_num;
					end
			2'b10:begin
						sign_out = reg_data >>> shift_num;
						unsign_out = reg_data ;
					end
			2'b11:begin
					sign_out = reg_data;
					case(shift_num)
							5'd0:unsign_out = reg_data;
							5'd1:unsign_out = {reg_data[0],reg_data[31:1]};
							5'd2:unsign_out = {reg_data[1:0],reg_data[31:2]};
							5'd3:unsign_out = {reg_data[2:0],reg_data[31:3]};
							5'd4:unsign_out = {reg_data[3:0],reg_data[31:4]};
							5'd5:unsign_out = {reg_data[4:0],reg_data[31:5]};
							5'd6:unsign_out = {reg_data[5:0],reg_data[31:6]};
							5'd7:unsign_out = {reg_data[6:0],reg_data[31:7]};
							5'd8:unsign_out = {reg_data[7:0],reg_data[31:8]};
							5'd9:unsign_out = {reg_data[8:0],reg_data[31:9]};
							5'd10:unsign_out = {reg_data[9:0],reg_data[31:10]};
							5'd11:unsign_out = {reg_data[10:0],reg_data[31:11]};
							5'd12:unsign_out = {reg_data[11:0],reg_data[31:12]};
							5'd13:unsign_out = {reg_data[12:0],reg_data[31:13]};
							5'd14:unsign_out = {reg_data[13:0],reg_data[31:14]};
							5'd15:unsign_out = {reg_data[14:0],reg_data[31:15]};
							5'd16:unsign_out = {reg_data[15:0],reg_data[31:16]};
							5'd17:unsign_out = {reg_data[16:0],reg_data[31:17]};
							5'd18:unsign_out = {reg_data[17:0],reg_data[31:18]};
							5'd19:unsign_out = {reg_data[18:0],reg_data[31:19]};
							5'd20:unsign_out = {reg_data[19:0],reg_data[31:20]};
							5'd21:unsign_out = {reg_data[20:0],reg_data[31:21]};
							5'd22:unsign_out = {reg_data[21:0],reg_data[31:22]};
							5'd23:unsign_out = {reg_data[22:0],reg_data[31:23]};
							5'd24:unsign_out = {reg_data[23:0],reg_data[31:24]};
							5'd25:unsign_out = {reg_data[24:0],reg_data[31:25]};
							5'd26:unsign_out = {reg_data[25:0],reg_data[31:26]};
							5'd27:unsign_out = {reg_data[26:0],reg_data[31:27]};
							5'd28:unsign_out = {reg_data[27:0],reg_data[31:28]};
							5'd29:unsign_out = {reg_data[28:0],reg_data[31:29]};
							5'd30:unsign_out = {reg_data[29:0],reg_data[31:30]};
							5'd31:unsign_out = {reg_data[30:0],reg_data[31]};
					endcase
					end
		endcase
	end
	
endmodule

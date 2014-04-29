`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:48:11 04/24/2014 
// Design Name: 
// Module Name:    ALU 
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
module alu(source_1,source_2,alu_op,nzcv,alu_out,c_in
    );

	input [31:0] source_1, source_2;
	input [3:0] alu_op;
	input c_in;
	
	output [3:0] nzcv;
	output [31:0] alu_out;
	
	wire n,z,v;
	
	assign nzcv[3]=n;
	assign nzcv[2]=z;
	assign nzcv[1]=c_unsign;
	assign nzcv[0]=v;
	
	assign n = alu_out[31];
	assign z = ~(|alu_out);
	assign v = c_sign^c_over;
	
	//wire
	reg c_unsign, c_sign, c_over;
	reg [31:0] alu_out, sign_alu_out;
	reg [32:0] two_comple_number; 
	
	always@(*)
	begin
		case(alu_op)
		4'b0000:begin
					two_comple_number = ~{ 1'b0,source_2 }+1'b1;
					alu_out = source_1 & source_2;
					c_unsign = 1'b0;
					c_sign = 1'b0;
					c_over = 1'b0;
				  end
		4'b0001:begin
					two_comple_number = ~{ 1'b0,source_2 }+1'b1;
					alu_out = source_1 ^ source_2;
					c_unsign = 1'b0;
					c_sign = 1'b0;
					c_over = 1'b0;
				  end
		4'b0010:begin
					two_comple_number = ~{ 1'b0,source_2 }+1'b1;
					{ c_over, alu_out[30:0] } = source_1[30:0] + two_comple_number[30:0];
					{ c_sign, alu_out[31] } = c_over + source_1[31] + two_comple_number[31];
					c_unsign = ~(c_sign + two_comple_number[32]);
				  end
		4'b0011:begin
					two_comple_number = ~{ 1'b0,source_1 }+1'b1;
					{ c_over, alu_out[30:0] } = source_2[30:0] + two_comple_number[30:0];
					{ c_sign, alu_out[31] } = c_over + source_2[31] + two_comple_number[31];
					c_unsign = ~(c_sign + two_comple_number[32]);
				  end
		4'b0100:begin
					two_comple_number = ~{ 1'b0,source_1 }+1'b1;
					{ c_over, alu_out[30:0] } = source_1[30:0] + source_2[30:0];
					{ c_sign, alu_out[31] } = c_over + source_1[31] + source_2[31];
					c_unsign = c_sign;
				  end
		4'b0101:begin
					two_comple_number = ~{ 1'b0,source_1 }+1'b1;
					{ c_over, alu_out[30:0] } = source_1[30:0] + source_2[30:0] + c_in;
					{ c_sign, alu_out[31] } = c_over + source_1[31] + source_2[31];
					c_unsign = c_sign;
				  end
		4'b0110:begin
					two_comple_number = ~{ 1'b0,source_1 }+1'b1;
					{ c_over, alu_out[30:0] } = source_1[30:0] + source_2[30:0] + c_in -1'b1;
					{ c_sign, alu_out[31] } = c_over + source_1[31] + source_2[31];
					c_unsign = c_sign;
				  end
		4'b0111:begin
					two_comple_number = ~{ 1'b0,source_2 }+1'b1;
					{ c_over, alu_out[30:0] } = source_1[30:0] + two_comple_number[30:0] + c_in - 1'b1;
					{ c_sign, alu_out[31] } = c_over + source_1[31] + two_comple_number[31];
					c_unsign = ~(c_sign + two_comple_number[32]);
				  end
		4'b1000:begin
					two_comple_number = ~{ 1'b0,source_2 }+1'b1;
					alu_out = source_1 & source_2;
					c_unsign = 1'b0;
					c_sign = 1'b0;
					c_over = 1'b0;
				  end
		4'b1001:begin
					two_comple_number = ~{ 1'b0,source_2 }+1'b1;
					alu_out = source_1 ^ source_2;
					c_unsign = 1'b0;
					c_sign = 1'b0;
					c_over = 1'b0;
				  end
		4'b1010:begin
					two_comple_number = ~{ 1'b0,source_2 }+1'b1;
					{ c_over, alu_out[30:0] } = source_1[30:0] + two_comple_number[30:0];
					{ c_sign, alu_out[31] } = c_over + source_1[31] + two_comple_number[31];
					c_unsign = ~(c_sign + two_comple_number[32]);
				  end
		4'b1011:begin
					two_comple_number = ~{ 1'b0,source_1 }+1'b1;
					{ c_over, alu_out[30:0] } = source_1[30:0] + source_2[30:0];
					{ c_sign, alu_out[31] } = c_over + source_1[31] + source_2[31];
					c_unsign = c_sign;
				  end
		4'b1100:begin
					two_comple_number = ~{ 1'b0,source_2 }+1'b1;
					alu_out = source_1 | source_2;
					c_unsign = 1'b0;
					c_sign = 1'b0;
					c_over = 1'b0;
				  end
		4'b1101:begin
					two_comple_number = ~{ 1'b0,source_2 }+1'b1;
					alu_out = source_2;
					c_unsign = 1'b0;
					c_sign = 1'b0;
					c_over = 1'b0;
				  end
		4'b1110:begin
					two_comple_number = ~{ 1'b0,source_2 }+1'b1;
					alu_out = source_1 & (~source_2);
					c_unsign = 1'b0;
					c_sign = 1'b0;
					c_over = 1'b0;
				  end
		4'b1111:begin
					two_comple_number = ~{ 1'b0,source_2 }+1'b1;
					alu_out = ~source_2;
					c_unsign = 1'b0;
					c_sign = 1'b0;
					c_over = 1'b0;
				  end
		endcase
	end

endmodule

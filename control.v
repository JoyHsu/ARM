`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:23:07 04/22/2014 
// Design Name: 
// Module Name:    control 
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
module control(opfunc, nzcv, 
					reg_write, alu_src, alu_op, mem_to_reg, mem_write, pc_src, 
					update_nzcv, link
    );
	input [3:0]nzcv;
	input [11:0]opfunc;
	output [3:0]alu_op;
	output [1:0]alu_src;
	output reg_write, mem_to_reg, mem_write, pc_src ,update_nzcv ,link;
	
	parameter BRANCH_TYPE = 8'b101xxxxx;
	parameter DATA_PROCESS_TYPE = 8'b00xxxxxx;
	parameter DATA_TRANSFER_TYPE = 8'b01xxxxxx;
	
	//assign test = opfunc[4];
	
	//wire
	wire n,v,z,c;
	reg condition;
	reg reg_write, mem_to_reg, mem_write, pc_src ,update_nzcv ,link;
	reg [3:0]alu_op;
	reg [1:0]alu_src;
	
	assign n = nzcv[3];
	assign z = nzcv[2];
	assign c = nzcv[1];
	assign v = nzcv[0];
	
	always@(*)
	begin
		case( opfunc[11:8] )
			4'b0000:begin
							if( z == 1'b1 )
								condition=1'b1;
							else
								condition=1'b0;
					  end
			4'b0001:begin
							if( z == 1'b0 )
								condition=1'b1;
							else
								condition=1'b0;
					  end
			4'b0010:begin
							if( c == 1'b1 )
								condition=1'b1;
							else
								condition=1'b0;
					  end
			4'b0011:begin
							if( c == 1'b0 )
								condition=1'b1;
							else
								condition=1'b0;
					  end
			4'b0100:begin
							if( n == 1'b1 )
								condition=1'b1;
							else
								condition=1'b0;
					  end
			4'b0101:begin
							if( n == 1'b0 )
								condition=1'b1;
							else
								condition=1'b0;
					  end
			4'b0110:begin
							if( v == 1'b1 )
								condition=1'b1;
							else
								condition=1'b0;
					  end
			4'b0111:begin
							if( v == 1'b0 )
								condition=1'b1;
							else
								condition=1'b0;
					  end
			4'b1000:begin
							if( c == 1'b1 && z==1'b0 )
								condition=1'b1;
							else
								condition=1'b0;
					  end
			4'b1001:begin
							if( c == 1'b0 || z == 1'b1)
								condition=1'b1;
							else
								condition=1'b0;
					  end
			4'b1010:begin
							if( n == v )
								condition=1'b1;
							else
								condition=1'b0;
					  end
			4'b1011:begin
							if( n != v )
								condition=1'b1;
							else
								condition=1'b0;
					  end
			4'b1100:begin
							if( z == 1'b0 && n ==v )
								condition=1'b1;
							else
								condition=1'b0;
					  end
			4'b1101:begin
							if( z == 1'b1 || n!=v )
								condition=1'b1;
							else
								condition=1'b0;
					  end
			4'b1110:condition=1'b1;
			4'b1111:condition=1'b1;
			default:condition=1'b1;
		endcase
	end

	always@(*)
	begin
		if( condition == 1'b1 )
			begin
				casex ( opfunc[7:0] )
						BRANCH_TYPE:begin
										reg_write = 1'b0;
										alu_src = 2'b00;
										alu_op = 4'b0000;
										mem_to_reg = 1'b0;
										mem_write = 1'b0;
										pc_src = 1'b1;
										update_nzcv = 1'b0;
										link = opfunc[4];
										end
						DATA_PROCESS_TYPE:begin
												case(opfunc[4:1])
													4'b1000:reg_write = 1'b0;
													4'b1001:reg_write = 1'b0;
													4'b1010:reg_write = 1'b0;
													4'b1011:reg_write = 1'b0;
													default: reg_write = 1'b1;
												endcase
												if( opfunc[5] == 1'b0 )
													alu_src = 2'b00;
												else
													alu_src = 2'b01;
												alu_op = opfunc[4:1];
												mem_to_reg = 1'b0;
												mem_write = 1'b0;
												pc_src = 1'b0;
												update_nzcv = opfunc[0];
												link = 1'b0;
												end
						DATA_TRANSFER_TYPE:begin
												 reg_write = opfunc[0];
												 if( opfunc[3] == 1'b1)
													alu_op = 4'b0100;
												 else
													alu_op = 4'b0010;
												 if( opfunc[5] == 1'b1 )
													alu_src = 2'b10;
												 else
													alu_src = 2'b11;
												 mem_to_reg = 1'b1;
												 mem_write = ~opfunc[0];
												 pc_src = 1'b0;
												 update_nzcv = 1'b0;
												 link = 1'b0;
											 end
						default:begin
										reg_write = 1'b0;
										alu_src = 2'b00;
										alu_op = 4'b0000;
										mem_to_reg = 1'b0;
										mem_write = 1'b0;
										pc_src = 1'b0;
										update_nzcv = 1'b0;
										link = 0;	
								  end
				endcase
			end
		else
			begin
				reg_write = 1'b0;
				alu_src = 2'b00;
				alu_op = 4'b0000;
				mem_to_reg = 1'b0;
				mem_write = 1'b0;
				pc_src = 1'b0;
				update_nzcv = 1'b0;
				link = 0;
			end
	
	end
	
endmodule

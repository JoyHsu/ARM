`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:07:52 04/21/2014 
// Design Name: 
// Module Name:    ARM 
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
module ARM(clk,rst
    );
	input clk,rst;
	
	//register
	reg [31:0]pc;
	reg [3:0]nzcv;
	
	//wire
	wire [31:0] pc_next, pc_add_4, pc_branch, sign_extend_out, rorate_out, unsign_extend_out, shift_out,
				   alu_out, read_data_1, read_data_2, read_data_3, mem_read_data, instruction, reg_write_data,
					alu_operation_2;
	wire [3:0] alu_out_nzcv, alu_op;
	wire link, reg_write, pc_write, mem_to_reg, mem_write, pc_src, update_nzcv;
	wire [1:0] alu_src;

	//adder
	assign pc_add_4 = pc+32'd4;
	assign pc_branch = sign_extend_out + pc_add_4;
	
	//mux
	assign reg_write_data = mem_to_reg? (mem_read_data):(alu_out);
	assign pc_next = pc_write? ( pc_src? (alu_out):(alu_out)  ):( pc_src? (pc_branch):(pc_add_4) );
	assign alu_operation_2 = alu_src[1]? ( alu_src[0]? (unsign_extend_out):(shift_out) ):( alu_src[0]? (rorate_out):(shift_out) );
	
	ins_mem _ins_mem( .pc(pc), .ins(instruction) );
	regitser_file _register_file( .clk(clk), .rst(rst), .write_data(reg_write_data), .reg_write(reg_write), .link(link), 
										  .write_addr(instruction[15:12]), .read_addr_1(instruction[19:16]) , .read_addr_2(instruction[3:0]),
										  .read_addr_3(instruction[15:12]), .pc_content(pc_add_4), .read_data_1(read_data_1),
										  .read_data_2(read_data_2), .read_data_3(read_data_3), .pc_write(pc_write) );
	sign_extent _sign_extent( .sign_immediate( instruction[23:0] ), .out(sign_extend_out) );
	rorate _rorate( .immediate(instruction[11:0]), .out(rorate_out) );
	unsign_extend _unsign_extend( .unsign_immediate(instruction[11:0]) , .out(unsign_extend_out) );
	shift _shift( .reg_data(read_data_2) , .shift_type(instruction[6:5]), .shift_num(instruction[11:7]), .out(shift_out) );
	alu _alu( .c_in(nzcv[2]), .source_1(read_data_1), .source_2(alu_operation_2), .alu_op(alu_op), .nzcv(alu_out_nzcv), .alu_out(alu_out) );
	control _control( .opfunc(instruction[31:20]), .nzcv(nzcv), .reg_write(reg_write), .alu_src(alu_src), .alu_op(alu_op), 
							.mem_to_reg(mem_to_reg), .mem_write(mem_write), .pc_src(pc_src), .update_nzcv(update_nzcv), .link(link) );
	data_mem _data_mem( .clk(clk), .rst(rst), .addr(alu_out), .write_data(read_data_3), .mem_write(mem_write), 
							.read_data(mem_read_data));
	
	always@(posedge clk or posedge rst)
	begin
		if( rst == 1'b1 )
			pc = 32'd0;
		else
			pc = pc_next;
	end

	always@(posedge clk or posedge rst)
	begin
		if( rst == 1'b1 )
			nzcv = 4'd0;
		else
			begin
				if(update_nzcv)
					nzcv = alu_out_nzcv;		
				else
					nzcv = nzcv;
			end
	end
	
	
endmodule

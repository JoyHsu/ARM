`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   13:42:48 04/24/2014
// Design Name:   control
// Module Name:   D:/Xilinx/13.2/ARM/tb_control.v
// Project Name:  ARM
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: control
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tb_control;

	// Inputs
	reg [11:0] opfunc;
	reg [3:0] nzcv;

	// Outputs
	wire reg_write;
	wire [1:0] alu_src;
	wire [3:0] alu_op;
	wire mem_to_reg;
	wire mem_write;
	wire pc_src;
	wire update_nzcv;
	wire link;


	// Instantiate the Unit Under Test (UUT)
	control uut (
		.opfunc(opfunc), 
		.nzcv(nzcv), 
		.reg_write(reg_write), 
		.alu_src(alu_src), 
		.alu_op(alu_op), 
		.mem_to_reg(mem_to_reg), 
		.mem_write(mem_write), 
		.pc_src(pc_src), 
		.update_nzcv(update_nzcv), 
		.link(link)
	);

	initial begin
		// Initialize Inputs
		opfunc = 0;
		nzcv = 0;
		
		# 5 opfunc = 12'b111000000011;

		#5 $finish;
	end
      
endmodule


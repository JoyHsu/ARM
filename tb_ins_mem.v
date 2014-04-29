`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   21:53:54 04/21/2014
// Design Name:   ins_mem
// Module Name:   D:/Xilinx/13.2/ARM/tb_ins_mem.v
// Project Name:  ARM
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ins_mem
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tb_ins_mem;

	// Inputs
	reg [31:0] pc;

	// Outputs
	wire [31:0] ins;

	// Instantiate the Unit Under Test (UUT)
	ins_mem uut (
		.pc(pc), 
		.ins(ins)
	);

	integer i,file;
	
	initial begin
		// Initialize Inputs
		pc = 0;
		$readmemh("program_1.txt", uut.mem);
		#5 file = $fopen("report.txt");
		for(i=0;i<64;i=i+1)begin
			$fdisplay(file, "%h", uut.mem[i]);
		end
		#5	$fclose(file);
		#5 pc =0;
		#5 pc =12;
		#5 pc =25;
		$finish; 
		// Add stimulus here

	end
      
endmodule


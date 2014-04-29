`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:38:26 04/25/2014
// Design Name:   ARM
// Module Name:   D:/Copy/NCKU/NCKU_SoC/Digital Logic Experiments/Logic Desing 104/Final project/ARM/tb_ARM.v
// Project Name:  ARM
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ARM
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tb_ARM_1;

	// Inputs
	reg clk;
	reg rst;
	
	parameter DATA_MEM_SIZE = 64;
	parameter INS_MEM_SIZE = 32;
	parameter REG_NUM = 15;

	// Instantiate the Unit Under Test (UUT)
	ARM uut (
		.clk(clk), 
		.rst(rst)
	);


	integer file_mem_data, file_reg_data;
	reg [6:0] i;
	reg [4:0] j;

	
	always #5 clk=~clk;

	initial begin
		// Initialize Inputs
		clk = 0;
		rst = 1;
		#10 rst = 0;
		
		$readmemb("arm_tb_program_1.txt", uut._ins_mem.mem);
		$readmemb("arm_tb_mem_data_1.txt", uut._data_mem.mem);
		file_mem_data = $fopen("arm_tb_program_1_mem_data_report.txt");
		file_reg_data = $fopen("arm_tb_program_1_reg_data_report.txt");
		
	end
	
	always@(posedge clk)
	begin
		#1 if( uut.pc >= INS_MEM_SIZE*4 )
			begin
				for(i=0 ;i<DATA_MEM_SIZE; i=i+1)
					$fdisplay(file_mem_data, "mem[%d] %h",i*4 ,uut._data_mem.mem[i]);
				#5	$fclose(file_mem_data);
				for(j=0 ;j<REG_NUM; j=j+1)
					$fdisplay(file_reg_data, "R%d = %h",j ,uut._register_file.reg_id[j]);
				$fdisplay(file_reg_data, "PC = %h", uut.pc);
				$fdisplay(file_reg_data, "nzcv = %b", uut.nzcv);
				#5	$fclose(file_reg_data);

				$finish; 
			end
	end
      
endmodule


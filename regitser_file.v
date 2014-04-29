`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:06:55 04/21/2014 
// Design Name: 
// Module Name:    regitser_file 
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
module regitser_file(clk,rst,write_data,reg_write,link,write_addr,read_addr_1,read_addr_2,read_addr_3,pc_content,
							read_data_1,read_data_2,read_data_3,pc_write );
	input clk,rst,reg_write,link;
	input [3:0]read_addr_1, read_addr_2, read_addr_3, write_addr;
	input [31:0]write_data, pc_content;
	output pc_write;
	output [31:0]read_data_1, read_data_2, read_data_3;

	parameter REG_NUM = 15;
	
	//wire
	reg	[31:0]read_data_1, read_data_2, read_data_3;
	reg	pc_write;

	//register
	reg [31:0] reg_id[REG_NUM-1:0];
	
	//int
	integer i;
	
	always@(*)
		if(read_addr_1 == 4'b1111)
			read_data_1 = pc_content;
		else
			read_data_1 = reg_id[read_addr_1];

	always@(*)
		if(read_addr_3 == 4'b1111)
			read_data_3 = pc_content;
		else
			read_data_3 = reg_id[read_addr_3];
	
	
	always@(*)
		if(read_addr_2 == 4'b1111)
			read_data_2 = pc_content;
		else
			read_data_2 = reg_id[read_addr_2];
	
	always@(posedge clk or posedge rst)
	begin
		if( rst == 1'b1 )
			for( i=0 ; i<REG_NUM ; i=i+1)
				reg_id[i]=32'd0;
		else	if( reg_write == 1'b1 && write_addr != 4'b1111)
				reg_id[write_addr]=write_data;
		else	if( link == 1'b1 )
				reg_id[14]=pc_content;
		end
		
	always@(*)
	begin
		if( reg_write == 1'b1 && write_addr == 4'b1111 )
			pc_write = 1'b1;
		else	
			pc_write = 1'b0;
	end
	
endmodule

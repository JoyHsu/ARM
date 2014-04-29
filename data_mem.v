`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:41:15 04/22/2014 
// Design Name: 
// Module Name:    data_mem 
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
module data_mem(clk,rst,addr,write_data,mem_write,read_data
    );
	input clk,rst,mem_write;
	input [31:0]addr,write_data;
	output [31:0]read_data;
	
	parameter DATA_MEM_SIZE = 64;
	
	//register
	reg [31:0] mem [DATA_MEM_SIZE-1:0];
	
	
	integer i;
	
	assign read_data = mem[ addr[31:2] ];
	
	always@(posedge clk or posedge rst)
	begin
		if( rst == 1'b1 )
			for( i=0 ; i<DATA_MEM_SIZE ; i=i+1)
				mem[i] <= 0;
		else if ( mem_write == 1'b1)
			mem[ addr[31:2] ] <= write_data;
	end

endmodule

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.01.2024 14:40:17
// Design Name: 
// Module Name: ram
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

/* // General RAM Declaration Module
module ram(clk, reset, re, we, write_data, read_data, read_addr, write_addr);
  // Using parameter construct to do overriding of memory
  parameter address = 6,
            width = 16, 
            depth = 64;
  input clk, reset, re, we;
  input [address-1:0] read_addr, write_addr;
  input [width-1:0] write_data;
  output reg [width-1:0] read_data;
  reg [width-1:0] mem [depth-1:0];
  integer i;

  always @(posedge clk) begin
    if (reset) begin
      for (i = 0; i < depth; i = i + 1)
        mem[i] <= 0;
        read_data <= 0;
    end
    else begin
    if (we)
      mem[write_addr] <= write_data;
    if (re)
      read_data <= mem[read_addr];
    end
  end
endmodule

Parameter Overriding Module 
/*module ram_overriding(clk, reset, re, we, write_data, read_data, read_addr, write_addr);
  input clk,reset,re,we;
  input [3:0] read_addr,write_addr;
  input [63:0] write_data;
  output [63:0] read_data;
  ram #(4, 64, 16) m1 (clk, reset, re, we, write_data, read_data, read_addr, write_addr);
endmodule*/

// General RAM Declaration Module
module ram(clk, reset, re, we, write_data, read_data, read_addr, write_addr);
  // Using parameter construct to do overriding of memory
parameter address = 6,
            width = 16, 
            depth = 64;
input clk, reset, re, we;
input [address-1:0] read_addr, write_addr;
input [width-1:0] write_data;
output reg [width-1:0] read_data;
reg [width-1:0] mem [depth-1:0];
integer i;
always @(posedge clk) begin
if (reset) begin
    for (i = 0; i < depth; i = i + 1)
        mem[i] <= 0;
        read_data <= 0;   
    end
    else if (we)
        mem[write_addr] <= write_data;
    else if (re)
        read_data <= mem[read_addr];
    else
        read_data <= read_data;
  end
endmodule
// Parameter Overriding Module 
module ram_overriding(clk, reset, re, we, write_data, read_data, read_addr, write_addr);
  input clk,reset,re,we;
  input [3:0] read_addr,write_addr;
  input [63:0] write_data;
  output [63:0]read_data;
  ram #(4, 64, 16) m1 (clk, reset, re, we, write_data, read_data, read_addr, write_addr);
endmodule

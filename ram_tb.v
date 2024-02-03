`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.01.2024 15:31:57
// Design Name: 
// Module Name: ram_tb
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



/*module ram_tb();
reg clk,reset,we,re;
reg [63:0] write_data;
reg [3:0] write_addr,read_addr;
wire [63:0] read_data;
ram_overriding uut(clk, reset, re, we, write_data, read_data, read_addr, write_addr);
initial begin
    // Generating the clock
    clk= 1'b0;
    while(1)
    #5 clk = ~clk;
end
// Task for initialization
task initialize();
begin
    write_data = 64'd0;
    {write_addr,read_addr} = 8'd0;
    {reset,we,re} = 3'b100;
end
endtask
// Task for reset
task rst();
    begin
        @(negedge clk)
        reset = 1'b1;
        @(negedge clk)
        reset = 1'b0;
    end
endtask
// Task for write operation
task write (input x, input [3:0]y, input[63:0]z);
    begin
        @(negedge clk)
        we = x;
        write_addr = y;
        write_data = z;
    end
endtask
// Task for read operation
task read (input a, input [3:0]b);
    begin
        @(negedge clk)
        re = a;
        read_addr = b;
    end
endtask
initial begin
    initialize();
    rst();
    write(1'b1,4'b0101,64'd5);
    #10 we = 1'b0;
    #10;
    read(1'b1,4'b0101); 
    #10 re = 1'b0;
    #50 $finish;
end
endmodule*/

module ram_tb();
reg clk,reset,we,re;
reg [63:0] write_data;
reg [3:0] write_addr,read_addr;
wire [63:0] read_data;
ram_overriding uut(clk, reset, re, we, write_data, read_data, read_addr, write_addr);
initial begin
    // Generating the clock
    clk= 1'b0;
    while(1)
    #5 clk = ~clk;
end
// Task for initialization
task initialize();
begin
    write_data = 1'b0;
    {write_addr,read_addr} = 4'd0;
    {reset,we,re} = 3'b100;
end
endtask
// Task for reset
task rst();
    begin
        @(negedge clk)
        reset = 1'b1;
        @(negedge clk)
        reset = 1'b0;
    end
endtask
// Task for write operation
task write (input x, input [3:0]y, input[63:0]z);
    begin
        @(negedge clk)
        we = x;
        write_addr = y;
        write_data = z;
    end
endtask
// Task for read operation
task read (input a, input [3:0]b);
    begin
        @(negedge clk)
        re = a;
        read_addr = b;
    end
endtask
initial begin
    initialize();
    rst();
    write(1'b1,4'b0101,64'd5);
    #10 we = 1'b0;
    read(1'b1,4'b0101); 
    #10 re = 1'b0;
    #50 $finish;
end
endmodule

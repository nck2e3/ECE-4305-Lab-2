`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/08/2024 11:50:23 AM
// Design Name: 
// Module Name: test_top
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

module test_top;
    logic clk;
    logic rst;
    logic [3:0] M;
    logic [3:0] N;
    logic data_out, clk_slow;

    top uut (
        .clk(clk),
        .rst(rst),
        .M(M),
        .N(N),
        .data_out(data_out),
        .clk_slow(clk_slow)
    );
 
    always #5 clk = ~clk;

    initial begin
        clk = 0;
        rst = 0;
        M = 4'd3; 
        N = 4'd1; 
        #20; 
        rst = 1;
        #20;     
        rst = 0;    
        #500000;    
        $stop;
    end
endmodule




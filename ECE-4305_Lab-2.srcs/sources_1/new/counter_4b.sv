`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/10/2024 03:11:34 PM
// Design Name: 
// Module Name: counter_4b
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


module counter(
    input logic clk,            
    input logic rst,            
    input logic enable,         
    input logic [3:0] max_value,
    output logic done,         
    output logic [3:0] count   
);
    always_ff @(posedge clk) begin //Level triggered reset (important we keep it this way for timing purposes)...
        if (rst) begin
            count <= 0;     
        end else if (enable) begin
            count <= count + 1; 
        end
    end

    assign done = (count == max_value - 1);

endmodule













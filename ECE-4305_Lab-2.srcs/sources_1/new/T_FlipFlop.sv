`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/10/2024 11:58:56 AM
// Design Name: 
// Module Name: T_FlipFlop
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


module T_FlipFlop (
    input logic clk,  //Clock input...
    input logic rst,  //Reset input (active high)...
    input logic T,    //Toggle input...
    output logic Q    //Output...
);

always_ff @(posedge clk or posedge rst) begin
    if (rst) begin
        Q <= 1'b0;    
    end else if (T) begin
        Q <= ~Q;
    end
end

endmodule


`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/08/2024 11:21:34 AM
// Design Name: 
// Module Name: Clock_Slow
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

module Clock_Slow
#(parameter count_max)
(
    input clk_in,
    input rst,
    output logic clk_out
);

//Calculate the width of the counter based on the maximum parameter...
logic [$clog2(count_max + 1)-1:0] count;

initial begin
    clk_out = 0;
    count = 0;
end

always @(posedge clk_in)
begin
    if (rst) 
    begin
        count <= 0;      //Use non-blocking assignment...
        clk_out <= 0;    //Reset clk_out to a known state...
    end 
    else 
    begin
        if (count == count_max) 
        begin
            clk_out <= ~clk_out;  //Toggle the clock...
            count <= 0;           //Reset the counter...
        end 
        else 
        begin
            count <= count + 1;   //Increment the counter...
        end
    end
end

endmodule



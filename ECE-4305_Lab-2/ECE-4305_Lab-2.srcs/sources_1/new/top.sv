`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/08/2024 11:24:39 AM
// Design Name: 
// Module Name: top
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


module top( //Outsider stuff...
    input logic clk,         
    input logic rst,        
    input logic [3:0] M, 
    input logic [3:0] N,     
    output logic data_out //SQW
);

    //Insider stuff...
    logic [3:0] count;             //Keeps track of the counter state, this is the iterator...
    logic done;                    //When M or N completes, we flip it on...
    logic enable;                  //Enable the counter...
    logic [3:0] select_counter;    //Current max value of counter (either M or N)...
    logic [3:0] data_in [1:0];     //Inputs for the param_mux (M and N)...

    //Toggle Flip Flop...
    T_FlipFlop tff (
        .clk(clk),
        .rst(rst),
        .T(done),                   //Toggle flip-flop when the counter completes...
        .Q(data_out)
    );

    //Parameterized mux setup...
    assign data_in[0] = M;
    assign data_in[1] = N;
    param_mux #(.width_select(1), .width_input(4)) mux 
    (
        .select(data_out),          //Select line driven by T flip-flop (switches between M and N)...
        .data_in(data_in),          //Inputs are M and N...
        .data_out(select_counter)   //Output will be the currently selected count (M or N)...
    );

    //Instantiating counter...
    counter cnt(
        .clk(clk),
        .rst(rst | done),           //Reset the counter on reset switch or when counter completes...
        .enable(~done),             //Enable the counter when not done...
        .max_value(select_counter), //Current value to count up to (M or N)...
        .done(done),                //Flipped when done...
        .count(count)               //Current value of counter...
    );

endmodule













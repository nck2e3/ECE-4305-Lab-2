`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/31/2024 01:49:41 PM
// Design Name: Parametric Multiplexer
// Module Name: param_mux
// Project Name: ECE-4305 Lab 1
// Target Devices: Nexys A7-100T Development Board
// Tool Versions: Vivado 2024.1.1
// 
// Dependencies: None
// 
// Revision: 1.0
// Revision 0.01 - File Created
// Additional Comments: None
// 
//////////////////////////////////////////////////////////////////////////////////

module param_mux
    //Parameters...
    #(
    parameter width_select, 
    parameter width_input
    )
    //Inputs...
    (
    input logic [width_select - 1:0] select,
    input logic [width_input - 1:0] data_in [2 ** width_select - 1:0], //n-inputs of variable size...
    output logic [width_input - 1:0] data_out
    );
    
    assign data_out = data_in[select];
    
endmodule

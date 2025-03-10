`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Trinity College Dublin
// Engineer: Dylan Neve (21364333)
// 
// Create Date: 02/25/2025 01:08:21 PM
// Design Name: ALU
// Module Name: _passthrough
// Project Name: Assignment1
// Target Devices: Basys 3
// 
//////////////////////////////////////////////////////////////////////////////////


module _passthrough(input [5:0] x, output [5:0] y);
    // Assign y (output) to x (input)
    assign y = x;
endmodule

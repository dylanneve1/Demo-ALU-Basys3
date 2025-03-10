`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Trinity College Dublin
// Engineer: Dylan Neve (21364333)
// 
// Create Date: 02/25/2025 04:24:49 PM
// Design Name: ALU
// Module Name: _bitwise_nxor
// Project Name: Assignment1
// Target Devices: Basys 3
// 
//////////////////////////////////////////////////////////////////////////////////


module _bitwise_nxor(input [5:0] a, b, output [5:0] out);
    // Assign out to NXOR
    assign out = a~^b;
endmodule

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Trinity College Dublin
// Engineer: Dylan Neve (21364333)
// 
// Create Date: 02/11/2025 01:09:54 PM
// Design Name: ALU
// Module Name: 6bit_ripple_adder
// Project Name: Assignment1
// Target Devices: Basys 3
// 
//////////////////////////////////////////////////////////////////////////////////


module _6bit_ripple_adder (input [5:0] x, y, input sel, output overflow, c_out, output [5:0] sum);
    // Intermediate carry bits
    wire c1, c2, c3, c4, c5, c6;
    // Processed y input
    wire [5:0] y_p;
    
    // Calculate the twos compliment of y
    assign y_p = sel ? ~y:y;
    
    // Chain full adders to create a 6-bit circuit
    FullAdder bit0 (x[0], y_p[0], sel, sum[0], c1);
    FullAdder bit1 (x[1], y_p[1], c1, sum[1], c2);
    FullAdder bit2 (x[2], y_p[2], c2, sum[2], c3);
    FullAdder bit3 (x[3], y_p[3], c3, sum[3], c4);
    FullAdder bit4 (x[4], y_p[4], c4, sum[4], c5);
    FullAdder bit5 (x[5], y_p[5], c5, sum[5], c6);
    
    // Calculate overflow and c_out
    xor g0 (overflow, c5, c6);
    assign c_out = c6;

endmodule

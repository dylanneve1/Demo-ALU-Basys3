`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Trinity College Dublin
// Engineer: Dylan Neve (21364333)
// 
// Create Date: 02/25/2025 03:07:13 PM
// Design Name: ALU
// Module Name: eq2
// Project Name: Assignment1
// Target Devices: Basys 3
// 
//////////////////////////////////////////////////////////////////////////////////

module eq2(input wire [1:0] a, b, output wire aeqb);
    // Intermediate bits
    wire e0, e1;
    
    // Check if 1st bits are equal
    eq1 eq_bit0_unit(.i0(a[0]), .i1(b[0]), .eq(e0));
    // Check if 2nd bits are equal
    eq1 eq_bit1_unit(.eq(e1), .i0(a[1]), .i1(b[1]));
    
    // If both 1st and 2nd bits are same then aeqb is 1
    assign aeqb = e0 & e1;
endmodule


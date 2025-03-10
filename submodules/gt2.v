`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Trinity College Dublin
// Engineer: Dylan Neve (21364333)
// 
// Create Date: 02/25/2025 03:17:05 PM
// Design Name: ALU
// Module Name: gt2
// Project Name: Assignment1
// Target Devices: Basys 3
// 
//////////////////////////////////////////////////////////////////////////////////


module gt2(input wire [1:0] a, b, output wire gt);
    // MSB bit
    wire eq_msb;
    
    // Check MSB using eq1
    eq1 eq_msb_bit(.i0(a[1]), .i1(b[1]), .eq(eq_msb));
    
    // gt is 1 if MSB of a is bigger or if MSB is equal and 2nd bit of a is bigger
    assign gt = (a[1] & ~b[1]) | (eq_msb & (a[0] & ~b[0]));
endmodule

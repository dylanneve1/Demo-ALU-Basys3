`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Trinity College Dublin
// Engineer: Dylan Neve (21364333)
// 
// Create Date: 02/25/2025 01:13:11 PM
// Design Name: ALU
// Module Name: _twoscompliment
// Project Name: Assignment1
// Target Devices: Basys 3
// 
//////////////////////////////////////////////////////////////////////////////////


module _twoscompliment(input [5:0] x, input [1:0] ovf, output [5:0] y);
    // Calculate twos compliment by passing x as input y into ripple adder and 0 as input x and performing subtraction
    // This allows us to further reuse the ripple adder module
    _6bit_ripple_adder link_adder(.x(6'b000000), .y(x), .sel(1'b1), .sum(y), .overflow(ovf[0]), .c_out(ovf[1]));
endmodule

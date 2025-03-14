`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Trinity College Dublin
// Engineer: Dylan Neve (21364333)
// 
// Create Date: 03/14/2025 11:45:06 AM
// Design Name: ALU
// Module Name: _6bit_xnor
// Project Name: Assignment1
// Target Devices: Basys 3
// 
//////////////////////////////////////////////////////////////////////////////////


module _6bit_xnor(input wire [5:0] i0, i1, output wire [5:0] op);
    // Connect six 1-bit XNOR gates to get XNOR of 6-bit
    _xnor bit0(.i0(i0[0]), .i1(i1[0]), .op(op[0]));
    _xnor bit1(.i0(i0[1]), .i1(i1[1]), .op(op[1]));
    _xnor bit2(.i0(i0[2]), .i1(i1[2]), .op(op[2]));
    _xnor bit3(.i0(i0[3]), .i1(i1[3]), .op(op[3]));
    _xnor bit4(.i0(i0[4]), .i1(i1[4]), .op(op[4]));
    _xnor bit5(.i0(i0[5]), .i1(i1[5]), .op(op[5]));
endmodule

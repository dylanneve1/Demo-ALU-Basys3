`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Trinity College Dublin
// Engineer: Dylan Neve (21364333)
// 
// Create Date: 02/18/2025 01:27:40 PM
// Design Name: ALU
// Module Name: ALU
// Project Name: Assignment1
// Target Devices: Basys 3
// 
//////////////////////////////////////////////////////////////////////////////////


module ALU(input [5:0] A, B, input [2:0] fxn, output [5:0] X);
    // Create wires for each output
    wire [5:0] op0; // fxn 000: Output A
    wire [5:0] op1; // fxn 001: Output B
    wire [5:0] op2; // fxn 010: -A
    wire [5:0] op3; // fxn 011: -B
    wire [5:0] op4; // fxn 100: A < B
    wire [5:0] op5; // fxn 101: A NXOR B
    wire [5:0] op6; // fxn 110: A + B
    wire [5:0] op7; // fxn 111: A - B
    
    // Passthrough A to op0
    _passthrough fxn_op0(.x(A), .y(op0));
    // Passthrough B to op1
    _passthrough fxn_op1(.x(B), .y(op1));
    // Pass two's compliment of A into op2
    _twoscompliment fxn_op2(.x(A), .y(op2));
    // Pass two's compliment of B into op3
    _twoscompliment fxn_op3(.x(B), .y(op3));
    // Check if B > A and store result in op4
    _greaterthan fxn_op4(.a(B), .b(A), .lt_flag(op4));
    // Perform NXOR on A and B and store result in op5
    _6bit_xnor fxn_op5(.i0(B), .i1(A), .op(op5));
    // Store result of A + B into op6
    _6bit_ripple_adder fxn_op6(.x(A), .y(B), .sel(1'b0), .sum(op6), .overflow(), .c_out());
    // Store result of A - B into op7
    _6bit_ripple_adder fxn_op7(.x(A), .y(B), .sel(1'b1), .sum(op7), .overflow(), .c_out());
    
    // Pass desired operation to X (out) using multiplexer based on fxn
    _multiplexer_6bit get_op(.in0(op0), .in1(op1), .in2(op2), .in3(op3), .in4(op4), .in5(op5), .in6(op6), .in7(op7), .sel(fxn), .out(X));

endmodule

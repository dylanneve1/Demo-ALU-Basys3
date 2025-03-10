`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Trinity College Dublin
// Engineer: Dylan Neve (21364333)
// 
// Create Date: 02/25/2025 07:16:06 PM
// Design Name: ALU
// Module Name: ALU_tb
// Project Name: Assignment1
// Target Devices: Basys 3
// 
//////////////////////////////////////////////////////////////////////////////////


module ALU_tb;
    reg [5:0] A, B;
    reg [2:0] fxn;
    wire [5:0] X;
    
    ALU uut(
        .A(A),
        .B(B),
        .fxn(fxn),
        .X(X)
    );
    
    initial begin
        // Print header
        $display("----------------------------------------------------------");
        $display("| fxn |   A    |   B    |   X    |");
        $display("----------------------------------------------------------");

        // Monitor output with aligned formatting
        $monitor("| %3b | %6b | %6b | %6b |", fxn, A, B, X);
        
        
        // Test 1: fxn = 000, Pass A
        // A = 010101 (21), B = 001100 (12) -> Expected X = A = 010101
        A = 6'b010101; B = 6'b001100; fxn = 3'b000; #20;

        // Test 2: fxn = 001, Pass B
        // A = don't care, B = 101010 (-22 in 2's complement if interpreted, but as bits, just pass B)
        A = 6'b010101; B = 6'b101010; fxn = 3'b001; #20;

        // Test 3: fxn = 010, -A (Two's complement of A)
        // A = 000101 (5) -> Expected X = -5 = 111011
        A = 6'b000101; B = 6'bxxxxxx; fxn = 3'b010; #20;

        // Test 4: fxn = 011, -B (Two's complement of B)
        // B = 001010 (10) -> Expected X = -10 = 110110
        A = 6'bxxxxxx; B = 6'b001010; fxn = 3'b011; #20;

        // Test 5: fxn = 100, A < B flag (output 6'b111111 if true)
        // A = 001000 (8), B = 010000 (16) -> Expected X = 111111
        A = 6'b001000; B = 6'b010000; fxn = 3'b100; #20;

        // Test 6: fxn = 101, A NXOR B (bitwise XNOR)
        // A = 101010, B = 110011 -> Expected bitwise XNOR: 100110 (example)
        A = 6'b101010; B = 6'b110011; fxn = 3'b101; #20;

        // Test 7: fxn = 110, A + B
        // A = 001010 (10), B = 000101 (5) -> Expected X = 001111 (15)
        A = 6'b001010; B = 6'b000101; fxn = 3'b110; #20;

        // Test 8: fxn = 111, A - B
        // A = 010000 (16), B = 000101 (5) -> Expected X = 001011 (11)
        A = 6'b010000; B = 6'b000101; fxn = 3'b111; #20;
        
        $finish;
    end
endmodule

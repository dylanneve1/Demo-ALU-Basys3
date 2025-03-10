`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Trinity College Dublin
// Engineer: Dylan Neve (21364333)
// 
// Create Date: 02/11/2025 01:09:14 PM
// Design Name: ALU
// Module Name: FullAdder
// Project Name: Assignment1
// Target Devices: Basys 3
// 
//////////////////////////////////////////////////////////////////////////////////


module FullAdder(a, b, cin, s, cout);
  // Define inputs, a, b and carry-in (cin)
  input wire a, b, cin;
  
  // Define outputs, s is the sum of a and b. 
  // cout is any carry out bit
  output wire s, cout;

  // logic for sum and carry
  // s is 1 if cin XOR a XOR b
  assign s = cin ^ a ^ b;
  // cout is 1 if a/b AND cin or, a AND b
  assign cout = (b & cin) | (a & cin) | (a & b); 
  
endmodule


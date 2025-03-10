`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Trinity College Dublin
// Engineer: Dylan Neve (21364333)
// 
// Create Date: 02/25/2025 02:58:27 PM
// Design Name: ALU
// Module Name: eq1
// Project Name: Assignment1
// Target Devices: Basys 3
// 
//////////////////////////////////////////////////////////////////////////////////


module eq1(input wire i0, i1, output wire eq);
    // Intermediate products
    wire p0, p1;
    
    // Check if both are 0
    assign p0 = ~i0 & ~i1;
    // Check if both are 1
    assign p1 = i0 & i1;
    
    // If both are 0 or both are 1 then eq is 1
    assign eq = p0 | p1;
endmodule

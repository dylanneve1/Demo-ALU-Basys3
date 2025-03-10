`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Trinity College Dublin
// Engineer: Dylan Neve (21364333)
// 
// Create Date: 02/25/2025 03:17:05 PM
// Design Name: ALU
// Module Name: ge8
// Project Name: Assignment1
// Target Devices: Basys 3
// 
//////////////////////////////////////////////////////////////////////////////////


module ge8(input wire [7:0] a, input wire [7:0] b, output wire ge);
    // Partition the 8-bit inputs into four 2-bit groups:
    // Group 3: a[7:6], Group 2: a[5:4], Group 1: a[3:2], Group 0: a[1:0]
    wire gt3, eq3;
    wire gt2, eq2_out;
    wire gt1, eq1_out;
    wire gt0, eq0;
    
    // Compare the most significant 2-bit group.
    gt2 group3_gt(.a(a[7:6]), .b(b[7:6]), .gt(gt3));
    eq2 group3_eq(.a(a[7:6]), .b(b[7:6]), .aeqb(eq3));
    
    // Next 2-bit group.
    gt2 group2_gt(.a(a[5:4]), .b(b[5:4]), .gt(gt2));
    eq2 group2_eq(.a(a[5:4]), .b(b[5:4]), .aeqb(eq2_out));
    
    // Next 2-bit group.
    gt2 group1_gt(.a(a[3:2]), .b(b[3:2]), .gt(gt1));
    eq2 group1_eq(.a(a[3:2]), .b(b[3:2]), .aeqb(eq1_out));
    
    // Least significant 2-bit group.
    gt2 group0_gt(.a(a[1:0]), .b(b[1:0]), .gt(gt0));
    eq2 group0_eq(.a(a[1:0]), .b(b[1:0]), .aeqb(eq0));
    
    // Now, a >= b if:
    //  - Group 3 shows a > b, OR
    //  - Group 3 is equal and group 2 shows a > b, OR
    //  - Groups 3 and 2 are equal and group 1 shows a > b, OR
    //  - Groups 3, 2, and 1 are equal and the least significant group is either greater or equal.
    assign ge = gt3 
              | (eq3 & gt2)
              | (eq3 & eq2_out & gt1)
              | (eq3 & eq2_out & eq1_out & (gt0 | eq0));
endmodule

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Trinity College Dublin
// Engineer: Dylan Neve (21364333)
// 
// Create Date: 02/25/2025 01:40:44 PM
// Design Name: ALU
// Module Name: _multiplexer_2bit
// Project Name: Assignmen1
// Target Devices: Basys 3
// 
//////////////////////////////////////////////////////////////////////////////////


module _multiplexer_2bit(input [1:0] in0, in1, in2, in3, in4, in5, in6, in7, input [2:0] sel, output reg [1:0] out);
    // Calculate which value should be passed to out based on sel
    always @(*) begin
        case(sel)
            3'b000: out = in0;
            3'b001: out = in1;
            3'b010: out = in2;
            3'b011: out = in3;
            3'b100: out = in4;
            3'b101: out = in5;
            3'b110: out = in6;
            3'b111: out = in7;
        endcase
    end
endmodule

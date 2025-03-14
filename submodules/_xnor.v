//////////////////////////////////////////////////////////////////////////////////
// Company: Trinity College Dublin
// Engineer: Dylan Neve (21364333)
// 
// Create Date: 03/14/2025 11:45:06 AM
// Design Name: ALU
// Module Name: _xnor
// Project Name: Assignment1
// Target Devices: Basys 3
// 
//////////////////////////////////////////////////////////////////////////////////

module _xnor(input wire i0, i1, output wire op);

   // signal declaration
   wire p0, p1;

   // body
   // sum of two product terms
   assign op = p0 | p1;
   // product terms
   assign p0 = ~i0 & ~i1;
   assign p1 = i0 & i1;

endmodule
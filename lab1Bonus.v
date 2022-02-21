`timescale 1ns/1ps

module mux4bitOut1bitIn (
input [3:0]a,
input [3:0]b,
wire sela,
output [3:0]s
);
wire [3:0] B;
wire [3:0] A;
assign A[0] = a[0] & sela;
assign A[1] = a[1] & sela;
assign A[2] = a[2] & sela;
assign A[3] = a[3] & sela;
assign B[0] = b[0] & !sela;
assign B[1] = b[1] & !sela;
assign B[2] = b[2] & !sela;
assign B[3] = b[3] & !sela;

assign s[0] = A[0] | B[0];
assign s[1] = A[1] | B[1];
assign s[2] = A[2] | B[2];
assign s[3] = A[3] | B[3];
endmodule

module signCmp (
input wire [3:0]a,
input wire [3:0]b,
output reg [3:0]s
);
wire overflow;
wire [3:0] diff;
ALU4bit ALUbonus(.a(a[3:0]),.b(b[3:0]),.operator(1),.output(diff[3:0]),.overflow(overflow));

//mux4bitOut1bitIn SEL(.a(a[3:0]),.b(b[3:0]),.s(s),.overflow(overflow));
always @(*) begin
   if (overflow===0) begin
       if(diff[3]===1)begin
           s = b;
       end else begin
           s = a;
       end
   end else begin
       if (diff[3]===1) begin
           s = a;
       end else begin
           s =b;
       end
   end
end

endmodule

module ALU4bit (
input [3:0] a,
input [3:0] b,
input operator,
output [3:0]s,
output overflow
);
wire [4:0] C;
FullAdder FA0(.x(a[0]), .y(operator ^ b[0]),.cin(operator), .A(s[0]) ,.cout(C[1]));
FullAdder FA1(.x(a[1]), .y(operator ^ b[1]),.cin(     C[1]), .A(s[1]) ,.cout(C[2]));
FullAdder FA2(.x(a[2]), .y(operator ^ b[2]),.cin(     C[2]), .A(s[2]) ,.cout(C[3]));
FullAdder FA3(.x(a[3]), .y(operator ^ b[3]),.cin(     C[3]), .A(s[3]) ,.cout(C[4]));

assign overflow = C[4] ^ C[3];

endmodule

module FullAdder (
input wire x,
input wire y,
input wire cin,
output wire A,
output wire cout
);

wire p,r,s;
assign p = x ^ y;
assign r = cin & p;
assign s = x & y;
assign cout = r | s;
assign A = cin ^ p;
    
endmodule
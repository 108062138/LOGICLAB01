module binaryToGray (
input wire a,
input wire b,
input wire c,
input wire d,
output wire w,
output wire x,
output wire y,
output wire z
);
    assign z = d;
    assign y = c ^ d;
    assign x = b ^ c;
    assign w = a ^ b;
endmodule
`timescale 1ns/1ps

module lab1Bonus(
input wire [2:0] a,
input wire [2:0] b,
output reg [2:0] o,
output reg flag
);

always @(*) begin
    if (a[2] === b[2]) begin
        if(a[1:0] >= b[1:0])begin
            o = a[2:0];
            flag = 1'b1; 
        end begin
            o = b[2:0];
            flag = 1'b0;
        end
        
    end else begin
        if(a[2] === 1 && b[2] ===0)begin
            o = b[2:0];
            flag = 1'b0;
        end else begin
            o = a[2:0];
            flag = 1'b0;
        end
    end
end
endmodule
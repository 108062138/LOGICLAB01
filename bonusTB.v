`timescale 1ns/1ps

module TB;
reg [3:0] a;
reg [3:0] b;
reg operator;
wire [3:0] res;
wire overflow;

ALU4bit ALUTB(
.a(a),
.b(b),
.operator(operator),
.s(res),
.overflow(overflow)
);

initial begin
    operator = 0;
    for (a = 4'b0000; a <4'b1111; a = a + 4'b0001) begin
        for (b = 4'b0000; b < 4'b1111; b = b + 4'b0001)begin
           #5
            $display("current loop=%d %d", a,b); 
        end
    end
end

endmodule
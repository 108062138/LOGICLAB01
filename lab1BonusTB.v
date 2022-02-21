`timescale 1ns/1ps
`include "lab1Bonus.v"
module TB;
reg [2:0] a;
reg [2:0] b;
wire [2:0] res;
wire tester;

lab1Bonus LAB1BONUS(
.a(a),
.b(b),
.o(res),
.flag(tester)
);
//showNum A(
//.a(a),
//.which(2'b00)
//);
//showNum B(
//.a(b),
//.which(2'b01)
//);
//showNum C(
//.a(res),
//.which(2'b11)
//);
initial begin
    $dumpfile("lab1BonusTB.vcd");
    $dumpvars(0, TB);

    $display("=====================Simulation begin======================");
    
    b = 3'b101;
    for (a = 3'b000; a <3'b111; a = a + 3'b001) begin
        for (b = 3'b000; b < 3'b111 ;b = b + 3'b001) begin
            #5
            $display("current loop=%d %d", a,b); 
            end
    end

    $display("=====================Simulation finish=====================");
end

endmodule

//module showNum(
//input wire [2:0] a,
//input wire [1:0]which
//);
//always @(*) begin
//    case (which)
//        2'b00:
//            if(a[2]===1)begin
//            $display("a = -%d", a[1:0]);
//            end else begin
//                $display("a = +%d", a[1:0]);
//            end
//        2'b01:  
//            if(a[2]===1)begin
//                $display("b = -%d", a[1:0]);
//            end else begin
//                $display("b = +%d", a[1:0]);
//            end
//
//        default: 
//            if(a[2]===1)begin
//                $display("o = -%d", a[1:0]);
//            end else begin
//                $display("o = +%d", a[1:0]);
//            end
//    endcase
//end
//endmodule
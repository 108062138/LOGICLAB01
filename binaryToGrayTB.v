`timescale 1ns/1ps

module TB;
reg [3:0] cnt;
wire [3:0] res;
binaryToGray BINARYTOGRAY(
.a(cnt[0]),
.b(cnt[1]),
.c(cnt[2]),
.d(cnt[3]),
.w(res[0]),
.x(res[1]),
.y(res[2]),
.z(res[3])
)

initial begin
    for (cnt = 4'b0000; cnt <=4'b1111; cnt = cnt + 4'b0001) begin
        #5
    end
end

endmodule
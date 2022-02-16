`timescale 1ns/1ps

module TB;
reg [3:0] cnt;
wire [3:0] res;
binaryToGray BINARYTOGRAY(
.a(cnt[3]),
.b(cnt[2]),
.c(cnt[1]),
.d(cnt[0]),
.w(res[3]),
.x(res[2]),
.y(res[1]),
.z(res[0])
);
initial begin
    for (cnt = 4'b0000; cnt <=4'b1111; cnt = cnt + 4'b0001) begin
        #5
        $display("current loop=%b", cnt);
    end
end

endmodule
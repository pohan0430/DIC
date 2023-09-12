module Adder_tree(A,clk,Output);

input [127:0] A;
input clk;
output reg [7:0] Output;

reg [15:0]sum1[7:0];

genvar i;
generate
for(i = 0;i < 8;i = i + 1) begin
	always @(posedge clk) begin
		sum1[i] <= A[i*16] + A[i*16 + 1] + A[i*16 + 2] +A[i*16 + 3] + A[i*16 + 4] + A[i*16 + 5] + A[i*16 + 6] + A[i*16 + 7] + A[i*16 + 8] + A[i*16 + 9] + A[i*16 + 10] +A[i*16 + 11] + A[i*16 + 12] + A[i*16 + 13] + A[i*16 + 14] + A[i*16 + 15];
		end
	end

endgenerate

always @(posedge clk) begin
		Output <= sum1[0] + sum1[1] + sum1[2] + sum1[3] + sum1[4] + sum1[5] + sum1[6] + sum1[7];
		end
		
endmodule

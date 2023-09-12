module Adder_tree(A,clk,Output);

input [127:0] A;
input clk;
output reg [7:0] Output;

reg [1:0]sum1[63:0];
reg [2:0]sum2[31:0];
reg [3:0]sum3[15:0];
reg [4:0]sum4[7:0];
reg [5:0]sum5[3:0];
reg [6:0]sum6[1:0];

genvar i;
generate
for(i = 0;i < 64;i = i+ 1) begin
	always @(posedge clk) begin
		sum1[i] <= A[i*2] + A[i*2 + 1];
		end
	end

for(i = 0;i < 32;i = i+ 1) begin
	always @(posedge clk) begin
		sum2[i] <= sum1[i*2] + sum1[i*2 + 1];
		end
	end

for(i = 0;i < 16;i = i+ 1) begin
	always @(posedge clk) begin
		sum3[i] <= sum2[i*2] + sum2[i*2 + 1];
		end
	end

for(i = 0;i < 8;i = i+ 1) begin
	always @(posedge clk) begin
		sum4[i] <= sum3[i*2] + sum3[i*2 + 1];
		end
	end

for(i = 0;i < 4;i = i+ 1) begin
	always @(posedge clk) begin
		sum5[i] <= sum4[i*2] + sum4[i*2 + 1];
		end
	end

for(i = 0;i < 2;i = i+ 1) begin
	always @(posedge clk) begin
		sum6[i] <= sum5[i*2] + sum5[i*2 + 1];
		end
	end

endgenerate

always @(posedge clk) begin
		Output <= sum6[0] + sum6[1];
		end
endmodule







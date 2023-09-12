
/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : Q-2019.12
// Date      : Fri Dec  9 17:14:33 2022
/////////////////////////////////////////////////////////////




module Convolution(
	//input
    clk,
    rst_n,
	in_valid,
	weight_valid,
	In_IFM_1,
	In_IFM_2,
	In_IFM_3,
	In_IFM_4,
    In_IFM_5,
	In_IFM_6,
	In_IFM_7,
	In_IFM_8,
	In_IFM_9,
    In_Weight_1,
    In_Weight_2,
    In_Weight_3,
	In_Weight_4,
    In_Weight_5,
    In_Weight_6,
    In_Weight_7,
    In_Weight_8,
    In_Weight_9,
	//output
    out_valid, 
	Out_OFM	

);

input clk, rst_n, in_valid, weight_valid;
//input cg_en;
input [7:0]In_IFM_1;
input [7:0]In_IFM_2;
input [7:0]In_IFM_3;
input [7:0]In_IFM_4;
input [7:0]In_IFM_5;
input [7:0]In_IFM_6;
input [7:0]In_IFM_7;
input [7:0]In_IFM_8;
input [7:0]In_IFM_9;		
input [7:0]In_Weight_1;
input [7:0]In_Weight_2;
input [7:0]In_Weight_3;
input [7:0]In_Weight_4;
input [7:0]In_Weight_5;
input [7:0]In_Weight_6;
input [7:0]In_Weight_7;
input [7:0]In_Weight_8;
input [7:0]In_Weight_9;

output reg out_valid;
output reg [20:0] Out_OFM;

reg [2:0] state_cs, state_ns;
parameter IDLE = 3'd0;
parameter IN_DATA = 3'd1;
parameter EXE = 3'd2;
parameter OUT = 3'd3;




reg [7:0] Reg_IFM_in_1;
reg [7:0] Reg_IFM_in_2;
reg [7:0] Reg_IFM_in_3;
reg [7:0] Reg_IFM_in_4;
reg [7:0] Reg_IFM_in_5;
reg [7:0] Reg_IFM_in_6;
reg [7:0] Reg_IFM_in_7;
reg [7:0] Reg_IFM_in_8;
reg [7:0] Reg_IFM_in_9;

reg [7:0] Reg_Weight_in_1;
reg [7:0] Reg_Weight_in_2;
reg [7:0] Reg_Weight_in_3;
reg [7:0] Reg_Weight_in_4;
reg [7:0] Reg_Weight_in_5;
reg [7:0] Reg_Weight_in_6;
reg [7:0] Reg_Weight_in_7;
reg [7:0] Reg_Weight_in_8;
reg [7:0] Reg_Weight_in_9;

reg [4:0] count_out;



reg [15:0] MUL_1;
reg [15:0] MUL_2;
reg [15:0] MUL_3;
reg [15:0] MUL_4;
reg [15:0] MUL_5;
reg [15:0] MUL_6;
reg [15:0] MUL_7;
reg [15:0] MUL_8;
reg [15:0] MUL_9;

wire clk_gate_1;
wire clk_gate_2;
wire clk_gate_3;
wire clk_gate_4;
wire clk_gate_5;
wire clk_gate_6;
wire clk_gate_7;
wire clk_gate_8;
wire clk_gate_9;
wire clk_gate_Weight;

wire Enable_1;
wire Enable_2;
wire Enable_3;
wire Enable_4;
wire Enable_5;
wire Enable_6;
wire Enable_7;
wire Enable_8;
wire Enable_9;
reg Enable_1_1t;
reg Enable_2_1t;
reg Enable_3_1t;
reg Enable_4_1t;
reg Enable_5_1t;
reg Enable_6_1t;
reg Enable_7_1t;
reg Enable_8_1t;
reg Enable_9_1t;
wire Enable_weight;


// FSM
always@(posedge clk or negedge rst_n) begin
	if(!rst_n)
		state_cs <= IDLE;
	else
		state_cs <= state_ns;
end
always@(*) begin
	case(state_cs)
		IDLE:
		begin
			if(in_valid)
				state_ns = IN_DATA;
			else
				state_ns = IDLE;
		end
		
		IN_DATA:
		begin
			state_ns = OUT;
		end
		/*EXE:
		begin
			state_ns = OUT;
		end*/
		OUT:
		begin
			if(count_out == 24)
				state_ns = IDLE;
			else
				state_ns = OUT;
		end
		default:
			state_ns = IDLE;
	endcase
end


// Enable signals for clock gating
always@(posedge clk or negedge rst_n)begin
	if(!rst_n)begin
		Enable_1_1t <= 0;
	end
	else  begin
		Enable_1_1t <= Enable_1;
	end
end
always@(posedge clk or negedge rst_n)begin
	if(!rst_n)begin
		Enable_2_1t <= 0;
	end
	else  begin
		Enable_2_1t <= Enable_2;
	end
end
always@(posedge clk or negedge rst_n)begin
	if(!rst_n)begin
		Enable_3_1t <= 0;
	end
	else  begin
		Enable_3_1t <= Enable_3;
	end
end
always@(posedge clk or negedge rst_n)begin
	if(!rst_n)begin
		Enable_4_1t <= 0;
	end
	else  begin
		Enable_4_1t <= Enable_4;
	end
end
always@(posedge clk or negedge rst_n)begin
	if(!rst_n)begin
		Enable_5_1t <= 0;
	end
	else  begin
		Enable_5_1t <= Enable_5;
	end
end
always@(posedge clk or negedge rst_n)begin
	if(!rst_n)begin
		Enable_6_1t <= 0;
	end
	else  begin
		Enable_6_1t <= Enable_6;
	end
end
always@(posedge clk or negedge rst_n)begin
	if(!rst_n)begin
		Enable_7_1t <= 0;
	end
	else  begin
		Enable_7_1t <= Enable_7;
	end
end
always@(posedge clk or negedge rst_n)begin
	if(!rst_n)begin
		Enable_8_1t <= 0;
	end
	else  begin
		Enable_8_1t <= Enable_8;
	end
end
always@(posedge clk or negedge rst_n)begin
	if(!rst_n)begin
		Enable_9_1t <= 0;
	end
	else  begin
		Enable_9_1t <= Enable_9;
	end
end


assign Enable_1 = (In_IFM_1==0) ?(1) :(0);
assign Enable_2 = (In_IFM_2==0) ?(1)  :0;
assign Enable_3 = (In_IFM_3==0) ?(1)  :0;
assign Enable_4 = (In_IFM_4==0) ?(1)  :0;
assign Enable_5 = (In_IFM_5==0) ?(1)  :0;
assign Enable_6 = (In_IFM_6==0) ?(1)  :0;
assign Enable_7 = (In_IFM_7==0) ?(1)  :0;
assign Enable_8 = (In_IFM_8==0) ?(1)  :0;
assign Enable_9 = (In_IFM_9==0) ?(1)  :0;
assign Enable_weight = (weight_valid==0) ?(1)  :0;


// Clock Gating cells
GATED_OR GATED_CG_U0(
	// Input signals
	.CLOCK(clk),
	.Enble(Enable_1),
	.RST_N(rst_n),
	// Output signals
	.CLOCK_GATED(clk_gate_1)
);
GATED_OR GATED_CG_U1(
	// Input signals
	.CLOCK(clk),
	.Enble(Enable_2),
	.RST_N(rst_n),
	// Output signals
	.CLOCK_GATED(clk_gate_2)
);
GATED_OR GATED_CG_U2(
	// Input signals
	.CLOCK(clk),
	.Enble(Enable_3),
	.RST_N(rst_n),
	// Output signals
	.CLOCK_GATED(clk_gate_3)
);
GATED_OR GATED_CG_U3(
	// Input signals
	.CLOCK(clk),
	.Enble(Enable_4),
	.RST_N(rst_n),
	// Output signals
	.CLOCK_GATED(clk_gate_4)
);
GATED_OR GATED_CG_U4(
	// Input signals
	.CLOCK(clk),
	.Enble(Enable_5),
	.RST_N(rst_n),
	// Output signals
	.CLOCK_GATED(clk_gate_5)
);
GATED_OR GATED_CG_U5(
	// Input signals
	.CLOCK(clk),
	.Enble(Enable_6),
	.RST_N(rst_n),
	// Output signals
	.CLOCK_GATED(clk_gate_6)
);
GATED_OR GATED_CG_U6(
	// Input signals
	.CLOCK(clk),
	.Enble(Enable_7),
	.RST_N(rst_n),
	// Output signals
	.CLOCK_GATED(clk_gate_7)
);
GATED_OR GATED_CG_U7(
	// Input signals
	.CLOCK(clk),
	.Enble(Enable_8),
	.RST_N(rst_n),
	// Output signals
	.CLOCK_GATED(clk_gate_8)
);
GATED_OR GATED_CG_U8(
	// Input signals
	.CLOCK(clk),
	.Enble(Enable_9),
	.RST_N(rst_n),
	// Output signals
	.CLOCK_GATED(clk_gate_9)
);
GATED_OR GATED_CG_U9(
	// Input signals
	.CLOCK(clk),
	.Enble(Enable_weight),
	.RST_N(rst_n),
	// Output signals
	.CLOCK_GATED(clk_gate_Weight)
);



// Receive input 
always @(posedge clk_gate_1 or negedge rst_n) begin
	if(!rst_n)begin
		Reg_IFM_in_1 <= 8'd0;
	end
	else if(in_valid)begin
		Reg_IFM_in_1 <= In_IFM_1;
	end
	else begin
		Reg_IFM_in_1 <= Reg_IFM_in_1;
	end
end
always @(posedge clk_gate_2 or negedge rst_n) begin
	if(!rst_n)begin
		Reg_IFM_in_2 <= 8'd0;
	end
	else if(in_valid)begin
		Reg_IFM_in_2 <= In_IFM_2;
	end
	else begin
		Reg_IFM_in_2 <= Reg_IFM_in_2;
	end
end
always @(posedge clk_gate_3 or negedge rst_n) begin
	if(!rst_n)begin
		Reg_IFM_in_3 <= 8'd0;
	end
	else if(in_valid)begin
		Reg_IFM_in_3 <= In_IFM_3;
	end
	else begin
		Reg_IFM_in_3 <= Reg_IFM_in_3;
	end
end
always @(posedge clk_gate_4 or negedge rst_n) begin
	if(!rst_n)begin
		Reg_IFM_in_4 <= 8'd0;
	end
	else if(in_valid)begin
		Reg_IFM_in_4 <= In_IFM_4;
	end
	else begin
		Reg_IFM_in_4 <= Reg_IFM_in_4;
	end
end
always @(posedge clk_gate_5 or negedge rst_n) begin
	if(!rst_n)begin
		Reg_IFM_in_5 <= 8'd0;
	end
	else if(in_valid)begin
		Reg_IFM_in_5 <= In_IFM_5;
	end
	else begin
		Reg_IFM_in_5 <= Reg_IFM_in_5;
	end
end
always @(posedge clk_gate_6 or negedge rst_n) begin
	if(!rst_n)begin
		Reg_IFM_in_6 <= 8'd0;
	end
	else if(in_valid)begin
		Reg_IFM_in_6 <= In_IFM_6;
	end
	else begin
		Reg_IFM_in_6 <= Reg_IFM_in_6;
	end
end
always @(posedge clk_gate_7 or negedge rst_n) begin
	if(!rst_n)begin
		Reg_IFM_in_7 <= 8'd0;
	end
	else if(in_valid)begin
		Reg_IFM_in_7 <= In_IFM_7;
	end
	else begin
		Reg_IFM_in_7 <= Reg_IFM_in_7;
	end
end
always @(posedge clk_gate_8 or negedge rst_n) begin
	if(!rst_n)begin
		Reg_IFM_in_8 <= 8'd0;
	end
	else if(in_valid)begin
		Reg_IFM_in_8 <= In_IFM_8;
	end
	else begin
		Reg_IFM_in_8 <= Reg_IFM_in_8;
	end
end
always @(posedge clk_gate_9 or negedge rst_n) begin
	if(!rst_n)begin
		Reg_IFM_in_9 <= 8'd0;
	end
	else if(in_valid)begin
		Reg_IFM_in_9 <= In_IFM_9;
	end
	else begin
		Reg_IFM_in_9 <= Reg_IFM_in_9;
	end
end

// Receive Weight 
always @(posedge clk_gate_Weight or negedge rst_n) begin
	if(!rst_n)begin
		Reg_Weight_in_1 <= 8'd0;
	end
	else if(weight_valid)begin
		Reg_Weight_in_1 <= In_Weight_1;
	end
	else begin
		Reg_Weight_in_1 <= Reg_Weight_in_1;
	end
end
always @(posedge clk_gate_Weight or negedge rst_n) begin
	if(!rst_n)begin
		Reg_Weight_in_2 <= 8'd0;
	end
	else if(weight_valid)begin
		Reg_Weight_in_2 <= In_Weight_2;
	end
	else begin
		Reg_Weight_in_2 <= Reg_Weight_in_2;
	end
end
always @(posedge clk_gate_Weight or negedge rst_n) begin
	if(!rst_n)begin
		Reg_Weight_in_3 <= 8'd0;
	end
	else if(weight_valid)begin
		Reg_Weight_in_3 <= In_Weight_3;
	end
	else begin
		Reg_Weight_in_3 <= Reg_Weight_in_3;
	end
end
always @(posedge clk_gate_Weight or negedge rst_n) begin
	if(!rst_n)begin
		Reg_Weight_in_4 <= 8'd0;
	end
	else if(weight_valid)begin
		Reg_Weight_in_4 <= In_Weight_4;
	end
	else begin
		Reg_Weight_in_4 <= Reg_Weight_in_4;
	end
end
always @(posedge clk_gate_Weight or negedge rst_n) begin
	if(!rst_n)begin
		Reg_Weight_in_5 <= 8'd0;
	end
	else if(weight_valid)begin
		Reg_Weight_in_5 <= In_Weight_5;
	end
	else begin
		Reg_Weight_in_5 <= Reg_Weight_in_5;
	end
end
always @(posedge clk_gate_Weight or negedge rst_n) begin
	if(!rst_n)begin
		Reg_Weight_in_6 <= 8'd0;
	end
	else if(weight_valid)begin
		Reg_Weight_in_6 <= In_Weight_6;
	end
	else begin
		Reg_Weight_in_6 <= Reg_Weight_in_6;
	end
end
always @(posedge clk_gate_Weight or negedge rst_n) begin
	if(!rst_n)begin
		Reg_Weight_in_7 <= 8'd0;
	end
	else if(weight_valid)begin
		Reg_Weight_in_7 <= In_Weight_7;
	end
	else begin
		Reg_Weight_in_7 <= Reg_Weight_in_7;
	end
end
always @(posedge clk_gate_Weight or negedge rst_n) begin
	if(!rst_n)begin
		Reg_Weight_in_8 <= 8'd0;
	end
	else if(weight_valid)begin
		Reg_Weight_in_8 <= In_Weight_8;
	end
	else begin
		Reg_Weight_in_8 <= Reg_Weight_in_8;
	end
end
always @(posedge clk_gate_Weight or negedge rst_n) begin
	if(!rst_n)begin
		Reg_Weight_in_9 <= 8'd0;
	end
	else if(weight_valid)begin
		Reg_Weight_in_9 <= In_Weight_9;
	end
	else begin
		Reg_Weight_in_9 <= Reg_Weight_in_9;
	end
end


// Multiplers

always@(*)begin
	if(Enable_1_1t == 1'b1)
		MUL_1 = 16'd0;
	else 
		MUL_1 = Reg_IFM_in_1 * Reg_Weight_in_1;
end
always@(*)begin
	if(Enable_2_1t == 1'b1)
		MUL_2 = 16'd0;
	else 
		MUL_2 = Reg_IFM_in_2 * Reg_Weight_in_2;
end
always@(*)begin
	if(Enable_3_1t == 1'b1)
		MUL_3 = 16'd0;
	else 
		MUL_3 = Reg_IFM_in_3 * Reg_Weight_in_3;
end
always@(*)begin
	if(Enable_4_1t == 1'b1)
		MUL_4 = 16'd0;
	else 
		MUL_4 = Reg_IFM_in_4 * Reg_Weight_in_4;
end
always@(*)begin
	if(Enable_5_1t == 1'b1)
		MUL_5 = 16'd0;
	else 
		MUL_5 = Reg_IFM_in_5 * Reg_Weight_in_5;
end
always@(*)begin
	if(Enable_6_1t == 1'b1)
		MUL_6 = 16'd0;
	else 
		MUL_6 = Reg_IFM_in_6 * Reg_Weight_in_6;
end
always@(*)begin
	if(Enable_7_1t == 1'b1)
		MUL_7 = 16'd0;
	else 
		MUL_7 = Reg_IFM_in_7 * Reg_Weight_in_7;
end
always@(*)begin
	if(Enable_8_1t == 1'b1)
		MUL_8 = 16'd0;
	else 
		MUL_8 = Reg_IFM_in_8 * Reg_Weight_in_8;
end
always@(*)begin
	if(Enable_9_1t == 1'b1)
		MUL_9 = 16'd0;
	else 
		MUL_9 = Reg_IFM_in_9 * Reg_Weight_in_9;
end

// counter
always@(posedge clk or negedge rst_n) begin
	if(!rst_n)
		count_out <= 0;
	else if(state_cs == OUT)
		count_out <= count_out + 1;
	else
		count_out <= 0;
end


// output
always@(posedge clk or negedge rst_n) begin
	if(!rst_n)begin
		out_valid <= 0;
		Out_OFM <= 0;
	end
	else if(state_ns == IDLE)begin
		out_valid <= 0;
		Out_OFM <= 0;
	end
	else if(state_ns == OUT)begin
		out_valid <= 1;
		Out_OFM <= MUL_1 + MUL_2 + MUL_3 + MUL_4 + MUL_5 + MUL_6 + MUL_7 + MUL_8 + MUL_9;
	end
end
endmodule




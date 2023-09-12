module Convolution_with_pipeline(
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


//////////////The output port shoud be registers///////////////////////
output reg out_valid;
output reg [20:0] Out_OFM;
//////////////////////////////////////////////////////////////////////


/////////////You need use Registers to receive inputs//////////////////////
reg [7:0]IFM_1;
reg [7:0]IFM_2;
reg [7:0]IFM_3;
reg [7:0]IFM_4;
reg [7:0]IFM_5;
reg [7:0]IFM_6;
reg [7:0]IFM_7;
reg [7:0]IFM_8;
reg [7:0]IFM_9;		
reg [7:0]Weight_1;
reg [7:0]Weight_2;
reg [7:0]Weight_3;
reg [7:0]Weight_4;
reg [7:0]Weight_5;
reg [7:0]Weight_6;
reg [7:0]Weight_7;
reg [7:0]Weight_8;
reg [7:0]Weight_9;

reg [16:0]multiple1;
reg [16:0]multiple2;
reg [16:0]multiple3;
reg [16:0]multiple4;
reg [16:0]multiple5;
reg [16:0]multiple6;
reg [16:0]multiple7;
reg [16:0]multiple8;
reg [16:0]multiple9;
//reg [20:0]plus1;
//reg [20:0]plus2;
//reg [20:0]plus3;
//reg [20:0]plus4;


///////////////////////////////////////////////////////////////////////////
reg [2:0] state_cs, state_ns;
parameter IDLE = 3'd0;
parameter IN_DATA = 3'd1;
parameter EXE = 3'd2;
reg [4:0] count_out;
//reg[1:0] count = 2'b0;

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
			begin
				//if(count == 1)
					state_ns = EXE;
			end
		end
		EXE:
		begin
			if(count_out == 24)
				state_ns = IDLE;
			else 
				state_ns = EXE;
		end
		default:
			state_ns = IDLE;
	endcase
end

always@(posedge clk or negedge rst_n) begin
	if(!rst_n) begin
		Weight_1 <= 0 ;
        Weight_2 <= 0 ;
        Weight_3 <= 0 ;
        Weight_4 <= 0 ;
		Weight_5 <= 0 ;
        Weight_6 <= 0 ;
        Weight_7 <= 0 ;
        Weight_8 <= 0 ;
		Weight_9 <= 0 ;
	end
	
	else if(weight_valid) begin
		Weight_1 <= In_Weight_1;
        Weight_2 <= In_Weight_2;
        Weight_3 <= In_Weight_3;
        Weight_4 <= In_Weight_4;
		Weight_5 <= In_Weight_5;
        Weight_6 <= In_Weight_6;
        Weight_7 <= In_Weight_7;
        Weight_8 <= In_Weight_8;
		Weight_9 <= In_Weight_9;
	end
end

always@(posedge clk or negedge rst_n) begin
	if(!rst_n) begin
		IFM_1  <= 0;
        IFM_2  <= 0;
        IFM_3  <= 0;
        IFM_4  <= 0;
		IFM_5  <= 0;
        IFM_6  <= 0;
        IFM_7  <= 0;
        IFM_8  <= 0;
		IFM_9  <= 0;

	end
	
	else if(in_valid) begin
		IFM_1  <= In_IFM_1 ;
        IFM_2  <= In_IFM_2 ;
        IFM_3  <= In_IFM_3 ;
        IFM_4  <= In_IFM_4 ;
		IFM_5  <= In_IFM_5 ;
        IFM_6  <= In_IFM_6 ;
        IFM_7  <= In_IFM_7 ;
        IFM_8  <= In_IFM_8 ;
		IFM_9  <= In_IFM_9 ;

	end
end

always@(posedge clk or negedge rst_n) begin
	if(!rst_n)
		count_out <= 0;
	else if(state_cs == EXE) begin
		count_out <= count_out + 1;
	end
	else
		count_out <= 0;
end

always@(posedge clk or negedge rst_n) begin
	if(!rst_n)
		out_valid <= 0;
	else if(state_cs == EXE)
		out_valid <= 1;
	else begin
		out_valid <= 0;
	end		
end

// always@(posedge clk) begin
// 	if(state_cs == IN_DATA)
// 		count <= count + 1;	
// 	else
// 		count <= 0;	
// end

always@(posedge clk or negedge rst_n) begin
	if(!rst_n) begin
		multiple1 <= 0;
		multiple2 <= 0;
		multiple3 <= 0;
		multiple4 <= 0;
		multiple5 <= 0;
		multiple6 <= 0;
		multiple7 <= 0;
		multiple8 <= 0;
		multiple9 <= 0;	
		//plus1 <= 0;
		//plus2 <= 0;
	end
	else if(state_cs == IN_DATA) begin
		multiple1 <= IFM_1*Weight_1;
		multiple2 <= IFM_2*Weight_2;
		multiple3 <= IFM_3*Weight_3;
		multiple4 <= IFM_4*Weight_4;
		multiple5 <= IFM_5*Weight_5;
		multiple6 <= IFM_6*Weight_6;
		multiple7 <= IFM_7*Weight_7;
		multiple8 <= IFM_8*Weight_8;
		multiple9 <= IFM_9*Weight_9;
		//plus1 <= multiple1+multiple2+multiple3+multiple4+multiple5;
		//plus2 <= multiple6+multiple7+multiple8+multiple9;
	end
	else if(state_cs == EXE) begin
		multiple1 <= IFM_1*Weight_1;
		multiple2 <= IFM_2*Weight_2;
		multiple3 <= IFM_3*Weight_3;
		multiple4 <= IFM_4*Weight_4;
		multiple5 <= IFM_5*Weight_5;
		multiple6 <= IFM_6*Weight_6;
		multiple7 <= IFM_7*Weight_7;
		multiple8 <= IFM_8*Weight_8;
		multiple9 <= IFM_9*Weight_9;
		//plus1 <= multiple1+multiple2+multiple3+multiple4+multiple5;
		//plus2 <= multiple6+multiple7+multiple8+multiple9;
	end
	else begin
		multiple1 <= 0;
		multiple2 <= 0;
		multiple3 <= 0;
		multiple4 <= 0;
		multiple5 <= 0;
		multiple6 <= 0;
		multiple7 <= 0;
		multiple8 <= 0;
		multiple9 <= 0;	
		//plus1 <= 0;
		//plus2 <= 0;
	end
end

always@(posedge clk or negedge rst_n) begin
	if(!rst_n) begin
		Out_OFM <= 0;	
	end
	else if(state_cs == EXE) begin
		Out_OFM <= (multiple1+multiple2+multiple3+multiple4+multiple5+multiple6+multiple7+multiple8+multiple9);
		//Out_OFM <= plus1+plus2;
	end
	else
		Out_OFM <= 0;
end
endmodule
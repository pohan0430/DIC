module GATED_OR(
	// Input signals
	CLOCK,
	Enble,
	RST_N,
	// Output signals
	CLOCK_GATED
);
//---------------------------------------------------------------------
//   INPUT AND OUTPUT DECLARATION                         
//---------------------------------------------------------------------
input		CLOCK, Enble, RST_N;
output		CLOCK_GATED;


//---------------------------------------------------------------------
//   WIRE AND REG DECLARATION                             
//---------------------------------------------------------------------
reg latch_or_sleep;


//---------------------------------------------------------------------
//   CLOCK GATING IMPLEMENTATION                         
//---------------------------------------------------------------------
always@(*) begin
	if (!RST_N)
		latch_or_sleep = 'd0;
	else if (CLOCK)
		latch_or_sleep = Enble;
end

assign CLOCK_GATED = CLOCK | latch_or_sleep;

endmodule


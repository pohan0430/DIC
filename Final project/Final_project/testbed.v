
`timescale 10ps/1ps
`include "Pattern.v"

`ifdef RTL
  `include "adder_tree_optimize.v"
`endif

`ifdef GATE
  `include "adder_tree_optimize_SYN.v"
`endif


module TESTBED;
   //input
	wire [127:0]A;	
	//output
	wire [7:0] Output;
	
initial begin
  `ifdef RTL
    $fsdbDumpfile("adder_tree_optimize.fsdb");
    $fsdbDumpvars();
  `endif
  `ifdef GATE
    $sdf_annotate("Adder_tree_optimize.sdf",u_Adder_tree);
    $fsdbDumpfile("Adder_tree_optimize_SYN.fsdb");
    $fsdbDumpvars();    
  `endif
end

`ifdef RTL	
Adder_tree	u_Adder_tree(.A(A),.clk(clk),.Output(Output));
`endif

`ifdef GATE
Adder_tree  u_Adder_tree(.A(A),.clk(clk),.Output(Output));
`endif

Pattern	u_PATTERN_Adder_tree (.A(A),.Output(Output),.clk(clk));
		
endmodule

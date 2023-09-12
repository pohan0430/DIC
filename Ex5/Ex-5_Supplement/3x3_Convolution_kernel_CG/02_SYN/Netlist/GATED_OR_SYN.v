/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : Q-2019.12
// Date      : Fri Dec  9 17:14:33 2022
/////////////////////////////////////////////////////////////


module GATED_OR ( CLOCK, Enble, RST_N, CLOCK_GATED );
  input CLOCK, Enble, RST_N;
  output CLOCK_GATED;
  wire   latch_or_sleep, N4, N5, n1;

  // DHLx1_ASAP7_75t_R latch_or_sleep_reg ( .CLK(N4), .D(N5), .Q(latch_or_sleep)
  //        );
// 
//   NAND2xp5_ASAP7_75t_R U3 ( .A(RST_N), .B(n1), .Y(N4) );
//   INVx1_ASAP7_75t_R U4 ( .A(CLOCK), .Y(n1) );
//   AND3x1_ASAP7_75t_R U5 ( .A(Enble), .B(CLOCK), .C(RST_N), .Y(N5) );
//   OR2x2_ASAP7_75t_R U6 ( .A(CLOCK), .B(latch_or_sleep), .Y(CLOCK_GATED) );

  wire R, net0, net1, Qbar;
  INVx1_ASAP7_75t_R U4 ( .A(Enble), .Y(R) );
  NAND2xp5_ASAP7_75t_R U7 ( .A(Enble), .B(CLOCK), .Y(net0) );
  NAND2xp5_ASAP7_75t_R U8 ( .A(CLOCK), .B(R), .Y(net1) );
  NAND2xp5_ASAP7_75t_R U9 ( .A(net0), .B(Qbar), .Y(latch_or_sleep) );
  NAND2xp5_ASAP7_75t_R U10 ( .A(latch_or_sleep), .B(net1), .Y(Qbar) );
  OR2x2_ASAP7_75t_R U6 ( .A(CLOCK), .B(latch_or_sleep), .Y(CLOCK_GATED) );


// 
//   TLATRX1_ASAP7_75t_R latch_or_sleep_reg ( .G(CLOCK), .D(EnableL), .RN(RST_N), .Q(
//         latch_or_sleep) );
//   OR2x2_ASAP7_75t_R U4 ( .A(CLOCK), .B(latch_or_sleep), .Y(CLOCK_GATED) );


endmodule


*****************************
**     Library setting     **
*****************************
.protect
.include '7nm_TT.pm'
.include 'asap7sc7p5t_AO_RVT.sp'
.include 'asap7sc7p5t_INVBUF_RVT.sp'
.include 'asap7sc7p5t_OA_RVT.sp'
.include 'asap7sc7p5t_SEQ_RVT.sp'
.include 'asap7sc7p5t_SIMPLE_RVT.sp'
.include 'adder_tree_optimize_SYN_new.sp'
.unprotect


.VEC "Pattern_power.vec"
*.VEC "Pattern_critical_path.vec"
*****************************
**     Voltage Source      **
*****************************
.global VDD GND
Vvdd VDD GND 0.7v
Vvss VSS GND 0 0
VCLK    CLK 	GND    PULSE(0  0.7v  0.3n  0.05n 0.05n  0.15n  0.4n)

.SUBCKT inverter in out 
Mp1 out in VDD x pmos_lvt m=3
Mn1 out in GND x nmos_lvt m=3
.ENDS
.SUBCKT inv_buffer in out 
Xinv1 in mid inverter
Xinv2 mid out inverter
.ENDS



*********Inputs(please use these signals as inputs for your desing)*********************************
*Xbuf_A A A_in inv_buffer
*Xbuf_B B B_in inv_buffer
*Xbuf_C Cin Cin_buf inv_buffer
****************************************************************************************************


******************************************
**      Your Circuit  (adder_tree)      **
******************************************

Xadder VSS VDD  A[127] A[126] A[125] A[124] A[123] A[122] A[121] A[120] A[119] A[118] A[117] A[116] A[115] A[114] A[113] A[112] A[111] A[110] A[109] A[108] A[107] A[106] A[105] A[104] A[103] A[102] A[101] A[100] A[99] A[98] A[97] A[96] A[95] A[94] A[93] A[92] A[91] A[90] A[89] A[88] A[87] A[86] A[85] A[84] A[83] A[82] A[81] A[80] A[79] A[78] A[77] A[76] A[75] A[74] A[73] A[72] A[71] A[70] A[69] A[68] A[67] A[66] A[65] A[64] A[63] A[62] A[61] A[60] A[59] A[58] A[57] A[56] A[55] A[54] A[53] A[52] A[51] A[50] A[49] A[48] A[47] A[46] A[45] A[44] A[43] A[42] A[41] A[40] A[39] A[38] A[37] A[36] A[35] A[34] A[33] A[32] A[31] A[30] A[29] A[28] A[27] A[26] A[25] A[24] A[23] A[22] A[21] A[20] A[19] A[18] A[17] A[16] A[15] A[14] A[13] A[12] A[11] A[10] A[9] A[8] A[7] A[6] A[5] A[4] A[3] A[2] A[1] A[0] clk Output[7] Output[6] Output[5] Output[4] Output[3] Output[2] Output[1] Output[0] Adder_tree






*********Outputs (please note the name of the output ports)******************
Cload0 Output[0] GND 3f
Cload1 Output[1] GND 3f
Cload2 Output[2] GND 3f
Cload3 Output[3] GND 3f
Cload4 Output[4] GND 3f
Cload5 Output[5] GND 3f
Cload6 Output[6] GND 3f
Cload7 Output[7] GND 3f
*****************************************************************************


.tran 0.01ns 35ns
*****************************
**    Simulator setting    **
*****************************
.option post 
.options probe			*with I/V in .lis
.probe v(*) i(*)
.option captab			*with cap value in .lis
.TEMP 25
.op


*****************************
**         Measure         **
*****************************
.measure pwr avg power
.meas tran tr TRIG V(A[0]) VAL='0.35' rise=2  TARG V(Output[7]) VAL='0.35' rise=1
.meas tran tf TRIG V(A[0]) VAL='0.35' fall=2  TARG V(Output[7]) VAL='0.35' fall=2
.meas tran critical_delay  param='(tr+tf)*0.5'
.meas pwr avg Power
.end

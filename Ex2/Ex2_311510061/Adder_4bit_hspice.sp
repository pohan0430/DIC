.TITLE Ex_2_3

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
.unprotect

.VEC "Pattern_adder_4bit.vec"
.include 'Adder_4bit_SYN_new.sp'

*****************************
**     Voltage Source      **
*****************************
.global VDD GND
Vvdd VDD GND 0.7v
Vvss VSS GND 0 0

******************************************
**      Your Circuit  (1-bit adder)     **
******************************************
XAdder_4bit VSS VDD  A[3] A[2] A[1] A[0] B[3] B[2] B[1] B[0] sum[3] sum[2] sum[1] sum[0] carry Adder_4bit


*********Outputs (please note the name of the output ports)******************
Cload1 carry GND 5f
Cload2 sum1  GND 5f
Cload3 sum2  GND 5f
Cload4 sum3  GND 5f
Cload5 sum4  GND 5f
*****************************************************************************


.tran 0.1ps 12.8ns
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
.measure TRAN Tr1 TRIG V(B[0])  VAL=0.35 RISE=2 TARG V(carry) VAL=0.35 RISE=2
.measure TRAN Tf1 TRIG V(B[0])  VAL=0.35 FALL=2 TARG V(carry) VAL=0.35 FALL=2
.measure TRAN Tpd1  param='(Tr1+Tf1)*0.5'
.measure TRAN Tr2 TRIG V(B[0])  VAL=0.35 RISE=4 TARG V(carry) VAL=0.35 RISE=4
.measure TRAN Tf2 TRIG V(B[0])  VAL=0.35 FALL=4 TARG V(carry) VAL=0.35 FALL=4
.measure TRAN Tpd2  param='(Tr2+Tf2)*0.5'
.measure TRAN Tr3 TRIG V(B[0])  VAL=0.35 RISE=6 TARG V(carry) VAL=0.35 RISE=6
.measure TRAN Tf3 TRIG V(B[0])  VAL=0.35 FALL=6 TARG V(carry) VAL=0.35 FALL=6
.measure TRAN Tpd3  param='(Tr3+Tf3)*0.5'
.measure TRAN Tr4 TRIG V(B[0])  VAL=0.35 RISE=8 TARG V(carry) VAL=0.35 RISE=8
.measure TRAN Tf4 TRIG V(B[0])  VAL=0.35 FALL=8 TARG V(carry) VAL=0.35 FALL=8
.measure TRAN Tpd4  param='(Tr4+Tf4)*0.5'
.measure TRAN Tr5 TRIG V(B[0])  VAL=0.35 RISE=10 TARG V(carry) VAL=0.35 RISE=10
.measure TRAN Tf5 TRIG V(B[0])  VAL=0.35 FALL=10 TARG V(carry) VAL=0.35 FALL=10
.measure TRAN Tpd5  param='(Tr5+Tf5)*0.5'
.measure TRAN Tr6 TRIG V(B[0])  VAL=0.35 RISE=12 TARG V(carry) VAL=0.35 RISE=12
.measure TRAN Tf6 TRIG V(B[0])  VAL=0.35 FALL=12 TARG V(carry) VAL=0.35 FALL=12
.measure TRAN Tpd6  param='(Tr6+Tf6)*0.5'
.measure TRAN Tr7 TRIG V(B[0])  VAL=0.35 RISE=14 TARG V(carry) VAL=0.35 RISE=14
.measure TRAN Tf7 TRIG V(B[0])  VAL=0.35 FALL=14 TARG V(carry) VAL=0.35 FALL=14
.measure TRAN Tpd7  param='(Tr7+Tf7)*0.5'
.measure TRAN Tr8 TRIG V(B[0])  VAL=0.35 RISE=15 TARG V(carry) VAL=0.35 RISE=15
.measure TRAN Tf8 TRIG V(B[0])  VAL=0.35 FALL=15 TARG V(carry) VAL=0.35 FALL=15
.measure TRAN Tpd8  param='(Tr8+Tf8)*0.5'
.measure pwr avg power



.end


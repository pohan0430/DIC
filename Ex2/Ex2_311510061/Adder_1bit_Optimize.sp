.TITLE Ex_2_1

*****************************
**     Library setting     **
*****************************
.protect
.include '7nm_TT.pm'
.unprotect


.include "Measure.sp"
.VEC "Pattern_adder_1bit.vec"

*****************************
**     Voltage Source      **
*****************************
.global VDD GND
Vvdd VDD GND 0.7v
Vvss VSS GND 0 0


.SUBCKT inverter in out 
Mp1 out in VDD x pmos_lvt m=3
Mn1 out in GND x nmos_lvt m=3
.ENDS
.SUBCKT inv_buffer in out 
Xinv1 in mid inverter
Xinv2 mid out inverter
.ENDS



*********Inputs(please use these signals as inputs for your desing)*********************************
Xbuf_A A A_in inv_buffer
Xbuf_B B B_in inv_buffer
Xbuf_C Cin Cin_buf inv_buffer
****************************************************************************************************


******************************************
**      Your Circuit  (1-bit adder)     **
******************************************
Mn1 sum Cin_buf wire1 wire1 nmos_lvt         m=1
Mn2 wire1 B_in A_in A_in nmos_lvt            m=1
Mn3 wire1 A_in B_in B_in nmos_lvt            m=3
Mn4 Carry_out wire1 A_in A_in nmos_lvt       m=3
Mn5 wire2 wire1 Vss Vss nmos_lvt             m=3
Mn6 Carry_out wire2 Cin_buf Cin_buf nmos_lvt m=1
Mn7 sum wire1 Cin_buf Cin_buf nmos_lvt       m=3

Mp1 sum Cin_buf wire2 wire2 pmos_lvt         m=3
Mp2 sum wire2 Cin_buf Cin_buf pmos_lvt       m=1
Mp3 Carry_out wire1 Cin_buf Cin_buf pmos_lvt m=1
Mp4 Carry_out wire2 A_in A_in pmos_lvt       m=3
Mp5 wire1 wire2 Vdd Vdd   pmos_lvt           m=3
Mp6 wire2 A_in B_in B_in pmos_lvt            m=1
Mp7 wire2 B_in A_in A_in pmos_lvt            m=3


*********Outputs (please note the name of the output ports)******************
Cload1 Carry_out GND 5f
Cload2 Sum  GND 5f
*****************************************************************************


.tran 0.1ps 6ns
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

.end

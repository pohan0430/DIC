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

MM13 Sum net7 VDD VDD pmos_lvt m=3
MM12 net7 A_in net11 net11 pmos_lvt m=3
MM11 net11 B_in net10 net10 pmos_lvt m=3
MM10 net10 Cin_buf VDD VDD pmos_lvt m=3
MM9 net7 net3 net2 net2 pmos_lvt m=3
MM8 net2 Cin_buf VDD VDD pmos_lvt m=3
MM7 net2 B_in VDD VDD pmos_lvt m=3
MM6 net2 A_in VDD VDD pmos_lvt m=3
MM5 Carry_out net3 VDD VDD pmos_lvt m=3
MM4 net3 A_in net4 net14 pmos_lvt m=3
MM3 net4 B_in VDD VDD pmos_lvt m=3
MM2 net3 Cin_buf net8 net8 pmos_lvt m=3
MM1 net8 B_in VDD VDD pmos_lvt m=3
MM0 net8 A_in VDD VDD pmos_lvt m=3
MM27 Sum net7 VSS VSS nmos_lvt m=3
MM26 net13 Cin_buf VSS VSS nmos_lvt m=3
MM25 net12 B_in net13 net13 nmos_lvt m=3
MM24 net7 A_in net12 net12 nmos_lvt m=3
MM23 net1 Cin_buf VSS VSS nmos_lvt m=3
MM22 net1 B_in VSS VSS nmos_lvt m=3
MM21 net1 A_in VSS VSS nmos_lvt m=3
MM20 net7 net3 net1 net1 nmos_lvt m=3
MM19 Carry_out net3 VSS VSS nmos_lvt m=3
MM18 net6 B_in VSS VSS nmos_lvt m=3
MM17 net3 A_in net6 net6 nmos_lvt m=3
MM16 net5 B_in VSS VSS nmos_lvt m=3
MM15 net5 A_in VSS VSS nmos_lvt m=3
MM14 net3 Cin_buf net5 net5 nmos_lvt m=3

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

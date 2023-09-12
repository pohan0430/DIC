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
.include 'Convolution_SYN_new.sp'
**** Input Vector ****
.VEC 'Pattern.vec'
.unprotect

*****************************
**     Voltage Source      **
*****************************
.param vol=0.7
Vvdd VDD GND vol
Vvss VSS GND 0 0

**********************************************
**      Your Circuit  (Convolution 2x2)     **
**********************************************
.SUBCKT inverter in out 
Mp1 out in VDD x pmos_lvt m=3
Mn1 out in GND x nmos_lvt m=3
.ENDS
.SUBCKT inv_buffer in out 
Xinv1 in mid inverter
Xinv2 mid out inverter
.ENDS

*Xbuf_1 IFM_0[3] IFM_0_BUF[3] inv_buffer
*Xbuf_2 IFM_0[2] IFM_0_BUF[2] inv_buffer
*Xbuf_3 IFM_0[1] IFM_0_BUF[1] inv_buffer
*Xbuf_4 IFM_0[0] IFM_0_BUF[0] inv_buffer
*Xbuf_5 IFM_1[3] IFM_1_BUF[3] inv_buffer
*Xbuf_6 IFM_1[2] IFM_1_BUF[2] inv_buffer
*Xbuf_7 IFM_1[1] IFM_1_BUF[1] inv_buffer
*Xbuf_8 IFM_1[0] IFM_1_BUF[0] inv_buffer
*Xbuf_9 IFM_2[3] IFM_2_BUF[3] inv_buffer
*Xbuf_10 IFM_2[2] IFM_2_BUF[2] inv_buffer
*Xbuf_11 IFM_2[1] IFM_2_BUF[1] inv_buffer
*Xbuf_12 IFM_2[0] IFM_2_BUF[0] inv_buffer
*Xbuf_13 IFM_3[3] IFM_3_BUF[3] inv_buffer
*Xbuf_14 IFM_3[2] IFM_3_BUF[2] inv_buffer
*Xbuf_15 IFM_3[1] IFM_3_BUF[1] inv_buffer
*Xbuf_16 IFM_3[0] IFM_3_BUF[0] inv_buffer
*Xbuf_17 INW_0[3] INW_0_BUF[3] inv_buffer
*Xbuf_18 INW_0[2] INW_0_BUF[2] inv_buffer
*Xbuf_19 INW_0[1] INW_0_BUF[1] inv_buffer
*Xbuf_20 INW_0[0] INW_0_BUF[0] inv_buffer
*Xbuf_21 INW_1[3] INW_1_BUF[3] inv_buffer
*Xbuf_22 INW_1[2] INW_1_BUF[2] inv_buffer
*Xbuf_23 INW_1[1] INW_1_BUF[1] inv_buffer
*Xbuf_24 INW_1[0] INW_1_BUF[0] inv_buffer
*Xbuf_25 INW_2[3] INW_2_BUF[3] inv_buffer
*Xbuf_26 INW_2[2] INW_2_BUF[2] inv_buffer
*Xbuf_27 INW_2[1] INW_2_BUF[1] inv_buffer
*Xbuf_28 INW_2[0] INW_2_BUF[0] inv_buffer
*Xbuf_29 INW_3[3] INW_3_BUF[3] inv_buffer
*Xbuf_30 INW_3[2] INW_3_BUF[2] inv_buffer
*Xbuf_31 INW_3[1] INW_3_BUF[1] inv_buffer
*Xbuf_32 INW_3[0] INW_3_BUF[0] inv_buffer

XConvolution VSS VDD  IFM_0[3] IFM_0[2] IFM_0[1] IFM_0[0] IFM_1[3] IFM_1[2] IFM_1[1] IFM_1[0] IFM_2[3] IFM_2[2] IFM_2[1] IFM_2[0] IFM_3[3] IFM_3[2] IFM_3[1] IFM_3[0] INW_0[3] INW_0[2] INW_0[1] INW_0[0] INW_1[3] INW_1[2] INW_1[1] INW_1[0] INW_2[3] INW_2[2] INW_2[1] INW_2[0] INW_3[3] INW_3[2] INW_3[1] INW_3[0] Output[9] Output[8] Output[7] Output[6] Output[5] Output[4] Output[3] Output[2] Output[1] Output[0] Convolution

C0 Output[0] gnd 3f
C1 Output[1] gnd 3f
C2 Output[2] gnd 3f
C3 Output[3] gnd 3f
C4 Output[4] gnd 3f
C5 Output[5] gnd 3f
C6 Output[6] gnd 3f
C7 Output[7] gnd 3f
C8 Output[8] gnd 3f
C9 Output[9] gnd 3f

.tran 0.1ps 16ns
*****************************
**    Simulator setting    **
*****************************
.option post 
.TEMP 25
.op

*****************************
**         Measure         **
*****************************
.meas tran Tr_critical Trig V(IFM_3[0]) Val='0.5*vol' fall=2  
+                 Targ V(Output[8]) Val='0.5*vol' rise=2
.meas tran Tf_critical Trig V(IFM_3[0]) Val='0.5*vol' rise=2  
+                 Targ V(Output[8]) Val='0.5*vol' fall=2
.meas tran critical_delay  param ='(Tr_critical + Tf_critical)*0.5'

.meas tran pwr avg POWER

.end


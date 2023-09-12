***Voltage Transfer Curve***

.protect
.include 'asap7sc7p5t_INVBUF_RVT.sp'
.include '7nm_TT.pm'
.unprotect

.temp 25
.global vdd gnd vss

.option post  

Vvdd vdd 0 dc=0v
Vgnd gnd 0 dc=0v
Vvss vss 0 dc=0v
vin in gnd 0

***subckt***
Xinv_smallest VSS VDD in smallest_out INVxp33_ASAP7_75t_R
Xinv_largest VSS VDD in largest_out INVx13_ASAP7_75t_R

.dc vin 0 0.7 0.001 sweep vvdd 0.4 0.7 0.1

.probe dc v(smallest_out)
.probe dc v(largest_out)

.op
.end

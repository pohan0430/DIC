***CMOS***

.protect
.include '16mos.pm'
.include '7nm_TT.pm'
.unprotect

.temp 25
.global vdd gnd

.option post  

*.param wtest=16n
*.param mtest=1

Vvdd vdd 0 dc=0.7v
Vgnd gnd 0 dc=0v
vin in gnd 0

***mos***
m_nmos out_mos in gnd gnd nmos w=16n l=16n m=1
m_pmos out_mos in vdd vdd pmos w=29.7n l=16n m=1

***finfet***
m_nfinfet out_finfet in gnd gnd nmos_rvt m=3
m_pfinfet out_finfet in vdd vdd pmos_rvt m=4

*.dc vin 0 0.7 0.001 sweep wtest 16n 30n 0.1n 
*.dc vin 0 0.7 0.001 sweep mtest 1 15 1
.dc vin 0 0.7 0.001

***I_mos***
.probe dc i(m_nmos)
.probe dc i(m_pmos)

***I_finfet***
.probe dc i(m_nfinfet)
.probe dc i(m_pfinfet)

.op
.end

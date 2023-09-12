***FinFET***

.protect
.include '7nm_TT.pm'
.unprotect

.temp 25
.global vdd gnd
.option post  

Vvdd vdd 0 dc=0.7v
Vgnd gnd 0 dc=0v
vin in gnd 0

m_nfinfet vdd in gnd gnd nmos_rvt m=1
m_pfinfet gnd in vdd vdd pmos_rvt m=1

.dc vin 0 0.7 0.001

.probe dc i(m_nfinfet)
.probe dc i(m_pfinfet)

.op
.end

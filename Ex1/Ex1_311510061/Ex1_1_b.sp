***planar MOS***

.protect
.include '16mos.pm'
.unprotect

.temp 25
.global vdd gnd
 
.option post  

Vvdd vdd 0 dc=0.7v
Vgnd gnd 0 dc=0v
vin in gnd 0

m_nmos vdd in gnd gnd nmos w=16n l=16n m=1
m_pmos gnd in vdd vdd pmos w=16n l=16n m=1

.dc vin 0 0.7 0.001

.probe dc i(m_nmos)
.probe dc i(m_pmos)

.op
.end

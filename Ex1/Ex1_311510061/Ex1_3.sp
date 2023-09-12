***Characteristics of Inverter/NAND2***

.protect
.include 'asap7sc7p5t_INVBUF_RVT.sp'
.include 'asap7sc7p5t_SIMPLE_RVT.sp'
.include '7nm_TT.pm'
.unprotect

.temp 25
.global vdd gnd vss

.tran 1p 100n
.option post  

Vvdd vdd 0 dc=0.7v
Vgnd gnd 0 dc=0v
Vvss vss 0 dc=0v

Vin_a in_a gnd pulse(0 0.7 5n 1n 1n 3n 8n)
Vin_b in_b gnd pulse(0 0.7 3n 20p 20p 12n 28n)

***subckt***
Xnand2_smallest VSS VDD in_a in_b out NAND2xp33_ASAP7_75t_R
Xinv_FO4_1 VSS VDD out gnd INVxp33_ASAP7_75t_R
Xinv_FO4_2 VSS VDD out gnd INVxp33_ASAP7_75t_R
Xinv_FO4_3 VSS VDD out gnd INVxp33_ASAP7_75t_R
Xinv_FO4_4 VSS VDD out gnd INVxp33_ASAP7_75t_R
Cload out gnd 10f

***Measurement***
.meas tran Vmax MAX v(out) FROM=0n TO=100n
.meas tran Vmin MIN v(out) FROM=0n TO=100n

.meas tran Tphl_a Trig v(in_a) val=0.35v rise=1
+                 Targ v(out) val=0.35v fall=1
.meas tran Tphl_b Trig v(in_b) val=0.35v rise=2
+                 Targ v(out) val=0.35v fall=3
.meas tran Tplh_a Trig v(in_a) val=0.35v fall=1
+                 Targ v(out) val=0.35v rise=1
.meas tran Tplh_b Trig v(in_b) val=0.35v fall=1
+                 Targ v(out) val=0.35v rise=2
.meas tran Tr     Trig v(out) val='Vmin+0.1*Vmax' rise=4
+                 Targ v(out) val='0.9*Vmax' rise=4
.meas Tran Tf     Trig v(out) val='0.9*Vmax' fall=4
+                 Targ v(out) val='Vmin+0.1*Vmax' fall=4
.meas pwr avg POWER

.op
.end

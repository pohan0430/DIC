###################################################################

# Created by write_sdc on Tue Dec 13 03:57:13 2022

###################################################################
set sdc_version 2.1

set_units -time ns -resistance 1.000000e+04kOhm -capacitance 1.000000e-04pF    \
-voltage V -current uA
set_load -pin_load 0.05 [get_ports CLOCK_GATED]
set_max_delay 3000  -from [list [get_ports CLOCK] [get_ports Enble] [get_ports RST_N]]  -to [get_ports CLOCK_GATED]

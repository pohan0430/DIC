# #======================================================
# #
# # PrimeTime  Scripts (dctcl mode)
# #
# #======================================================

# #======================================================
# #  1. Set the Power Analysis Mode
# #======================================================

# set power_enable_analysis true
# set power_analysis_mode time_based
# set power_report_leakage_breakdowns true
# set power_clock_network_include_register_clock_pin_power false

# #======================================================
# #  2. Read and link the design
# #======================================================

# # set search_path {
#        # ./../02_SYN/Netlist \
#        # ./NLDM \
#        # /usr/cad/synopsys/synthesis/cur/libraries/syn/ }  
# # set link_library {dw_foundation.sldb }
# # set synthetic_library { asap7sc7p5t_AO_RVT_TT_08302018.db asap7sc7p5t_OA_RVT_TT_08302018.db asap7sc7p5t_INVBUF_RVT_TT_08302018.db asap7sc7p5t_SEQ_RVT_TT_08302018.db asap7sc7p5t_SIMPLE_RVT_TT_08302018.db asap7sc7p5t_AO_RVT_TT_08302018.db  asap7sc7p5t_OA_RVT_TT_08302018.db}
# # set target_library {asap7sc7p5t_INVBUF_RVT_TT_08302018.db asap7sc7p5t_SIMPLE_RVT_TT_08302018.db asap7sc7p5t_SEQ_RVT_TT_08302018.db }

  
# set search_path {  ./../01_RTL \
              
#               /usr/cad/7nm_NLDM/ \
#               /usr/cad/synopsys/synthesis/2019.12/libraries/syn/ }
                               
# set synthetic_library {dw_foundation.sldb}
# #set link_library {* dw_foundation.sldb standard.sldb sc9_cln40g_base_rvt_ss_typical_max_0p81v_125c.db}
# #set target_library {sc9_cln40g_base_rvt_ss_typical_max_0p81v_125c.db} 
# #set link_library {* dw_foundation.sldb standard.sldb sc9_cln40g_base_rvt_tt_typical_max_0p90v_25c.db}
# #set target_library {sc9_cln40g_base_rvt_tt_typical_max_0p90v_25c.db}  
# set link_library {* dw_foundation.sldb standard.sldb asap7sc7p5t_AO_RVT_TT_08302018.db asap7sc7p5t_OA_RVT_TT_08302018.db asap7sc7p5t_INVBUF_RVT_TT_08302018.db asap7sc7p5t_SEQ_RVT_TT_08302018.db asap7sc7p5t_SIMPLE_RVT_TT_08302018.db asap7sc7p5t_AO_RVT_TT_08302018.db  asap7sc7p5t_OA_RVT_TT_08302018.db}
# set target_library {asap7sc7p5t_INVBUF_RVT_TT_08302018.db asap7sc7p5t_SIMPLE_RVT_TT_08302018.db asap7sc7p5t_SEQ_RVT_TT_08302018.db} 


# set DESIGN "Convolution"
# set hdlin_auto_save_templates TRUE
# read_verilog ../02_SYN/Netlist/$DESIGN\_SYN.v
# # analyze -f verilog $DESIGN\_SYN.v
# # elaborate $DESIGN
# current_design $DESIGN
# link


# #======================================================
# #  3. Set transition time / annotate parasitics
# #======================================================
# set_input_transition .1 [all_inputs]
# read_sdc ./File/$DESIGN\_SYN.sdc
# read_sdf -load_delay net ./File/$DESIGN\_SYN.sdf

# #======================================================
# #  4. Read Switching Activity File
# #======================================================
# read_vcd -strip_path TESTBED/I_$DESIGN File/$DESIGN\_SYN.fsdb


# #======================================================
# #  5. Perform power analysis
# #======================================================
# check_power
# update_power

# #======================================================
# #  6. Generate Power Report
# #======================================================
# # BUG command 

# set_power_analysis_options -waveform_interval 1 -waveform_format out -waveform_output vcd
# # vcd.out
# report_power > Report/$DESIGN\_POWER 
 

# exit





#======================================================
#
# PrimeTime  Scripts (dctcl mode)
#
#======================================================

#======================================================
#  1. Set the Power Analysis Mode
#======================================================

set power_enable_analysis true
set power_analysis_mode time_based
set power_report_leakage_breakdowns true
set power_clock_network_include_register_clock_pin_power false

#======================================================
#  2. Read and link the design
#======================================================


set search_path {    ./../01_RTL \
                     
                     /usr/cad/7nm_NLDM/ \
                     /usr/cad/synopsys/synthesis/2019.12/libraries/syn/ }
                               
set synthetic_library {dw_foundation.sldb}
set link_library {* dw_foundation.sldb standard.sldb asap7sc7p5t_AO_RVT_TT_08302018.db asap7sc7p5t_OA_RVT_TT_08302018.db asap7sc7p5t_INVBUF_RVT_TT_08302018.db asap7sc7p5t_SEQ_RVT_TT_08302018.db asap7sc7p5t_SIMPLE_RVT_TT_08302018.db asap7sc7p5t_AO_RVT_TT_08302018.db  asap7sc7p5t_OA_RVT_TT_08302018.db}
set target_library {asap7sc7p5t_INVBUF_RVT_TT_08302018.db asap7sc7p5t_SIMPLE_RVT_TT_08302018.db asap7sc7p5t_SEQ_RVT_TT_08302018.db} 



set DESIGN "Convolution"

read_verilog ../02_SYN/Netlist/$DESIGN\_SYN.v
current_design $DESIGN
link

#======================================================
#  3. Set transition time / annotate parasitics
#======================================================
set_input_transition .1 [all_inputs]
read_sdc ../02_SYN/Netlist/$DESIGN\_SYN.sdc
read_sdf -load_delay net ../02_SYN/Netlist/$DESIGN\_SYN.sdf

#======================================================
#  4. Read Switching Activity File
#======================================================
read_vcd -strip_path TESTBED/u_$DESIGN ../03_GATE_SIM/$DESIGN\_SYN.fsdb

#======================================================
#  5. Perform power analysis
#======================================================
check_power
update_power

#======================================================
#  6. Generate Power Report
#======================================================
# BUG command 

set_power_analysis_options -waveform_interval 1 -waveform_format out -waveform_output vcd
# vcd.out
report_power > Report/$DESIGN\_new\_POWER_7nm 
report_power 

exit

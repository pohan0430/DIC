#======================================================
#
# Synopsys Synthesis Scripts (Design Vision dctcl mode)
#
#======================================================

#======================================================
#  Set Libraries
#======================================================

set search_path {    ./../01_RTL \
                     
                     /usr/cad/7nm_NLDM/ \
                     /usr/cad/synopsys/synthesis/2019.12/libraries/syn/ }
                               
set synthetic_library {dw_foundation.sldb}
set link_library {* dw_foundation.sldb standard.sldb asap7sc7p5t_AO_RVT_TT_08302018.db asap7sc7p5t_OA_RVT_TT_08302018.db asap7sc7p5t_INVBUF_RVT_TT_08302018.db asap7sc7p5t_SEQ_RVT_TT_08302018.db asap7sc7p5t_SIMPLE_RVT_TT_08302018.db asap7sc7p5t_AO_RVT_TT_08302018.db  asap7sc7p5t_OA_RVT_TT_08302018.db}
set target_library {asap7sc7p5t_INVBUF_RVT_TT_08302018.db asap7sc7p5t_SIMPLE_RVT_TT_08302018.db asap7sc7p5t_SEQ_RVT_TT_08302018.db} 



#======================================================
#  Global Parameters
#======================================================
set DESIGN "Convolution"
# set clock_gating_module_name "GATED_OR"
set CLK_period 2000.0
set IN_DLY  [expr 0.5*$CLK_period]
set OUT_DLY [expr 0.5*$CLK_period]

#======================================================
#  Read RTL Code
#======================================================
set hdlin_auto_save_templates TRUE
# read_verilog {./Netlist/$clock_gating_module_name\_SYN.v}
# set_dont_touch $clock_gating_module_name
read_sverilog {$DESIGN\.v}
current_design $DESIGN
link > Report/$DESIGN\.link


#======================================================
#  Set Design Constraints
#======================================================

create_clock -name "clk" -period $CLK_period clk 
set_input_delay  [ expr $CLK_period*0.5 ] -clock clk [all_inputs]
set_output_delay [ expr $CLK_period*0.5 ] -clock clk [all_outputs]
set_input_delay 0 -clock clk clk
set_input_delay 0 -clock clk rst_n
# set_input_delay 0 -clock clk cg_en

set_load 0.05 [all_outputs]
set_max_delay $CLK_period -from [all_inputs] -to [all_outputs]

# set_dont_use slow/JKFF*
#======================================================
#  Optimization
#======================================================
check_design > Report/$DESIGN\.check
uniquify
set_fix_multiple_port_nets -all -buffer_constants

current_design $DESIGN
# set_false_path -from clk -to [get_cells */U7 ]
# set_false_path -from clk -to [get_cells */U8 ]
# set_false_path -from clk -to [get_cells */U6 ]

#uniquify
compile_ultra

#======================================================
#  Output Reports 
#======================================================
report_timing >  Report/$DESIGN\.timing
report_area >  Report/$DESIGN\.area
report_resource >  Report/$DESIGN\.resource

#======================================================
#  Change Naming Rule
#======================================================
set bus_inference_style "%s\[%d\]"
set bus_naming_style "%s\[%d\]"
set hdlout_internal_busses true
change_names -hierarchy -rule verilog
define_name_rules name_rule -allowed "a-z A-Z 0-9 _" -max_length 255 -type cell
define_name_rules name_rule -allowed "a-z A-Z 0-9 _[]" -max_length 255 -type net
define_name_rules name_rule -map {{"\\*cell\\*" "cell"}}
change_names -hierarchy -rules name_rule

#======================================================
#  Output Results
#======================================================

set verilogout_higher_designs_first true
write -format verilog -output Netlist/$DESIGN\_SYN.v -hierarchy

#set_annotated_delay 0 -cell -to [get_pins -filter "pin_direction == out" -of_objects [get_cells "GATED_*/U*" -filter "ref_name==OR2x2_ASAP7_75t_R"]]
#set_annotated_delay 0 -cell -to [get_pins -filter "pin_direction == out" -of_objects [get_cells "GATED_*/U*" -filter "ref_name==NAND2xp5_ASAP7_75t_R"]]
#set_annotated_delay 0 -cell -to [get_pins -filter "pin_direction == out" -of_objects [get_cells "GATED_*/U*" -filter "ref_name==INVx1_ASAP7_75t_R"]]

write_sdf -version 3.0 -context verilog -load_delay cell Netlist/$DESIGN\_SYN.sdf -significant_digits 6
write_sdc Netlist/$DESIGN\_SYN.sdc

#======================================================
#  Finish and Quit
#======================================================
report_area
report_timing
exit

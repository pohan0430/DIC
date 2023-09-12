
*PAT1
.measure TRAN T_astart_cout_1 TRIG V(a_in)    VAL=0.35 RISE=5 TARG V(carry_out) VAL=0.35 RISE=3
.measure TRAN T_bstart_cout_1 TRIG V(b_in)    VAL=0.35 RISE=3 TARG V(carry_out) VAL=0.35 RISE=3
.measure TRAN T_cstart_cout_1 TRIG V(cin_buf) VAL=0.35 RISE=2 TARG V(carry_out) VAL=0.35 RISE=3
.measure TRAN T_astart_sum_1  TRIG V(a_in)    VAL=0.35 RISE=5 TARG V(sum) VAL=0.35 RISE=4
.measure TRAN T_bstart_sum_1  TRIG V(b_in)    VAL=0.35 RISE=3 TARG V(sum) VAL=0.35 RISE=4
.measure TRAN T_cstart_sum_1  TRIG V(cin_buf) VAL=0.35 RISE=2 TARG V(sum) VAL=0.35 RISE=4
.measure TRAN T_aend_cout_1 TRIG V(a_in)    VAL=0.35 FALL=5 TARG V(carry_out) VAL=0.35 FALL=3
.measure TRAN T_bend_cout_1 TRIG V(b_in)    VAL=0.35 FALL=3 TARG V(carry_out) VAL=0.35 FALL=3
.measure TRAN T_cend_cout_1 TRIG V(cin_buf) VAL=0.35 FALL=2 TARG V(carry_out) VAL=0.35 FALL=3
.measure TRAN T_aend_sum_1  TRIG V(a_in)    VAL=0.35 FALL=5 TARG V(sum) VAL=0.35 FALL=4
.measure TRAN T_bend_sum_1  TRIG V(b_in)    VAL=0.35 FALL=3 TARG V(sum) VAL=0.35 FALL=4
.measure TRAN T_cend_sum_1  TRIG V(cin_buf) VAL=0.35 FALL=2 TARG V(sum) VAL=0.35 FALL=4
.measure tran T_pat1_a_s1  param='max(T_astart_cout_1,T_astart_sum_1)'
.measure tran T_pat1_b_s1  param='max(T_bstart_cout_1,T_bstart_sum_1)'
.measure tran T_pat1_c_s1  param='max(T_cstart_cout_1,T_cstart_sum_1)'
.measure tran T_pat1_a_e1  param='max(T_aend_cout_1,T_aend_sum_1)'
.measure tran T_pat1_b_e1  param='max(T_bend_cout_1,T_bend_sum_1)'
.measure tran T_pat1_c_e1  param='max(T_cend_cout_1,T_cend_sum_1)'
.measure tran T_pat1_a  param='max(T_pat1_a_s1,T_pat1_a_e1)'
.measure tran T_pat1_b  param='max(T_pat1_b_s1,T_pat1_b_e1)'
.measure tran T_pat1_c  param='max(T_pat1_c_s1,T_pat1_c_e1)'
.measure tran T_pat1      param='max(T_pat1_a,T_pat1_b)'

*PAT2
.measure TRAN T_astart_cout_2 TRIG V(a_in)    VAL=0.35 RISE=6 TARG V(carry_out) VAL=0.35 RISE=4
.measure TRAN T_bstart_cout_2 TRIG V(b_in)    VAL=0.35 RISE=4 TARG V(carry_out) VAL=0.35 RISE=4
.measure TRAN T_cstart_cout_2 TRIG V(cin_buf) VAL=0.35 FALL=3 TARG V(carry_out) VAL=0.35 RISE=4
.measure TRAN T_astart_sum_2  TRIG V(a_in)    VAL=0.35 RISE=6 TARG V(sum) VAL=0.35 FALL=5
.measure TRAN T_bstart_sum_2  TRIG V(b_in)    VAL=0.35 RISE=4 TARG V(sum) VAL=0.35 FALL=5
.measure TRAN T_cstart_sum_2  TRIG V(cin_buf) VAL=0.35 FALL=3 TARG V(sum) VAL=0.35 FALL=5
.measure TRAN T_aend_cout_2 TRIG V(a_in)    VAL=0.35 FALL=6 TARG V(carry_out) VAL=0.35 FALL=4
.measure TRAN T_bend_cout_2 TRIG V(b_in)    VAL=0.35 FALL=4 TARG V(carry_out) VAL=0.35 FALL=4
.measure TRAN T_cend_cout_2 TRIG V(cin_buf) VAL=0.35 RISE=4 TARG V(carry_out) VAL=0.35 FALL=4
.measure TRAN T_aend_sum_2  TRIG V(a_in)    VAL=0.35 FALL=6 TARG V(sum) VAL=0.35 RISE=6
.measure TRAN T_bend_sum_2  TRIG V(b_in)    VAL=0.35 FALL=4 TARG V(sum) VAL=0.35 RISE=6
.measure TRAN T_cend_sum_2  TRIG V(cin_buf) VAL=0.35 RISE=4 TARG V(sum) VAL=0.35 RISE=6
.measure tran T_pat2_a_s1  param='max(T_astart_cout_2,T_astart_sum_2)'
.measure tran T_pat2_b_s1  param='max(T_bstart_cout_2,T_bstart_sum_2)'
.measure tran T_pat2_c_s1  param='max(T_cstart_cout_2,T_cstart_sum_2)'
.measure tran T_pat2_a_e1  param='max(T_aend_cout_2,T_aend_sum_2)'
.measure tran T_pat2_b_e1  param='max(T_bend_cout_2,T_bend_sum_2)'
.measure tran T_pat2_c_e1  param='max(T_cend_cout_2,T_cend_sum_2)'
.measure tran T_pat2_a  param='max(T_pat2_a_s1,T_pat2_a_e1)'
.measure tran T_pat2_b  param='max(T_pat2_b_s1,T_pat2_b_e1)'
.measure tran T_pat2_c  param='max(T_pat2_c_s1,T_pat2_c_e1)'
.measure tran T_pat2      param='max(T_pat2_a,T_pat2_b)'

*PAT3
.measure TRAN T_astart_cout_3 TRIG V(a_in)    VAL=0.35 FALL=7 TARG V(carry_out) VAL=0.35 RISE=5
.measure TRAN T_bstart_cout_3 TRIG V(b_in)    VAL=0.35 RISE=5 TARG V(carry_out) VAL=0.35 RISE=5
.measure TRAN T_cstart_cout_3 TRIG V(cin_buf) VAL=0.35 RISE=5 TARG V(carry_out) VAL=0.35 RISE=5
.measure TRAN T_astart_sum_3  TRIG V(a_in)    VAL=0.35 FALL=7 TARG V(sum) VAL=0.35 FALL=7
.measure TRAN T_bstart_sum_3  TRIG V(b_in)    VAL=0.35 RISE=5 TARG V(sum) VAL=0.35 FALL=7
.measure TRAN T_cstart_sum_3  TRIG V(cin_buf) VAL=0.35 RISE=5 TARG V(sum) VAL=0.35 FALL=7
.measure TRAN T_aend_cout_3 TRIG V(a_in)    VAL=0.35 RISE=8 TARG V(carry_out) VAL=0.35 FALL=5
.measure TRAN T_bend_cout_3 TRIG V(b_in)    VAL=0.35 FALL=5 TARG V(carry_out) VAL=0.35 FALL=5
.measure TRAN T_cend_cout_3 TRIG V(cin_buf) VAL=0.35 FALL=5 TARG V(carry_out) VAL=0.35 FALL=5
.measure TRAN T_aend_sum_3  TRIG V(a_in)    VAL=0.35 RISE=8 TARG V(sum) VAL=0.35 RISE=8
.measure TRAN T_bend_sum_3  TRIG V(b_in)    VAL=0.35 FALL=5 TARG V(sum) VAL=0.35 RISE=8
.measure TRAN T_cend_sum_3  TRIG V(cin_buf) VAL=0.35 FALL=5 TARG V(sum) VAL=0.35 RISE=8
.measure tran T_pat3_a_s1  param='max(T_astart_cout_3,T_astart_sum_3)'
.measure tran T_pat3_b_s1  param='max(T_bstart_cout_3,T_bstart_sum_3)'
.measure tran T_pat3_c_s1  param='max(T_cstart_cout_3,T_cstart_sum_3)'
.measure tran T_pat3_a_e1  param='max(T_aend_cout_3,T_aend_sum_3)'
.measure tran T_pat3_b_e1  param='max(T_bend_cout_3,T_bend_sum_3)'
.measure tran T_pat3_c_e1  param='max(T_cend_cout_3,T_cend_sum_3)'
.measure tran T_pat3_a  param='max(T_pat3_a_s1,T_pat3_a_e1)'
.measure tran T_pat3_b  param='max(T_pat3_b_s1,T_pat3_b_e1)'
.measure tran T_pat3_c  param='max(T_pat3_c_s1,T_pat3_c_e1)'
.measure tran T_pat3      param='max(T_pat3_a,T_pat3_b)'

*PAT4
.measure TRAN T_astart_cout_4 TRIG V(a_in)    VAL=0.35 FALL=9 TARG V(carry_out) VAL=0.35 FALL=6
.measure TRAN T_bstart_cout_4 TRIG V(b_in)    VAL=0.35 RISE=6 TARG V(carry_out) VAL=0.35 FALL=6
.measure TRAN T_cstart_cout_4 TRIG V(cin_buf) VAL=0.35 FALL=6 TARG V(carry_out) VAL=0.35 FALL=6
.measure TRAN T_astart_sum_4  TRIG V(a_in)    VAL=0.35 FALL=9 TARG V(sum) VAL=0.35 RISE=9
.measure TRAN T_bstart_sum_4  TRIG V(b_in)    VAL=0.35 RISE=6 TARG V(sum) VAL=0.35 RISE=9
.measure TRAN T_cstart_sum_4  TRIG V(cin_buf) VAL=0.35 FALL=6 TARG V(sum) VAL=0.35 RISE=9
.measure TRAN T_aend_cout_4 TRIG V(a_in)    VAL=0.35 RISE=10 TARG V(carry_out) VAL=0.35 RISE=7
.measure TRAN T_bend_cout_4 TRIG V(b_in)    VAL=0.35 FALL=6 TARG V(carry_out) VAL=0.35 RISE=7
.measure TRAN T_cend_cout_4 TRIG V(cin_buf) VAL=0.35 RISE=7 TARG V(carry_out) VAL=0.35 RISE=7
.measure TRAN T_aend_sum_4  TRIG V(a_in)    VAL=0.35 RISE=10 TARG V(sum) VAL=0.35 FALL=9
.measure TRAN T_bend_sum_4  TRIG V(b_in)    VAL=0.35 FALL=6 TARG V(sum) VAL=0.35 FALL=9
.measure TRAN T_cend_sum_4  TRIG V(cin_buf) VAL=0.35 RISE=7 TARG V(sum) VAL=0.35 FALL=9
.measure tran T_pat4_a_s1  param='max(T_astart_cout_4,T_astart_sum_4)'
.measure tran T_pat4_b_s1  param='max(T_bstart_cout_4,T_bstart_sum_4)'
.measure tran T_pat4_c_s1  param='max(T_cstart_cout_4,T_cstart_sum_4)'
.measure tran T_pat4_a_e1  param='max(T_aend_cout_4,T_aend_sum_4)'
.measure tran T_pat4_b_e1  param='max(T_bend_cout_4,T_bend_sum_4)'
.measure tran T_pat4_c_e1  param='max(T_cend_cout_4,T_cend_sum_4)'
.measure tran T_pat4_a  param='max(T_pat4_a_s1,T_pat4_a_e1)'
.measure tran T_pat4_b  param='max(T_pat4_b_s1,T_pat4_b_e1)'
.measure tran T_pat4_c  param='max(T_pat4_c_s1,T_pat4_c_e1)'
.measure tran T_pat4      param='max(T_pat4_a,T_pat4_b)'


.measure tran T_pat1_max  param='max(T_pat1,  T_pat1_c)'
.measure tran T_pat2_max  param='max(T_pat2,  T_pat2_c)'
.measure tran T_pat3_max  param='max(T_pat3,  T_pat3_c)'
.measure tran T_pat4_max  param='max(T_pat4,  T_pat4_c)'

.measure tran T_worst_1  param='max(T_pat1_max,  T_pat2_max)'
.measure tran T_worst_2  param='max(T_pat3_max,  T_pat4_max)'
.measure tran Worst_case_delay  param='max(T_worst_1,  T_worst_2)'


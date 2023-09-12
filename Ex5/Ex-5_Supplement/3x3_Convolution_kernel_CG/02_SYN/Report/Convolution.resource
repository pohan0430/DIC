Warning: Design 'Convolution' has '1' unresolved references. For more detailed information, use the "link" command. (UID-341)
 
****************************************
Report : resources
Design : Convolution
Version: Q-2019.12
Date   : Tue Dec 13 21:56:51 2022
****************************************


Resource Report for this hierarchy in file
        /home/mark/TA/lab10/Lab10/EXERCISE/01_RTL/Convolution.v
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| add_x_3        | DW01_inc       | width=5    | add_614 (Convolution.v:614) |
| DP_OP_42J1_122_5662             |            |                            |
|                | DP_OP_42J1_122_5662 |       |                            |
=============================================================================

Datapath Report for DP_OP_42J1_122_5662
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_42J1_122_5662  | mult_558 (Convolution.v:558)                        |
|                      | C1343 (Convolution.v:555)                           |
|                      | add_632 (Convolution.v:632)                         |
|                      | add_632_2 (Convolution.v:632)                       |
|                      | add_632_3 (Convolution.v:632)                       |
|                      | add_632_4 (Convolution.v:632)                       |
|                      | add_632_5 (Convolution.v:632)                       |
|                      | add_632_6 (Convolution.v:632)                       |
|                      | add_632_7 (Convolution.v:632)                       |
|                      | add_632_8 (Convolution.v:632)                       |
|                      | C1344 (Convolution.v:561)                           |
|                      | mult_564 (Convolution.v:564)                        |
|                      | C1345 (Convolution.v:567)                           |
|                      | mult_570 (Convolution.v:570)                        |
|                      | C1346 (Convolution.v:573)                           |
|                      | mult_576 (Convolution.v:576)                        |
|                      | C1347 (Convolution.v:579)                           |
|                      | mult_582 (Convolution.v:582)                        |
|                      | C1348 (Convolution.v:585)                           |
|                      | mult_588 (Convolution.v:588)                        |
|                      | C1349 (Convolution.v:591)                           |
|                      | mult_594 (Convolution.v:594)                        |
|                      | C1350 (Convolution.v:597)                           |
|                      | mult_600 (Convolution.v:600)                        |
|                      | C1351 (Convolution.v:603)                           |
|                      | mult_606 (Convolution.v:606)                        |
==============================================================================

==============================================================================
|       |      | Data     |       |                                          |
| Var   | Type | Class    | Width | Expression                               |
==============================================================================
| I1    | PI   | Unsigned | 8     |                                          |
| I2    | PI   | Unsigned | 8     |                                          |
| I3    | PI   | Unsigned | 1     |                                          |
| I4    | PI   | Unsigned | 1     |                                          |
| I5    | PI   | Unsigned | 1     |                                          |
| I6    | PI   | Unsigned | 1     |                                          |
| I7    | PI   | Unsigned | 8     |                                          |
| I8    | PI   | Unsigned | 8     |                                          |
| I9    | PI   | Unsigned | 1     |                                          |
| I10   | PI   | Unsigned | 1     |                                          |
| I11   | PI   | Unsigned | 8     |                                          |
| I12   | PI   | Unsigned | 8     |                                          |
| I13   | PI   | Unsigned | 1     |                                          |
| I14   | PI   | Unsigned | 1     |                                          |
| I15   | PI   | Unsigned | 8     |                                          |
| I16   | PI   | Unsigned | 8     |                                          |
| I17   | PI   | Unsigned | 1     |                                          |
| I18   | PI   | Unsigned | 1     |                                          |
| I19   | PI   | Unsigned | 8     |                                          |
| I20   | PI   | Unsigned | 8     |                                          |
| I21   | PI   | Unsigned | 1     |                                          |
| I22   | PI   | Unsigned | 1     |                                          |
| I23   | PI   | Unsigned | 8     |                                          |
| I24   | PI   | Unsigned | 8     |                                          |
| I25   | PI   | Unsigned | 1     |                                          |
| I26   | PI   | Unsigned | 1     |                                          |
| I27   | PI   | Unsigned | 8     |                                          |
| I28   | PI   | Unsigned | 8     |                                          |
| I29   | PI   | Unsigned | 1     |                                          |
| I30   | PI   | Unsigned | 1     |                                          |
| I31   | PI   | Unsigned | 8     |                                          |
| I32   | PI   | Unsigned | 8     |                                          |
| I33   | PI   | Unsigned | 1     |                                          |
| I34   | PI   | Unsigned | 1     |                                          |
| I35   | PI   | Unsigned | 8     |                                          |
| I36   | PI   | Unsigned | 8     |                                          |
| T2    | IFO  | Unsigned | 16    | I1 * I2 (Convolution.v:558)              |
| T3    | IFO  | Unsigned | 16    | { I3, I4 } ? $unsigned(1'b0) : T2 (Convolution.v:555) |
| T4    | IFO  | Unsigned | 16    | I7 * I8 (Convolution.v:564)              |
| T5    | IFO  | Unsigned | 16    | { I5, I6 } ? $unsigned(1'b0) : T4 (Convolution.v:561) |
| T6    | IFO  | Unsigned | 16    | I11 * I12 (Convolution.v:570)            |
| T7    | IFO  | Unsigned | 16    | { I9, I10 } ? $unsigned(1'b0) : T6 (Convolution.v:567) |
| T8    | IFO  | Unsigned | 16    | I15 * I16 (Convolution.v:576)            |
| T9    | IFO  | Unsigned | 16    | { I13, I14 } ? $unsigned(1'b0) : T8 (Convolution.v:573) |
| T10   | IFO  | Unsigned | 16    | I19 * I20 (Convolution.v:582)            |
| T11   | IFO  | Unsigned | 16    | { I17, I18 } ? $unsigned(1'b0) : T10 (Convolution.v:579) |
| T12   | IFO  | Unsigned | 16    | I23 * I24 (Convolution.v:588)            |
| T13   | IFO  | Unsigned | 16    | { I21, I22 } ? $unsigned(1'b0) : T12 (Convolution.v:585) |
| T14   | IFO  | Unsigned | 16    | I27 * I28 (Convolution.v:594)            |
| T15   | IFO  | Unsigned | 16    | { I25, I26 } ? $unsigned(1'b0) : T14 (Convolution.v:591) |
| T16   | IFO  | Unsigned | 16    | I31 * I32 (Convolution.v:600)            |
| T17   | IFO  | Unsigned | 16    | { I29, I30 } ? $unsigned(1'b0) : T16 (Convolution.v:597) |
| T18   | IFO  | Unsigned | 16    | I35 * I36 (Convolution.v:606)            |
| T19   | IFO  | Unsigned | 16    | { I33, I34 } ? $unsigned(1'b0) : T18 (Convolution.v:603) |
| O1    | PO   | Unsigned | 21    | T3 + T5 + T7 + T9 + T11 + T13 + T15 + T17 + T19 (Convolution.v:632) |
==============================================================================


Implementation Report
===============================================================================
|                    |                  | Current            | Set            |
| Cell               | Module           | Implementation     | Implementation |
===============================================================================
| add_x_3            | DW01_inc         | apparch (area)     |                |
| DP_OP_42J1_122_5662                   |                    |                |
|                    | DP_OP_42J1_122_5662 | str (area)      |                |
|                    |                  | mult_arch: and     |                |
|                    |                  | mult_arch: and     |                |
|                    |                  | mult_arch: and     |                |
|                    |                  | mult_arch: and     |                |
|                    |                  | mult_arch: and     |                |
|                    |                  | mult_arch: and     |                |
|                    |                  | mult_arch: and     |                |
|                    |                  | mult_arch: and     |                |
|                    |                  | mult_arch: and     |                |
===============================================================================

1

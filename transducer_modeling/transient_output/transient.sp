* Optimization Circuit - Transient Analysis
Vana in_internal 0 SIN(0 0.158V 110Meg) 
Rsource in_internal input_delayed 50 

* Transmission line to model fixture delay
T1 input_delayed 0 input 0 Z0=50 TD=0.5n

* Matching Network Block
C1 input node2 16.65115088201825p
C2 node2 0 0.1p
L1 node2 node_L1_mid 160.0nH
R_L1 node_L1_mid node3 0.01
C3 node3 0 10.905707910986235p
L_comp node3 node_Lcomp_mid 47.191661469371596nH
R_Lcomp node_Lcomp_mid 0 0.7752948129416635

* BVD Transducer Model Block
C0 node3 0 46.14878314896929p
R_mot node3 internal_a 72.02669830864488
L_mot internal_a internal_b 215.83291009564797n
C_mot internal_b 0 11.093085250773546p

.tran 10ps 200ns

.control
  run
  
  * 1. Export raw transient data for Node 3 and the source
  wrdata sim_tran_data.txt I(L_mot) V(in_internal)
  
  quit
.endc
.end

* Optimization Circuit
Vana in_internal 0 AC 0.056V 
Rsource in_internal input_delayed 50 

* ADDED: Transmission line to model fixture delay
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

.ac lin 201 50meg 150meg
.control
  set units = degrees
  run
  let s11 = ( (V(input_delayed)/(-I(Vana))) - 50 ) / ( (V(input_delayed)/(-I(Vana))) + 50 )
  wrdata sim_smith.txt s11
  wrdata sim_data.txt db(s11) ph(s11)
  quit
.endc
.end

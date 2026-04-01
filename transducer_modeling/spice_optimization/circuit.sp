* Modeling the Keysight N9916A Data

* Vsource + 50 Ohm Internal Impedance
Vana in_internal 0 AC 0.056V 
Rsource in_internal input 50 

* The Impedance Matching Circuit
C1 input node2 550pF
C2 node2 0 50pF
L1 node2 node3 181nH
C3 node3 0 50pF
L_comp node3 0 46nH

* the transducer model (BVD Model)
C0 node3 0 25pF
R_mot node3 internal_a 20
L_mot internal_a internal_b 200nH
C_mot internal_b 0 15pF

* control block
.ac lin 201 50meg 150meg

.control
  set units = degrees
  run
  
  * Calculate S11 (Reflection Coefficient)
  * Logic: (Z_in - 50) / (Z_in + 50)
  * In Ngspice, -I(Vana) is the current flowing into your circuit
  let zin = V(input) / (-I(Vana))
  let s11 = (zin - 50) / (zin + 50)
  let s11_phase = ph(s11)

  setfile sim_data.txt
  wrdata sim_data.txt db(s11) s11_phase
  wrdata sim_smith.txt s11
  
  * 1. S11 Log Magnitude (This matches your 'DATA UNIT dB' in the CSV)
  plot db(s11) title 'S11 Log Mag (dB)'
.endc

.end


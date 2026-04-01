"transient.sp" is a spice file that uses the optimized circuit parameters to output I(L_mot), 
which I believe to be the acoustic wave going into the crystal. 

"sim_tran_data.txt" is the raw output of "transient.sp", but the time is not evenly spaced, so "resampled_sim_tran_data" used linear interpolation
to get the resampled data where the time is evenly spaced, so that IQ-demodulation may be performed. 

"transient_demod.ipynb" is the Jupyter notebook that demodulates the resampled data to get the phase and amplitude profiles. 
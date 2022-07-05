function filtered_audio = remove_noise(audio_in ,sample_frequency, pass_band_ripple, stop_band_ripple)
    wp = [2*350,2*1750]/sample_frequency;    
    ws = [2*450,2*1550]/sample_frequency;
    [n,ws] = cheb2ord(wp,ws,pass_band_ripple,stop_band_ripple); 
    [z,p,k] = cheby2(n,stop_band_ripple,ws,"bandpass");                      
    [soslp,glp] = zp2sos(z,p,k); 
    %freqz(soslp, 2^16, sample_frequency);                                
    filtered_audio = filtfilt(soslp, glp, audio_in);
    %sound(filtered_audio, sample_frequency);
end
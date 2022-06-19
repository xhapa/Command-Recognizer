function filtered_audio = remove_noise(audio_in ,sample_frequency, pass_band_f, stop_band_f, pass_band_ripple, stop_band_ripple)
    wp = pass_band_f/(sample_frequency/2);    
    ws = stop_band_f/(sample_frequency/2);
    [n,ws] = cheb2ord(wp,ws,pass_band_ripple,stop_band_ripple); 
    [z,p,k] = cheby2(n,stop_band_ripple,ws,"bandpass");                      
    [soslp,glp] = zp2sos(z,p,k); 
    %freqz(soslp, 2^16, sample_frequency);                                
    filtered_audio = filtfilt(soslp, glp, audio_in);
    sound(filtered_audio, sample_frequency);
end
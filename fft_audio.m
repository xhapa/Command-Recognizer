function fft_a = fft_audio(audio)
fft_a = abs(fft(audio));
fft_a = fft_a .* conj(fft_a);
L=length(audio);
f=8000*(0:(L/2))/L;
P2=abs(fft_a/L);
P1=P2(1:L/2+1);
P1(2:end-1)=2*P1(2:end-1);
fft_a = P1;
end
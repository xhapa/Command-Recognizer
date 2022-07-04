function fft_a = fft_audio(audio)
fft_a = abs(fft(audio));
fft_a = fft_a .* conj(fft_a);
end
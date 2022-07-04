function max_val = max_values(audio_x, audio_h)
A = conv(audio_x, fliplr(audio_h));
max_val = max(A);
end
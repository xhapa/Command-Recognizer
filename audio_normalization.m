function audio_normalized = audio_normalization(audio_in, amp_ratio)
    max_value = max(abs(audio_in(:)));
    audio_normalized = audio_in * amp_ratio/max_value;
end 
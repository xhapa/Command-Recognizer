function audio_normalized = audio_normalization(audio_in)
    max_value = max(abs(audio_in(:)));
    N =  length(audio_in);
    for i = 1:N
        audio_normalized(i) = audio_in(i)/max_value;
    end
end 
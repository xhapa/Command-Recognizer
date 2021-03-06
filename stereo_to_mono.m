function audio = stereo_to_mono(file_name)
    [audio, fs] = audioread(file_name);
    %audio = 0.5*(audio_aux(:,1) + audio_aux(:,2));
    N = length(audio);
    duration = N/fs;
    audio = audio .* hamming(fs*duration);
end
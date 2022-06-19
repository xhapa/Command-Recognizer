function audio = stereo_to_mono(file_name)
    [audio_aux, ~] = audioread(file_name);
    audio = 0.5*(audio_aux(:,1) + audio_aux(:,2));
end
function [audio_start, audio_stop, audio_left, audio_right, audio_up, audio_down, audio_back, audio_forward]=load_ref_audios()
    amplitude_ratio = sqrt(0.5);  %-3dB
    audio_start = audio_normalization(stereo_to_mono("Ref-Audios\Start.wav"), amplitude_ratio);
    audio_stop = audio_normalization(stereo_to_mono("Ref-Audios\Start.wav"), amplitude_ratio);
    audio_left = audio_normalization(stereo_to_mono("Ref-Audios\Start.wav"), amplitude_ratio);
    audio_right = audio_normalization(stereo_to_mono("Ref-Audios\Start.wav"), amplitude_ratio);
    audio_up = audio_normalization(stereo_to_mono("Ref-Audios\Start.wav"), amplitude_ratio);
    audio_down = audio_normalization(stereo_to_mono("Ref-Audios\Start.wav"), amplitude_ratio);
    audio_back = audio_normalization(stereo_to_mono("Ref-Audios\Start.wav"), amplitude_ratio);
    audio_forward = audio_normalization(stereo_to_mono("Ref-Audios\Start.wav"), amplitude_ratio);
end


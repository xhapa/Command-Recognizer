function [audio_start, audio_stop, audio_left, audio_right, audio_up, audio_down, audio_back, audio_forward]=load_ref_audios()
    audio_start = stereo_to_mono("Ref-Audios\Start.wav");
    audio_stop = stereo_to_mono("Ref-Audios\Stop.wav");
    audio_left = stereo_to_mono("Ref-Audios\Start.wav");
    audio_right = stereo_to_mono("Ref-Audios\Start.wav");
    audio_up = stereo_to_mono("Ref-Audios\Start.wav");
    audio_down = stereo_to_mono("Ref-Audios\Start.wav");
    audio_back = stereo_to_mono("Ref-Audios\Start.wav");
    audio_forward = stereo_to_mono("Ref-Audios\Start.wav");
end


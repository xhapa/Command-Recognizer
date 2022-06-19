function [audio_start, audio_stop, audio_left, audio_right, audio_up, audio_down, audio_back, audio_forward]=load_ref_audios()
    audio_start = audioread("Ref-Audios\Start.wav");
    audio_stop = audioread("Ref-Audios\Start.wav");
    audio_left = audioread("Ref-Audios\Start.wav");
    audio_right = audioread("Ref-Audios\Start.wav");
    audio_up = audioread("Ref-Audios\Start.wav");
    audio_down = audioread("Ref-Audios\Start.wav");
    audio_back = audioread("Ref-Audios\Start.wav");
    audio_forward = audioread("Ref-Audios\Start.wav");
end
[audio_start, audio_stop, audio_left, audio_right, audio_up, audio_down, audio_back, audio_forward]=load_ref_audios();

record_time = 3;
recording_frequency = 44100;

recorder = audiorecorder(recording_frequency, 24, 1);

recorder.StartFcn = 'disp(''Recording audio'')';
recorder.StopFcn = 'disp(''Recorded  audio'')';

recordblocking(recorder, record_time);

recorded_audio = recorder.getaudiodata();

audiowrite('Ref-Audios\Instruction.wav', recorded_audio, recording_frequency);
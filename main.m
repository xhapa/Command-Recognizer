[audio_start, audio_stop, audio_left, audio_right, audio_up, audio_down, audio_back, audio_forward]=load_ref_audios();

record_time = 3;
recording_frequency = 44100;
amplitude_ratio = sqrt(0.5);  %-3dB

recorder = audiorecorder(recording_frequency, 24, 1);

recorder.StartFcn = 'disp(''Recording audio'')';
recorder.StopFcn = 'disp(''Recorded  audio'')';

recordblocking(recorder, record_time);

recorded_audio = recorder.getaudiodata();

audiowrite('Ref-Audios\Instruction.wav', recorded_audio, recording_frequency);

%sound(recorded_audio, recording_frequency);

audio_instruction = audioread('Ref-Audios\Instruction.wav');

audio_instruction_norm = audio_normalization(audio_instruction, amplitude_ratio);

%sound(audio_instruction_norm, recording_frequency);

audio_filtered = remove_noise(audio_instruction_norm, recording_frequency, [700, 11000], [690, 11010], 1, 150);

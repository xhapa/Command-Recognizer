clear all;
% Default variables to record
record_time = 3;
recording_frequency = 8000;

% Load audio files
%[audio_start, audio_stop, audio_left, audio_right, audio_up, audio_down, audio_back, audio_forward]=load_ref_audios();

audio_start = stereo_to_mono("Ref-Audios\Start.wav");
audio_stop = stereo_to_mono("Ref-Audios\Stop.wav");
audio_left = stereo_to_mono("Ref-Audios\Left.wav");
audio_right = stereo_to_mono("Ref-Audios\Right.wav");
audio_up = stereo_to_mono("Ref-Audios\Up.wav");
audio_down = stereo_to_mono("Ref-Audios\Down.wav");
audio_back = stereo_to_mono("Ref-Audios\Back.wav");
audio_forward = stereo_to_mono("Ref-Audios\Forward.wav");

% Recorder object
recorder = audiorecorder(recording_frequency, 8, 1);

recorder.StartFcn = 'disp(''Recording audio'')';
recorder.StopFcn = 'disp(''Recorded  audio'')';

% Record audio
recordblocking(recorder, record_time);

% Get audio
recorded_audio = recorder.getaudiodata();

% Save audio
audiowrite('Ref-Audios\Instruction.wav', recorded_audio, recording_frequency);

%sound(recorded_audio, recording_frequency);

% Read audio
audio_instruction = stereo_to_mono("Ref-Audios\Instruction.wav");

% Preprocessing
audio_start = preprocessing(audio_start);
audio_stop = preprocessing(audio_stop);
audio_left = preprocessing(audio_left);
audio_right = preprocessing(audio_right);
audio_up = preprocessing(audio_up);
audio_down = preprocessing(audio_down);
audio_back = preprocessing(audio_back);
audio_forward = preprocessing(audio_forward);
audio_instruction = preprocessing(audio_instruction);

fft_start = fft_audio(audio_start);
fft_stop = fft_audio(audio_stop);
fft_left = fft_audio(audio_left);
fft_right = fft_audio(audio_right);
fft_up = fft_audio(audio_up);
fft_down = fft_audio(audio_down);
fft_back = fft_audio(audio_back);
fft_forward = fft_audio(audio_forward);
fft_instruction = fft_audio(audio_instruction);

%sound(audio_start, recording_frequency);
sound(audio_instruction, recording_frequency);

figure(1)
subplot(3,3,1), plot(fft_start), title('FFT Start');
subplot(3,3,2), plot(fft_stop), title('FFT Stop');
subplot(3,3,3), plot(fft_left), title('FFT Left');
subplot(3,3,4), plot(fft_right), title('FFT Right');
subplot(3,3,5), plot(fft_up), title('FFT Up');
subplot(3,3,6), plot(fft_down), title('FFT Down');
subplot(3,3,7), plot(fft_back), title('FFT Back');
subplot(3,3,8), plot(fft_forward), title('FFT Forward');
subplot(3,3,9), plot(fft_instruction), title('FFT Instruction');

figure(2)
subplot(3,3,1), plot(audio_start), title('Audio Start');
subplot(3,3,2), plot(audio_stop), title('Audio Stop');
subplot(3,3,3), plot(audio_left), title('Audio Left');
subplot(3,3,4), plot(audio_right), title('Audio Right');
subplot(3,3,5), plot(audio_up), title('Audio Up');
subplot(3,3,6), plot(audio_down), title('Audio Down');
subplot(3,3,7), plot(audio_back), title('Audio Back');
subplot(3,3,8), plot(audio_forward), title('Audio Forward');
subplot(3,3,9), plot(audio_instruction), title('Audio Instruction');

%plot_time_audio(audio_instruction, recording_frequency);
%plot_time_audio(audio_start, recording_frequency);

max_v_start = max_values(audio_start, audio_start);
max_v_stop = max_values(audio_stop, audio_stop);
max_v_left = max_values(audio_left, audio_left);
max_v_right = max_values(audio_right, audio_right);
max_v_up = max_values(audio_up, audio_up);
max_v_down = max_values(audio_down, audio_down);
max_v_back = max_values(audio_back, audio_back);
max_v_forward = max_values(audio_forward, audio_forward);

max_v1 = max_values(audio_start, audio_instruction);
max_v2 = max_values(audio_stop, audio_instruction);
max_v3 = max_values(audio_left, audio_instruction);
max_v4 = max_values(audio_right, audio_instruction);
max_v5 = max_values(audio_up, audio_instruction);
max_v6 = max_values(audio_down, audio_instruction);
max_v7 = max_values(audio_back, audio_instruction);
max_v8 = max_values(audio_forward, audio_instruction);

max_ref = [max_v_start, max_v_stop, max_v_left, max_v_right, max_v_up, max_v_down, max_v_back, max_v_forward];
max_compar = [max_v1, max_v2, max_v3, max_v4, max_v5, max_v6, max_v7, max_v8];

percentages = comparison_percentage(max_ref, max_compar);

recognition(percentages);
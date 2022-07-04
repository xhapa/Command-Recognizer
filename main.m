clear all;
% Default variables to record
record_time = 3;
recording_frequency = 44100;

% Load audio files
[audio_start, audio_stop, audio_left, audio_right, audio_up, audio_down, audio_back, audio_forward]=load_ref_audios();

% Recorder object
recorder = audiorecorder(recording_frequency, 24, 1);

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
[audio_instruction, fs] = audioread('Ref-Audios\Instruction.wav');
N = length(audio_instruction);
duration = N/fs;
audio_instruction = audio_instruction .* hamming(fs*duration);

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
subplot(3,4,1), plot(fft_start), title('FFT Start');
subplot(3,4,2), plot(fft_stop), title('FFT Stop');
subplot(3,4,3), plot(fft_left), title('FFT Left');
subplot(3,4,4), plot(fft_right), title('FFT Right');
subplot(3,4,5), plot(fft_up), title('FFT Up');
subplot(3,4,6), plot(fft_down), title('FFT Down');
subplot(3,4,7), plot(fft_back), title('FFT Back');
subplot(3,4,8), plot(fft_forward), title('FFT Forward');
subplot(3,4,9), plot(fft_instruction), title('FFT Instruction');

plot_time_audio(audio_instruction, recording_frequency);
plot_time_audio(audio_start, recording_frequency);

max_v = max_values(audio_start, audio_start);

y1 = conv(audio_start, fliplr(audio_instruction));
y2 = conv(audio_start, fliplr(audio_start));
plot_time_audio(y1, recording_frequency);
plot_time_audio(y2, recording_frequency);
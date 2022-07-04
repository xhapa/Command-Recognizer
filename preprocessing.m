function audio = preprocessing(audio)
a = [0.1 -0.95];
b = [1 -0.99];

audio = filter(a, b, audio);
audio = audio_normalization(audio);
end
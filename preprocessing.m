function audio = preprocessing(audio)
audio = remove_noise(audio, 8000, 1, 150);
audio = audio_normalization(audio);
end
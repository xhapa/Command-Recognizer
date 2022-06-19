function plot_time_audio(audio, recording_frequency)
    t = linspace(0, length(audio)/recording_frequency, length(audio));
    figure();
    plot(t,audio);
end
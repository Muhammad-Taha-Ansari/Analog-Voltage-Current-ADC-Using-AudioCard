close all;
clear all;
clc;

Fs = 48000;        
nBits = 16;        
nChannels = 1;     
ts = 1 / Fs;     
sec = 0.1;         
t = 0:ts:(sec - ts);
gain = (240 / 0.18);

disp('Recording started... Press Ctrl+C to stop.');

while true

    recObj = audiorecorder(Fs, nBits, nChannels);
    recordblocking(recObj, sec);
    y = getaudiodata(recObj);

    y1 = y' * gain;     
    max_voltage = max(y1);

    subplot(2,1,1);
    plot(t, y1, 'b');
    xlabel('Time (sec)');
    ylabel('Voltage (V)');
    title('Voltage Waveform');
    grid on;
    ylim([-350 350]);
    xlim([0 sec]);
    
    n = length(y);
    Y = fft(y);
    magY = abs(Y);
    F = (0:n-1) * (Fs/n);
    
    temp_var = max(magY);
    subplot(2,1,2);
    stem(F, magY, 'filled');
    xlabel('Frequency (Hz)');
    ylabel('Magnitude');
    title('Discrete Fourier Transform');
    grid on;
    ylim([0 temp_var + 0.1 * temp_var]);
    xlim([0 Fs/2]);
    
    disp(['Max Voltage: ', num2str(max_voltage, '%.2f'), ' V']);
end

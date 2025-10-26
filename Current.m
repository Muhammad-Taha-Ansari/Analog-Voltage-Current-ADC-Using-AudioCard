clear all;
close all;
clc;

Fs = 48000;        
nBits = 16;        
nChannels = 1;      
ts = 1 / Fs;       
sec = 0.1;          
t = 0:ts:(sec - ts);
gain = 10;         

disp('Recording started... Press Ctrl+C to stop.');

while true
   
    recObj = audiorecorder(Fs, nBits, nChannels);
    recordblocking(recObj, sec);
    y = getaudiodata(recObj);

    y1 = y' * gain;          
    max_current = max(y1);    

    subplot(2,1,1);
    plot(t, y1, 'r');
    xlabel('Time (sec)');
    ylabel('Current (A)');
    title('CURRENT WAVEFORM');
    grid on;
    ylim([-0.7 0.7]);
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
    ylim([0 temp_var + 0.1*temp_var]);
    xlim([0 Fs/2]); 

    disp(['Max Current: ', num2str(max_current, '%.3f'), ' A']);
end

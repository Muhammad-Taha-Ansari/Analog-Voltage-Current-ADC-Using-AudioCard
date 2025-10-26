# 🎛️ Analog Voltage & Current ADC Using Audio Card

This project demonstrates how to **convert analog voltage and current signals into digital form** using a **standard PC audio card as an Analog-to-Digital Converter (ADC)**.  
It uses **MATLAB** for signal acquisition, sampling, and waveform analysis — providing a low-cost and effective way to study analog signals digitally.

---

## 📘 Overview

The audio input (microphone or line-in) of a sound card can act as a **basic ADC**, capable of sampling analog signals (typically ±1 V range).  
This project uses that capability to:
- Capture voltage and current signals.
- Process them digitally.
- Display and analyze waveform characteristics.

It is particularly useful for **educational experiments**, **signal measurement**, and **low-cost lab applications**.

---

## ⚙️ Features

- 🎧 Uses **PC sound card** as ADC  
- ⚡ Converts **analog voltage and current** to digital data  
- 📈 Real-time **waveform visualization**  
- 🔍 Adjustable **sampling frequency** and **recording duration**  
- 💻 Fully implemented in **MATLAB**  
- 🧪 Ideal for **signal analysis experiments** and **analog electronics projects**

---

## 🧩 System Requirements

| Component | Description |
|------------|-------------|
| **Hardware** | PC or laptop with audio input (mic/line-in) |
| **Software** | MATLAB R2021a or later |
| **Sampling Rate** | Up to 48 kHz (depending on sound card) |
| **Signal Range** | Typically ±1 V (ensure safe input levels) |

---

## 🔬 Circuit Setup

1. Use a **signal source** (like a waveform generator or sensor output).  
2. Pass the signal through a **voltage divider or limiter** to ensure it stays within safe range for the audio input.  
3. Connect the signal to the **audio card’s line-in port**.  
4. Run the MATLAB script to begin acquisition.

> ⚠️ **Caution:** Always make sure your input voltage does not exceed the safe limit (around ±1 V) of the audio interface to avoid damage.

---

## 💻 MATLAB Code Structure

| File | Description |
|------|--------------|
| `main.m` | Main script for recording and plotting the signal |
| `adc_record.m` | Function to acquire data from the sound card |
| `analyze_signal.m` | Computes signal parameters like RMS, frequency, etc. |

---

## 🧠 Example Workflow

1. Configure the sampling rate and recording duration:
   ```matlab
   Fs = 48000;     % Sampling Frequency
   nBits = 16;     % Bit Depth
   nChannels = 1;  % Mono Channel
   sec = 0.1;      % Record Duration
   ```
2. Record signal using the sound card:
   ```matlab
   recObj = audiorecorder(Fs, nBits, nChannels);
   recordblocking(recObj, sec);
   y = getaudiodata(recObj);
   ```
3. Plot and analyze:
   ```matlab
   t = linspace(0, sec, length(y));
   plot(t, y);
   xlabel('Time (s)');
   ylabel('Amplitude');
   title('Captured Analog Signal');
   ```

---

## 📊 Results

- Successfully captured and visualized analog waveforms.  
- Demonstrated that an audio interface can serve as a **low-cost ADC** for educational purposes.  
- Enabled real-time signal analysis including **frequency, amplitude, and RMS value** measurement.

---

## 🚀 Future Improvements

- Add digital filtering and FFT analysis  
- Support multi-channel acquisition  
- Implement GUI for live monitoring  
- Integrate Arduino or dedicated ADC module for comparison

---

## 📚 References

- MATLAB Audio Recording Documentation  
- Basic Principles of ADC Conversion  
- Sound Card as Data Acquisition Device – Research Papers

---

## 🧑‍💻 Author

**Muhammad Taha Ansari**  
Electrical Engineering Student @ NED University  
🔗 [GitHub Profile](https://github.com/Muhammad-Taha-Ansari)  
💼 [LinkedIn Profile](https://www.linkedin.com/in/muhammad-taha-b93716299/)

---

⭐ If you liked this project, give it a Star and stay tuned for more!

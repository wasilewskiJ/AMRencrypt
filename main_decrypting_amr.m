[nagrane,Fs] = audioread("16khz.wav");
%wav because MATLAB cannot read 16khz amr
[enc, Fs] = audioread("16khz-enc-amr.wav"); 
[N,L] = size(nagrane');
enc = enc(1:L, :);
d1 = readmatrix('d1.txt');
d2 = readmatrix('d2.txt');
dec = decrypt(enc', d1, d2);
dec1 = wdenoise(dec, 8, NoiseEstimate="LevelDependent", DenoisingMethod="SURE"); %BlockJS %SURE %Bayes
%dec1 = wdenoise(dec1, 6, NoiseEstimate="LevelDependent", DenoisingMethod="BlockJS"); %BlockJS
%dec2 = smoothdata(dec1,2,"sgolay");
%dec3 = wdenoise(dec2, 5, NoiseEstimate="LevelDependent", DenoisingMethod="BlockJS"); %BlockJS
audiowrite("16khz-dec-amr.wav", dec1, Fs);
sound(dec1*8,Fs);

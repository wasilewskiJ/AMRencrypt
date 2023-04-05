[nagrane,Fs] = audioread("16khz-amr.amr"); 
%[enc,Fs] = audioread("16khz-enc.amr"); 
seed = 1234;
[N,L] = size(nagrane');
%[N,L] = size(enc');
[e1, e2, d1, d2] = getkeys(seed, L);

enc = encrypt(nagrane', e1, e2);
%sound(enc,Fs);
audiowrite("16khz-enc-amr.wav", enc, Fs);
dec = decrypt(enc, d1, d2);
dec1 = wdenoise(dec, 8, NoiseEstimate="LevelDependent", DenoisingMethod="SURE"); %BlockJS %SURE %Bayes
%dec1 = wdenoise(dec1, 6, NoiseEstimate="LevelDependent", DenoisingMethod="BlockJS"); %BlockJS
%dec2 = smoothdata(dec1,2,"sgolay");
%dec3 = wdenoise(dec2, 5, NoiseEstimate="LevelDependent", DenoisingMethod="BlockJS"); %BlockJS
audiowrite("16khz-dec-amr.wav", dec1, Fs);
sound(dec1,Fs);

%x = 10000:1:11000;
%plot(x,dec(1,10000:11000),'-o',x,dec1(1,10000:11000),'-x')
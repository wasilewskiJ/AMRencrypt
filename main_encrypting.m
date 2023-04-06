%reading wav file in order to encrypt
[nagrane,Fs] = audioread("16khz.wav");
%seeding random algorithm
seed = 1234;
[N,L] = size(nagrane');
[e1, e2, d1, d2] = getkeys(seed, L);
%writing out matrix in order to decrypt file later
writematrix(d1, 'd1.txt');
writematrix(d2, 'd2.txt');
enc = encrypt(nagrane', e1, e2);
audiowrite("16khz-enc.wav", enc, Fs);
%NOW YOU SHOULD ENCODE using AMR CODEC
%AND LATER DECRYPT IT USING D1 AND D2 (main_decrypted_amr.m)

%example of wav decryption
dec = decrypt(enc, d1, d2);
dec1 = wdenoise(dec, 8, NoiseEstimate="LevelDependent", DenoisingMethod="SURE"); %BlockJS %SURE %Bayes
%trying different options to make decrypted signal sound better
%dec1 = wdenoise(dec1, 6, NoiseEstimate="LevelDependent", DenoisingMethod="BlockJS"); %BlockJS
%dec2 = smoothdata(dec1,2,"sgolay");
%dec3 = wdenoise(dec2, 5, NoiseEstimate="LevelDependent", DenoisingMethod="BlockJS"); %BlockJS
sound(dec1,Fs);

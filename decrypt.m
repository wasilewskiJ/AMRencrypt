function [speechdec] = decrypt(signal, d1, d2)
    fur4 = fft(signal);
    [~,L] = size(signal);
    fur4(:,2:L/2)=fur4(:,2:L/2).*d1;
    fur4(:,L/2+2:L)=fur4(:,L/2+2:L).*d2;

    speechdec = ifft(fur4);
end
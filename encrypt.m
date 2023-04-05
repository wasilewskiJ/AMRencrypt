function [speechenc] = encrypt(signal, e1, e2)
    fur4 = fft(signal);
    [~,L] = size(signal);
    fur4(:,2:L/2)=fur4(:,2:L/2).*e1;
    fur4(:,L/2+2:L)=fur4(:,L/2+2:L).*e2;

    speechenc = ifft(fur4);
end
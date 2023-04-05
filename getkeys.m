function [e1,e2, d1, d2] = getkeys(seed, L)
    rng(seed,"twister");
    random = rand(1,L/2-1); %od 0 do 1
    rnd_theta = -pi + (2*pi).*random;
    e1 = exp(1i*rnd_theta);
    e2 = exp(-1i*flip(rnd_theta,2));
    d1 = exp(-1i*rnd_theta);
    d2 = exp(1i*flip(rnd_theta,2));    
end
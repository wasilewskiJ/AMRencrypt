# AMR encrypt

The program encrypts an audio signal in such a way that it can effectively pass through the AMR codec. The encryption is based on shifting the wave according to a randomly generated key. Classical encryption will not work with this codec because what enters the transmission channel must come out the same - a difference of 1 bit causes an error when decrypting. And the AMR codec is lossy, so we never get the same values ​​on the output.

# Why AMR codec?
- Widely used in GSM networks. This could be applied in so-called secure phones.

# Code description
## getkeys.m
    Generating encryption and decryption keys to shift phases, using random number generator. For randomizing uses 'twister' algorithm (you can check MATLAB documentation). 
    Function generate two keys, second one is flipped complex conjugate of the first one, due to Fourier symmetry.
    Decryption keys are complex conjugates of encryption keys. 
## encrypt.m
    function that shifts phases based on two keys for the symmetric halves of the Fourier transform
## decrypt.m
    same but using decryption keys
## main_encrypting.m
    Encrypts recorded .wav audio and saves output. After encrypting you can pass .wav through AMR codec and then decrypt using main_decrypting.m.
## main_decrypting.m
    Decrypts encrypted file. You can play around with denoising.

Final files are saved in .wav, MATLAB doesn't support amr.
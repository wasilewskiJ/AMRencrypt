#AMRencrypt
The program encrypts a signal in such a way that it can be passed through the AMR codec.
Classical encryption does not work for this codec because what enters the transmission channel must come out on the other side the same - 1 bit of difference causes incorrect decryption.
And because the codec is lossy, we will never receive the same values on the other end as what we input.
Therefore, it is necessary to encrypt at the wave level by shifting phases.

function [ MedSignalInF ] = Mapper( Bits, Nsk )
    switch Nsk
        case 4 % QPSK
            Dictionary = [ 1+1j 1-1j -1+1j -1-1j ];
        case 16 % 16-QAM
            Dictionary = [ 3+3j 3+1j 1+3j 1+1j 3-3j 3-1j 1-3j 1-1j...
                          -3+3j -3+1j -1+3j -1+1j -3-3j -3-1j -1-3j -1-1j];
        case 64 % 64-QAM
            Dictionary = [ 7+7j 7+5j 5+7j 5+5j 7+1j 7+3j 5+1j 5+3j 1+7j...
                           1+5j 3+7j 3+5j 1+1j 1+3j 3+1j 3+3j...
                           7-7j 7-5j 5-7j 5-5j 7-1j 7-3j 5-1j 5-3j 1-7j...
                           1-5j 3-7j 3-5j 1-1j 1-3j 3-1j 3-3j...
                           -7+7j -7+5j -5+7j -5+5j -7+1j -7+3j -5+1j...
                           -5+3j...
                           -1+7j -1+5j -3+7j -3+5j -1+1j -1+3j -3+1j...
                           -3+3j...
                           -7-7j -7-5j -5-7j -5-5j -7-1j -7-3j -5-1j...
                           -5-3j -1-7j -1-5j -3-7j -3-5j -1-1j -1-3j...
                           -3-1j -3-3j];
    end
    MedSignalInF = [];
    n = 1;
    for k = 1 : log2(Nsk) : length(Bits) - log2(Nsk) + 1
        Numb = bin2dec(int2str(Bits(k : k + log2(Nsk) - 1))) + 1;
        MedSignalInF(n) = Dictionary(Numb);
        n = n + 1;
    end
end

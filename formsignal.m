function [ Signal ] = formsignal( Numb_Symb, Nfft )
    Fourie(1:Numb_Symb,1:Nfft) = 0;
    step = 3;
    Signal = [];
    shift = fix(Nfft/2);
    for k = 1 : Numb_Symb
        Fourie(k,mod(shift,Nfft):mod(step+shift,Nfft)) = 1;
        shift = shift + step;
        med(:) = ifft(Fourie(k,:));
        Signal = [Signal, med(Nfft - Nfft/8 + 1 : Nfft), med];
    end
end


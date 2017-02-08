script
clear all;
clc;
rng(0);
Register = [1 0 0 1 0 1 0 1 0 0 0 0 0 0 0 ];
Nsk = 4;
Nfft = 1024;
Nc = 400;
NumbOfSymbol = 10;
Ration_Of_Pilots = 20;
AmpPilot = 4/3*sqrt(2);

    %choose the type of window.
    %there listed realized type of windows
typy_of_window = 'triangle'; % 'triangle' 'cos'
    %choose between
    %overlapped(1) and non(0) windows
overlap = 0; % 1
    %signal
[ Index_Inform , Index_Pilot ] = FormIndex ( Nc, Ration_Of_Pilots );
Nc = Nc + 1;
InputBits = randi( [0,1], 1, (length(Index_Inform) *...
                        NumbOfSymbol*log2(Nsk)));
Bits = RSLOS( InputBits, Register );
InformF = Mapper(Bits, Nsk);
[MedSignalInF, Signal] = Inform_And_Pilot(...
                InformF, Index_Inform, Index_Pilot, Nfft, AmpPilot ); 
SignalTs = AddTs (Signal, Nfft);
plot(20*log10(abs(fft(SignalTs))))
%Window
Window = formwindow(typy_of_window, overlap, Nfft, length(Signal));

FourAbs = figure;
Sig = figure;
figure(Sig)
plot(abs(xt))
hold on;
% forming of window
wt(1:Nfft) = 0;
for k = 1:fix(length(xt)/Nfft)
    sgnl(k,:) = xt(1:Nfft);
end
k = k + 10;
wt(1:k) = 1;
%multiplication
for k = 1:fix(length(xt)/Nfft)
    yt(k,:) = wt(1,:).*sgnl(k,:);
end
figure(Sig)
    plot(abs(fft(wt)));
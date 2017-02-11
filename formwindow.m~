function [ Signal_With_Window ] =...
    formwindow( typy_of_window, WO, Nfft, Ts, a, SignalTs )
    Tsymbol = Ts + Nfft;
    switch typy_of_window
        case 'rectangle'
            Window(1:Tsymbol + 2*WO) = 1;
        case 'triangle'
            Window(1:Tsymbol + 2*WO) = 1;
            Window(1:a + 1) = 0:1/a:1;
            Window(Tsymbol - a : Tsymbol) =1:-1/a:0;
        case 'cos'
            Window(1:Tsymbol + 2*WO) = 1;
            Window(1:a/2) = 1/2 - 1/2*cos(2*pi*(0:a/2 - 1)/(a-1));
            Window(Tsymbol - a/2 + 2 : Tsymbol) =...
                1/2 - 1/2*cos(2*pi*(a/2:(a-2))/(a-2));
    end
    if WO == 0
        for k = 1 : length(SignalTs)/(Tsymbol)
            Signal_With_Window(( (k - 1)*Tsymbol + 1 ): ...
                k*Tsymbol) = SignalTs(((k - 1)*Tsymbol + 1 ):...
                k*Tsymbol).* Window(1:Tsymbol);
        end
    else
        Med = reshape(SignalTs, Tsymbol, length(SignalTs)/Tsymbol).';
        Modify(1,:) = ...
            [zeros(1,WO), Med(1,:), Med(1,Ts + 1: Ts + WO)].* Window;
        
        Signal_With_Window = zeros(1,size(Modify,1)*size(Modify,2));
        for k = 1 : length(SignalTs)/Tsymbol
            Signal_With_Window((k-1)*(length(Modify) - WO) + 1 :...
                k*length(Modify) - (k - 1)*WO ) = ...
                Signal_With_Window((k-1)*(length(Modify) - WO) + 1 :...
                k*length(Modify) - (k - 1)*WO ) + Modify(k,:);
        end
    end
%     plot(Window)
%     figure
end
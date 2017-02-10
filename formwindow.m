function [ Signal_With_Window ] =...
    formwindow( typy_of_window, overlap, WO, Nfft, Ts, a, SignalTs )
    Tsymbol = Ts + Nfft;
    switch typy_of_window
        case 'rectangle'
            Window(1:Tsymbol) = 1;
        case 'triangle'
            Window(1:Tsymbol) = 1;
            Window(1:a + 1) = 0:1/a:1;
            Window(Tsymbol - a : Tsymbol) =1:-1/a:0;
        case 'cos'
            Window(1:Tsymbol) = 1;
            Window(1:a/2) = 1/2 - 1/2*cos(2*pi*(0:a/2 - 1)/(a-1));
            Window(Tsymbol - a/2 + 2 : Tsymbol) =...
                1/2 - 1/2*cos(2*pi*(a/2:(a-2))/(a-2));
    end
    switch overlap
        case 0
            for k = 1 : length(SignalTs)/(Tsymbol)
                Signal_With_Window(( (k - 1)*Tsymbol + 1 ): ...
                    k*Tsymbol) = SignalTs(((k - 1)*Tsymbol + 1 ):...
                    k*Tsymbol).* Window(1:Tsymbol);
            end
        case 1
            Signal_With_Window = zeros(1,length(SignalTs));
            Signal_With_Window(1:Tsymbol) = SignalTs(1:Tsymbol).*Window;
            for k = 2 : length(SignalTs)/Tsymbol
                Signal_With_Window( (1 + (k-1)*(Tsymbol -WO)):...
                    k*Tsymbol - (k-1)*WO ) = ...
                    SignalTs( ((k-1)*Tsymbol + 1) : k*Tsymbol);
            end
    end
%     plot(Window)
%     figure
end
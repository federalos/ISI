function [ Signal_With_Window ] =...
    formwindow( typy_of_window, overlap, WO, Nfft, a, SignalTs )
    switch typy_of_window
        case 'rectangle'
            Window(1:Nfft + Nfft/8) = 1;
        case 'triangle'
            Window(1:Nfft + Nfft/8) = 1;
            Window(1:a + 1) = 0:1/a:1;
            Window(Nfft + Nfft/8 - a : Nfft + Nfft/8) =1:-1/a:0;
        case 'cos'
            Window(1:Nfft + Nfft/8) = 1;
            Window(1:a/2) = 1/2 - 1/2*cos(2*pi*(0:a/2 - 1)/(a-1));
            Window(Nfft + Nfft/8 - a/2 + 2 : Nfft + Nfft/8) =...
                1/2 - 1/2*cos(2*pi*(a/2:(a-2))/(a-2));
    end
    switch overlap
        case 0
            for k = 1 : length(SignalTs)/(Nfft + Nfft/8)
                Signal_With_Window(( (k - 1)*(Nfft + Nfft/8) + 1 ): ...
                    k*(Nfft + Nfft/8)) =...
                    SignalTs(((k - 1)*(Nfft + Nfft/8) + 1 ):...
                    k*(Nfft + Nfft/8)).* Window(1:Nfft + Nfft/8);
            end
        case 1
            Signal_With_Window = zeros(1,length(SignalTs) -...
                WO * length(SignalTs)/(Nfft + Nfft/8));
            Signal_With_Window(1:Nfft + Nfft/8) =...
                SignalTs(1:Nfft + Nfft/8).*Window;
            for k = 2 : length(SignalTs)/(Nfft + Nfft/8)
                Signal_With_Window( (1 + (k-1)*(Nfft + Nfft/8 -WO)):...
                    k*(Nfft + Nfft/8) - (k-1)*WO ) = ...
                    SignalTs( ((k-1)*(Nfft + Nfft/8) + 1) :...
                    k*(Nfft +Nfft/8));
            end
    end
%     plot(Window)
%     figure
end
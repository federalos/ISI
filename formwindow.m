function [ Window ] = formwindow( typy_of_window, overlap, Nfft, len )
    switch typy_of_window
        case 'rectangle'
            for k = 1 : len/(Nfft + Nfft/8)
                win((Nfft+Nfft/8)*(k - 1) + 1:(Nfft + Nfft/8)*k) = 1;
            end
        case 'triangle'
            for k = 1 : len/(Nfft + Nfft/8)
                win((Nfft+Nfft/8)*(k - 1) + 1:(Nfft + Nfft/8)*k/2) = ...
                    2*(1:(Nfft + Nfft/8)/2)/(Nfft+Nfft/8);
                win((Nfft+Nfft/8)*k:-1:(Nfft + Nfft/8)*k/2 + 1) = ...
                    2*(1:(Nfft + Nfft/8)/2)/(Nfft+Nfft/8);
            end
        case 'cos'
    end
    Window = win;
end


% Rodrigo Arce
% Josue Contreras
function [y, fs] = voz(archivo)
   
    audioinfo('vozP0.wav')
    [y, fs] = audioread(archivo);
    t = 0:1/fs:(length(y) - 1)/fs;
        
    subplot(211)
        plot(t, y); grid on
        title('Josue y Rodrigo (A)')
        xlabel('Tiempo (s)')
        ylabel('Amplitud')
        legend('De 0 a 1 segundo')
    subplot(212)
        plot(t, y); grid on
        axis([0 0.1 min(y) max(y)])
        xlabel('Tiempo (s)')
        ylabel('Amplitud')
        legend('De 0 a 0.1 segundos')
end
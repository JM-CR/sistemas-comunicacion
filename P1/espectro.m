% @date 30/Agosto/2018
% @author Josue Contreras
% @author Rodrigo Arce
function espectro(y, fs, xl, yl, tit)
% Está a 8000 muestras por segundo. Para sacar 100ms se necesita el 10%.
rango = y(1:800);
t = 0:1/fs:(length(rango) - 1)/fs;

% Graficar los 100ms solicitados.
subplot(211)
    plot(t, rango); grid on
    axis([0 0.1 min(y) max(y)])
    xlabel('Tiempo (s)')
    ylabel('Amplitud')
    legend('De 0 a 0.1 segundos')
    title('Señal de voz')
    
% Calcular la fft
val = fftshift(fft(y));

% Graficar espectro
subplot(212)
    plot(abs(val)); grid on
    xlabel('Tiempo (s)')
    ylabel('Amplitud')
    title('Señal de voz')

end
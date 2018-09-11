% Calcula la CTFT de una función continua muestreada a frecuencia fs
%       espectro(y, fs, xl, yl, tit)
%
% @param y Vector de valores muestreados
% @param fs Frecuencia o tasa de muestreo
% @param xl Etiqueta para el eje x
% @param yl Etiqueta para el eje y
% @param tit Título de la gráfica
%
% @author Josue M. Contreras Rocha
% @author Rodrigo Roberto Arce Anguiano
% @date 10/Septiembre/2018

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
    title('Josue y Rodrigo (A)')
 
% Calcular la fft y centrarla
val = fftshift(fft(y));

% Crear vector de frecuencia
f = -fs/2 : fs/(length(y) - 1) : fs/2;

% Graficar espectro
subplot(212)
    plot(f, abs(val)); grid on
    xlabel(xl)
    ylabel(yl)
    title(tit)
    
end
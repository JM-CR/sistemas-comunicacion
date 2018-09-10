% Grafica una señal continua dada en un archivo y brinda parámetros útiles.
% La señal de entrada debe estar muestreada a cualquier tasa o frecuencia.
%
%     [y, fs] = voz(archivo)
%
% @param archivo Nombre del archivo con valores muestreados
% @return y Amplitud de cada muestra del bit 1 hasta el bit fs
% @return fs Frecuencia o tasa de muestreo de la señal dada
%
% @author Rodrigo Roberto Arce Anguiano
% @author Josue Mosiah Contreras Rocha
% @date 4/Septiembre/2018

function [y, fs] = voz(archivo)

% Imprimir parámetros del archivo
audioinfo('vozP0.wav')

% Leer contenido del archivo
[y, fs] = audioread(archivo);

% Crear vector de tiempo para la graficación
t = 0:1/fs:(length(y) - 1)/fs;
        
% Graficar toda la señal continua
subplot(211)
    plot(t, y); grid on
    title('Josue y Rodrigo (A)')
    xlabel('Tiempo (s)')
    ylabel('Amplitud')
    legend('De 0 a 1 segundo')

% Graficar la décima parte de la señal continua
subplot(212)
    plot(t, y); grid on
    axis([0 0.1 min(y) max(y)])
    xlabel('Tiempo (s)')
    ylabel('Amplitud')
    legend('De 0 a 0.1 segundos')

end
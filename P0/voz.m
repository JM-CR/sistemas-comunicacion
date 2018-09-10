% Grafica una se�al continua dada en un archivo y brinda par�metros �tiles.
% La se�al de entrada debe estar muestreada a cualquier tasa o frecuencia.
%
%     [y, fs] = voz(archivo)
%
% @param archivo Nombre del archivo con valores muestreados
% @return y Amplitud de cada muestra del bit 1 hasta el bit fs
% @return fs Frecuencia o tasa de muestreo de la se�al dada
%
% @author Rodrigo Roberto Arce Anguiano
% @author Josue Mosiah Contreras Rocha
% @date 4/Septiembre/2018

function [y, fs] = voz(archivo)

% Imprimir par�metros del archivo
audioinfo('vozP0.wav')

% Leer contenido del archivo
[y, fs] = audioread(archivo);

% Crear vector de tiempo para la graficaci�n
t = 0:1/fs:(length(y) - 1)/fs;
        
% Graficar toda la se�al continua
subplot(211)
    plot(t, y); grid on
    title('Josue y Rodrigo (A)')
    xlabel('Tiempo (s)')
    ylabel('Amplitud')
    legend('De 0 a 1 segundo')

% Graficar la d�cima parte de la se�al continua
subplot(212)
    plot(t, y); grid on
    axis([0 0.1 min(y) max(y)])
    xlabel('Tiempo (s)')
    ylabel('Amplitud')
    legend('De 0 a 0.1 segundos')

end
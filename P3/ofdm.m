% Crea una señal ofdm usando un archivo de audio.
%   
% El proceso realiza los siguientes pasos:
%
%   1. Mapeo de modulación 
%       
%       Agrupar cada byte de la señal de voz en grupos de 2 bits para QPSK
%       o de 4 bits para 16-QAM, y asociar coordenadas de acuerdo a la 
%       constelación correspondiente.
%
%   2. Creación de tramas
%
%       Agrupar valores de coordenadas en grupos de 2k u 8k, según el modo
%       y tipo de modulación.
%
%   3. Aplicar Transformada Inversa de Fourier
%
%       A cada trama se le aplica IFFT para la generación de subportadoras.
%
%   4. Conversión y filtrado
%
%       Se aplica la serie de Fourier para obtener una versión digital de ofdm.
%       
%
%   y = ofdm(arch, modo, modul)
%
% @param arch Nombre del archivo wav
% @param modo Elección de tamaño de trama
%              0 = Subportadoras de 2048 (modo 2k)
%              1 = Subportadoras de 8192 (modo 8k)
%
% @param modul Elección del tipo de modulación
%               0 = QPSK
%               1 = 16-QAM
%
% @return y Señal ofdm analógica
%
% @author Josue M. Contreras Rocha
% @author Rodrigo Roberto Arce Anguiano
% @date 17/Octubre/2018

function y = ofdm(arch, modo, modul)

% Validación de argumentos
if modo ~= 0 && modo ~= 1
   error('Invalid value of modo') 
end

if modul ~= 0 && modul ~= 1
   error('Invalid value of modul') 
end

% Leer señal de audio
[v , ~] = audioread(arch,'native');

% Mapeo de modulación
c = mapmodul(v, modo, modul);

% Crear subportadoras
subPort = ifft(c);

% Calcular armónicas de la serie de Fourier 
y = fourier(subPort);

% Generar gráfica
T = 0.01;
x = 0 : T : T*(length(y) - 1);
plot(x, y);

end
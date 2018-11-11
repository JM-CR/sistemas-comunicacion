% Calcula el ancho de banda absoluto, de 3dB y de potencia para tres señales periódicas.
%
% Las señales disponibles son:
%   1. Senoidal
%   2. Cuadrada
%   3. Triangular
% 
%   band(type, frec)
%
% @param type Número de señal elegida
% @param frec Frecuencia fundamental en Hz
%
% @author Josue M. Contreras Rocha
% @author Rodrigo Roberto Arce Anguiano
% @date 11/Noviembre/2018

function band(type, frec)

% Validar argumentos
if type < 1 || type > 3
   error('Invalid value of type') 
end

% Calcular BW absoluto
abs = absBand(type, frec);

% Calcular BW de 3dB
dec = decBand(type, frec);

% Calcular BW de potencia
pot = potBand(type, frec);

% Desplegar resultados
fprintf('\n  Ancho de banda de 3dB: %.3f Hz', abs)
fprintf('\n  Ancho de banda absoluto: %.3f Hz', dec)
fprintf('\n  Ancho de banda de potencia: %.3f Hz\n\n', pot)

end
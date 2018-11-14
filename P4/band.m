% Calcula el ancho de banda absoluto, de 3dB y de potencia para señales periódicas.
% 
%   band(type, frec, ampl)
%
% @param frec Frecuencia fundamental en Hz
% @param ampl Amplitud de la señal
% @param type Señal elegida
%              1 = Senoidal
%              2 = Cuadrada
%              3 = Triangular
%
% @author Josue M. Contreras Rocha
% @author Rodrigo Roberto Arce Anguiano
% @date 11/Noviembre/2018

function band(type, frec, ampl)

% Validar argumentos
if type < 1 || type > 3
   error('Invalid value of type') 
end

% Obtener CTFS
[dc, Cn, P] = fourierSerie(type, frec, ampl);

% Calcular ancho de banda
abs = absBand(type, Cn);               % Absoluto
dec = decBand(type, Cn, P, frec);      % De 3dB
pot = potBand(type, dc, Cn, P, frec);  % De potencia

% Desplegar resultados
fprintf('\n  Ancho de banda de 3dB: %.2f Hz', dec)
fprintf('\n  Ancho de banda absoluto: %.2f Hz', abs)
fprintf('\n  Ancho de banda de potencia: %.2f Hz\n\n', pot)

end
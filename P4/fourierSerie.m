% Obtiene CFTS y potenca de la señal periódica correspondiente.
% 
%   [dc, Cn, P] = fourierSerie(type, frec, ampl)
%
% @param frec Frecuencia fundamental en Hz
% @param ampl Amplitud de la señal
% @param type Señal elegida
%              1 = Senoidal
%              2 = Cuadrada
%              3 = Triangular
%
% @return Cn Expresión de CTFS váida para n > 0
% @return dc Valor promedio de la señal
% @return P Potencia promedio de la señal
%
% @author Josue M. Contreras Rocha
% @date 11/Noviembre/2018

function [dc, Cn, P] = fourierSerie(type, frec, ampl)

% Identificar señal a evaluar
if type == 1
    % Calcular métricas | Sinusoidal
    Cn = frec;
    dc = 0;
    P = ampl^2/2;
    
elseif type == 2
    % Calcular métricas | Cuadrada
    Cn = @(n) abs(ampl*sqrt(2 - 2.*cos(n.*pi))./(2*pi.*n));
    dc = ampl/2;
    P = ampl^2/2;
    
else
    % Calcular métricas | Triangular
    Cn = @(n) abs(ampl*(cos(n.*pi) - 1)./(pi*pi.*n.^2));
    dc = ampl/2;
    P = ampl^2/3;
end

end
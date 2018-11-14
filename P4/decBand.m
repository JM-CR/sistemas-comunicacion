% Calcula el ancho de banda de 3dB para la señal elegida.
%
%   dec = decBand(type, Cn, P, frec)
%
% @param Cn Expresión de CTFS váida para n > 0
% @param P Potencia total de la señal
% @param frec Frecuencia fundamental
% @param type Señal elegida
%              1 = Senoidal
%              2 = Cuadrada
%              3 = Triangular
%
% @return dec Ancho de banda de 3dB
%
% @author Josue M. Contreras Rocha
% @author Rodrigo Roberto Arce Anguiano
% @date 11/Noviembre/2018

function dec = decBand(type, Cn, P, frec)

% Evaluar caso
if type == 1
    dec = Cn;
else
    maxPot = P/2;  % Pérdida del 50% de potencia
    cont = 1;      % Contador
    
    % Encontrar la armónica con mayor pérdida
    while 2*Cn(cont)^2 > maxPot
        cont = cont + 1;
    end
    
    % Ancho de banda
    dec = cont*frec;
end

end
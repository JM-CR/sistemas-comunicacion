% Calcula el ancho de banda absoluto para la señal elegida.
%
%   abs = absBand(type)
%
% @param Cn Expresión de CTFS váida para n > 0
% @param type Señal elegida
%              1 = Senoidal
%              2 = Cuadrada
%              3 = Triangular
%
% @return abs Ancho de banda absoluto
%
% @author Josue M. Contreras Rocha
% @date 11/Noviembre/2018

function abs = absBand(type, Cn)

% Evaluar caso
if type == 1    
    abs = Cn;   % Senoidal
else
    abs = Inf;  % Cualquier otra periódica
end

end


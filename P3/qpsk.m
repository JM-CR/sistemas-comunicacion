% Realiza el mapeo en la constelación QPSK.
%
%     map = qpsk(bitGroup, modo)
%
% @param bitGroup String de bits en grupos de 2
% @param modo Elección de tamaño de trama
%              0 = Subportadoras de 2048 (modo 2k)
%              1 = Subportadoras de 8192 (modo 8k)
%
% @return map Mapeo de binario a complejo
%
% @author Josue M. Contreras Rocha
% @date 20/Octubre/2018

function map = qpsk(bitGroup, modo)

% Inicializar matriz de mapeo dependiendo del modo
if modo == 0
    m = ceil(length(bitGroup)/2048);  % Redondear renglones hacia arriba
    map = zeros(2048, m);
else
    m = ceil(length(bitGroup)/8192);  % Redondear renglones hacia arriba
    map = zeros(8192, m);
end

% Evaluar cada caso
map(bitGroup == '00') = 1 + 1j;
map(bitGroup == '01') = 1 - 1j;
map(bitGroup == '10') = -1 + 1j;
map(bitGroup == '11') = -1 - 1j;

end
% Realiza el mapeo en la constelación QPSK.
%
%     map = qpsk(bitGroup)
%
% @param bitGroup Bits en grupos de 2
% @return map Mapeo de binario a complejo
%
% @author Josue M. Contreras Rocha
% @date 20/Octubre/2018

function map = qpsk(bitGroup)

% Inicializar matriz de mapeo
map = zeros(1, length(bitGroup));

% Evaluar cada caso
map(bitGroup == '00') = 1 + 1j;
map(bitGroup == '01') = 1 - 1j;
map(bitGroup == '10') = -1 + 1j;
map(bitGroup == '11') = -1 - 1j;

end
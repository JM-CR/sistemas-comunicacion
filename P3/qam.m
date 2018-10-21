% Realiza el mapeo en la constelación 16-QAM.
%
%     map = qam(bitGroup)
%
% @param bitGroup Bits en grupos de 4
% @return map Mapeo de binario a complejo
%
% @author Josue M. Contreras Rocha
% @date 20/Octubre/2018

function map = qam(bitGroup)

% Inicializar matriz de mapeo
map = zeros(1, length(bitGroup));

% Evaluar cada caso
map(bitGroup == '0000') = 3 + 3j;
map(bitGroup == '0001') = 3 + 1j;
map(bitGroup == '0010') = 1 + 3j;
map(bitGroup == '0011') = 1 + 1j;
map(bitGroup == '0100') = 3 - 3j;
map(bitGroup == '0101') = 3 - 1j;
map(bitGroup == '0110') = 1 - 3j;
map(bitGroup == '0111') = 1 - 1j;
map(bitGroup == '1000') = -3 + 3j;
map(bitGroup == '1001') = -3 + 1j;
map(bitGroup == '1010') = -1 + 3j;
map(bitGroup == '1011') = -1 + 1j;
map(bitGroup == '1100') = -3 - 3j;
map(bitGroup == '1101') = -3 - 1j;
map(bitGroup == '1110') = -1 - 3j;
map(bitGroup == '1111') = -1 - 1j;

end


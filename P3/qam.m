% Realiza el mapeo en la constelación 16-QAM.
%
%     map = qam(bitGroup, modo)
%
% @param bitGroup String de bits en grupos de 4
% @param modo Elección de tamaño de trama
%              0 = Subportadoras de 2048 (modo 2k)
%              1 = Subportadoras de 8192 (modo 8k)
%
% @return map Mapeo de binario a complejo
%
% @author Josue M. Contreras Rocha
% @date 20/Octubre/2018

function map = qam(bitGroup, modo)

% Inicializar matriz de mapeo dependiendo del modo
if modo == 0
    m = ceil(length(bitGroup)/2048);  % Redondear renglones hacia arriba
    map = zeros(2048, m);
else
    m = ceil(length(bitGroup)/8192);  % Redondear renglones hacia arriba
    map = zeros(8192, m);
end
    
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


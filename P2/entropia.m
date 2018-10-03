% Calcula el límite teórico de compresión o entropía.
%
%     H = entropia(I)
%
% @param I Matriz de mensajes
% @return H Valor de la entropía
%
% @author Josue M. Contreras Rocha
% @date 29/Septiembre/2018

function H = entropia(I)

% Cálculo de probabilidad
count = imhist(I);    % Total por mensaje
fr = count/numel(I);

% Cálculo de entropía
H = sum(fr.*log2(1./fr), 'omitnan');

end
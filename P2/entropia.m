% Calcula el l�mite te�rico de compresi�n o entrop�a.
%
%     H = entropia(I)
%
% @param I Matriz de mensajes
% @return H Valor de la entrop�a
%
% @author Josue M. Contreras Rocha
% @date 29/Septiembre/2018

function H = entropia(I)

% C�lculo de probabilidad
count = imhist(I);    % Total por mensaje
fr = count/numel(I);

% C�lculo de entrop�a
H = sum(fr.*log2(1./fr), 'omitnan');

end
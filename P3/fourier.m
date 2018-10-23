% Realiza el cálculo de los coeficientes de la serie de Fourier.
%
% El objetivo es generar una combinación lineal de cada 2048 ó 8192 valores
% de entrada, lo que evita el efecto multi-trayectoria.
%
%     armonic = fourier(subPort)
%
% @param subPort Vector IFFT con subportadoras
% @return armonic Armónicas calculadas con la serie de Fourier
%
% @author Josue M. Contreras Rocha
% @date 20/Octubre/2018

function armonic = fourier(subPort)

% Inicializar parámetros
[m, n] = size(subPort);   % Número de renglones y columnas   
armonic = zeros(m, n);    % Armónicas

% Calcular componentes de la serie de Fourier
indexSuma = 0 : n-1;

for i = 1:m
    Re = real(subPort(i, :)).*cos(2*pi*i.*indexSuma/n);
    Im = imag(subPort(i, :)).*sin(2*pi*i.*indexSuma/n);
    armonic(i, :) = Re + Im;
end

% Concatenar el vector de coeficientes
armonic = armonic(:)';

end
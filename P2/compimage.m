% Calcula la DCT de bloques de 8x8 pixeles de una imagen para su procesamiento
% y almacenamiento digital. 
%
% El objetivo es visualizar la codificaci�n de entrop�a al procesar una
% imagen con la Discrete Cosine Transform para comprimir y compactar energ�a.
%
% La imagen a tratar ser� finalmente a blanco y negro. El valor de umbral
% ser� usado para quitar componentes de alta frecuencia y visualizar la
% p�rdida en la calidad.
%       
%    compimage(dir, umbral)
%
% @param dir Ruta absoluta o relativa a la imagen
% @param umbral Valor a comparar contra la magnitud de los coeficientes DCT
%
% @author Josue M. Contreras Rocha
% @author Rodrigo Roberto Arce Anguiano
% @date 23/Septiembre/2018

function compimage(dir, umbral)

% Leer imagen original - 25/Septiembre/2018
A = imread(dir);     % Leer imagen
I = rgb2gray(A);     % Pasar a blanco y negro

% Calcular probabilidad de cada mensaje - 25/Septiembre/2018
mensaje = 0:255;                   % Mensajes disponibles
count = histcounts(I, mensaje);    % Contar total de cada mensaje
total = numel(I);                  % Total de mensajes
fr = count/total;                  % C�lculo de frecuencia relativa

% Dividir imagen en bloques de 8x8 pixeles
% Aplicar DCT a cada bloque de 8x8 pixeles
fun = @(block_struct) dct2(block_struct.data);   % Funci�n para cada bloque
C= blockproc(I,[8 8], fun);

% Hacer cero los coeficientes de la DCT mayores a 'umbral'
% Aplicar DCT inversa a la matriz con valores de cero

% Calcular la entrop�a (H) de la imagen original - 25/Septiembre/2018
H=sum(fr.*log2(1./fr), 'omitnan');

% Calcular la entrop�a de la DCT
% Calcular la entrop�a de la DCT inversa
% Calcular la entrop�a de la imagen recontruida
% Calcular el error cuadr�tico medio (ECM)
% Calcular potencia de la imagen
% Calcular porcentaje de compresi�n
% Calcular porcentaje Err (ECM/Pot)

% Desplegar imagen original - 25/Septiembre/2018
close all
figure('units', 'normalized', 'outerposition', [0 0 1 1])

P1 = subplot(221, 'Position', [0.05 0.5838 0.3347 0.3412]);
    imshow(I)
    title('Original', 'FontSize', 14)
    text(P1.XLim(2)*1.05, P1.YLim(2)/2, ['H =  ',num2str(H)], 'FontSize', 13)

% Desplegar DCT
subplot(222)
    imshow(C)

% Desplegar DCT con coeficientes de cero
% Desplegar imagen recreada
% Desplegar los c�lculos de ECM, Err y % de compresi�n

end
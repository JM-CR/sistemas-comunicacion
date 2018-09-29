% Calcula la DCT de bloques de 8x8 pixeles de una imagen para su procesamiento
% y almacenamiento digital. 
%
% El objetivo es visualizar la codificación de entropía al procesar una
% imagen con la Discrete Cosine Transform para comprimir y compactar energía.
%
% La imagen a tratar será finalmente a blanco y negro. El valor de umbral
% será usado para quitar componentes de alta frecuencia y visualizar la
% pérdida en la calidad.
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

% Aplicar DCT a cada bloque de 8x8 pixeles
fun = @(block_struct) dct2(block_struct.data);   % Función para cada bloque
C = blockproc(I,[8 8], fun);

% Hacer cero los coeficientes de la DCT mayores a 'umbral'
mCeros = abs(C) < umbral;
cUmbral = C.*mCeros;
%cUmbral(abs(C) < umbral) = 0;

% Aplicar DCT inversa a la matriz con valores de cero (cUmbral)
fun2 = @(block_struct) idct2(block_struct.data);   % Función para cada bloque
comprimida = blockproc(cUmbral,[8 8], fun2);

% Calcular la entropía (H) de la imagen original - 25/Septiembre/2018
H1 = entropia(I);
entropy(I)

% Calcular la entropía de la DCT
H2 = entropia(abs(C));
entropy(C)

% Calcular la entropía de la DCT con valores de cero
H3 = entropia(abs(cUmbral));
entropy(cUmbral)

% Calcular la entropía de la imagen recontruida
H4 = entropia(comprimida);
entropy(comprimida)

% Calcular el error cuadrático medio (ECM)
% Calcular potencia de la imagen
% Calcular porcentaje de compresión
% Calcular porcentaje Err (ECM/Pot)

% Desplegar imagen original - 25/Septiembre/2018
close all
figure('units', 'normalized', 'outerposition', [0 0 1 1])

P1 = subplot(221);
    imshow(I)
    title('Original', 'FontSize', 14)
    text(P1.XLim(2)*1.05, P1.YLim(2)/2, ['H =  ',num2str(H1)], 'FontSize', 13)

% Desplegar DCT
P2 = subplot(222);
    imshow(C)
    title('DCT', 'FontSize', 14)
    text(P2.XLim(2)*1.05, P2.YLim(2)/2, ['H =  ',num2str(H2)], 'FontSize', 13)

% Desplegar DCT con coeficientes de cero
P3 = subplot(223);
    imshow(cUmbral)
    title('Umbral', 'FontSize', 14)
    text(P3.XLim(2)*1.05, P3.YLim(2)/2, ['H =  ',num2str(H3)], 'FontSize', 13)

% Desplegar imagen recreada
P4 = subplot(224);
    imshow(uint8(comprimida))
    title('Comprimida', 'FontSize', 14)
    text(P4.XLim(2)*1.05, P4.YLim(2)/2, ['H =  ',num2str(H4)], 'FontSize', 13)

% Desplegar los cálculos de ECM, Err y % de compresión

end

function H = entropia(I)

% Cálculo de probabilidad
count = histcounts(I, unique(I));    % Total por mensaje
total = numel(I);
fr = count/total;

% Cálculo de entropía
H=sum(fr.*log2(1./fr), 'omitnan');

end
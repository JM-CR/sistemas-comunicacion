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
mCeros = abs(C) < umbral;    % Hallar valores menores a umbral
cUmbral = C.*mCeros;

% Aplicar DCT inversa a la matriz con valores de cero (cUmbral)
fun2 = @(block_struct) idct2(block_struct.data);   % Función para cada bloque
comprimida = blockproc(cUmbral,[8 8], fun2);

% Calcular la entropía (H) de la imagen original - 25/Septiembre/2018
H1 = entropia(I);

% Calcular la entropía de la DCT
H2 = entropia(C);

% Calcular la entropía de la DCT con valores de cero
H3 = entropia(cUmbral);

% Calcular la entropía de la imagen recontruida
H4 = entropia(comprimida);

% Calcular el error cuadrático medio (ECM) - Pendiente
% Calcular potencia de la imagen - Moshi
% Calcular porcentaje de compresión - Rodrigo
% Calcular porcentaje Err (ECM/Pot) - Rodrigo

% Desplegar imagen original - 25/Septiembre/2018
close all
figure('units', 'normalized', 'outerposition', [0 0 1 1])

P1 = subplot('Position', [0.07 0.5538 0.3347 0.3412]);
    imshow(I)
    title('Original', 'FontSize', 14)
    text(P1.XLim(2)*1.05, P1.YLim(2)/2, ['H =  ',num2str(H1)], 'FontSize', 13)

% Desplegar DCT
P2 = subplot('Position', [0.5403 0.5538 0.3347 0.3412]);
    imshow(C)
    title('DCT', 'FontSize', 14)
    text(P2.XLim(2)*1.05, P2.YLim(2)/2, ['H =  ',num2str(H2)], 'FontSize', 13)

% Desplegar DCT con coeficientes de cero
P3 = subplot('Position', [0.07 0.1100 0.3347 0.3412]);
    imshow(cUmbral)
    title('Umbral', 'FontSize', 14)
    text(P3.XLim(2)*1.05, P3.YLim(2)/2, ['H =  ',num2str(H3)], 'FontSize', 13)

% Desplegar imagen recreada
P4 = subplot('Position', [0.5403 0.1100 0.3347 0.3412]);
    imshow(uint8(comprimida))
    title('Comprimida', 'FontSize', 14)
    text(P4.XLim(2)*1.05, P4.YLim(2)/2, ['H =  ',num2str(H4)], 'FontSize', 13)

% Desplegar los cálculos de ECM, Err y % de compresión - Moshi

end
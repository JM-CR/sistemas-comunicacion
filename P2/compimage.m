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
dct = blockproc(I,[8 8], fun);
dctSin = dct;

% Hacer cero los coeficientes de la DCT mayores a 'umbral'
dct(abs(dct) < umbral) = 0;
dctCon = dct;

% Aplicar DCT inversa a la matriz con valores de cero (cUmbral)
fun = @(block_struct) idct2(block_struct.data);   % Función para cada bloque
comprimida = blockproc(dct, [8 8], fun);

% Calcular la entropía (H) de la imagen original
H1 = entropia(I);

% Calcular la entropía de la DCT
H2 = entropia(round(dctSin));

% Calcular la entropía de la DCT con valores de cero
H3 = entropia(round(dctCon));

% Calcular la entropía de la imagen recontruida
H4 = entropia(uint8(comprimida));

% Calcular el error cuadrático medio (ECM)
ecm = sum((comprimida(:) - double(I(:))).^2)./numel(comprimida);

% Calcular potencia de la imagen
potImagen = sum(I(:).^2);

% Calcular porcentaje de compresión
noCeros = sum(abs(dctCon(:)) > 0);
pixeles = numel(dctCon);
porComp = (1 - (noCeros/pixeles))*100;

% Calcular porcentaje Err (ECM/Pot)
err = ecm/potImagen*100;

% Crear figure y asignar propiedades
close all
figure('units', 'normalized', 'outerposition', [0 0 1 1])
T = annotation('textbox', [0.26 0.95 .55 .04]);     % Título global
    set(T, 'String', ['Práctica 2 (Josue Contreras & Rodrigo Arce). Umbral: ' num2str(umbral)]);
    set(T, 'FontWeight', 'Bold');
    set(T, 'HorizontalAlignment', 'center');
    set(T, 'LineStyle', 'none', 'FontSize', 15);
    
% Desplegar imagen original
P1 = subplot('Position', [0.07 0.5238 0.3347 0.3412]);
    imshow(I)
    title('Original', 'FontSize', 14)
    text(P1.XLim(2)*1.05, P1.YLim(2)/2, ['H =  ',num2str(H1)], 'FontSize', 13)

% Desplegar DCT
P2 = subplot('Position', [0.5403 0.5238 0.3347 0.3412]);
    imshow(dctSin)
    title('DCT sin Umbral', 'FontSize', 14)
    text(P2.XLim(2)*1.05, P2.YLim(2)/2, ['H =  ',num2str(H2)], 'FontSize', 13)

% Desplegar DCT con coeficientes de cero, ECM y Err
P3 = subplot('Position', [0.07 0.1100 0.3347 0.3412]);
    imshow(dctCon)
    title('DCT con Umbral', 'FontSize', 14)
    text(P3.XLim(2)*1.05, P3.YLim(2)/2, ['H =  ',num2str(H3)], 'FontSize', 13)

% Desplegar ECM y ERR
text(P3.XLim(2)*.3, P3.YLim(2)*1.15, ['ECM =  ' num2str(ecm)], 'FontSize', 13)
text(P3.XLim(2)*1.17, P3.YLim(2)*1.15, ['Err =  ' num2str(err) '%'], 'FontSize', 13)
    
% Desplegar imagen recreada y porcentaje de compresión
P4 = subplot('Position', [0.5403 0.1100 0.3347 0.3412]);
    imshow(uint8(comprimida))
    title('Comprimida', 'FontSize', 14)
    text(P4.XLim(2)*1.05, P4.YLim(2)/2, ['H =  ',num2str(H4)], 'FontSize', 13)
    
% Desplegar porcentaje de compresión
text(P4.XLim(2)*.3, P4.YLim(2)*1.15, ['% Compresión =  ' num2str(porComp) '%'], 'FontSize', 13)   % Compresi�n
    
end
function test(dir, umbral)

% Leer imagen
color = imread(dir);     

% Convertir a BN y calcular entropia
BN = rgb2gray(color);
H1=entropia(BN)

% Aplicar DCT en bloques y calcular entropia
fun = @(block_struct) dct2(block_struct.data);   % Función para cada bloque
dct = blockproc(BN,[8 8], fun);
H2=entropia(dct)
dctSin = dct;

% Aplicar umbral y calcular entropia
dct(abs(dct) < umbral) = 0;
H3=entropia(dct)
dctCon = dct;

% Aplicar IDCT en bloques y calcular entropia
fun2 = @(block_struct) idct2(block_struct.data);   % Función para cada bloque
comp = blockproc(dct,[8 8], fun2);
H4=entropia(comp);

% Calcular el error cuadrático medio (ECM) - Pendiente
% Calcular potencia de la imagen - Moshi
% Calcular porcentaje de compresión - Rodrigo
noCeros = sum(abs(comp(:)) > 0);
pixeles = numel(comp);
porComp = (1 - (noCeros/pixeles))*100;

% Calcular porcentaje Err (ECM/Pot) - Rodrigo



% Desplegar imagen original
close all
figure('units', 'normalized', 'outerposition', [0 0 1 1])
T = annotation('textbox', [0.26 0.95 .45 .04]);     % Título global
    set(T, 'String', ['Práctica 2 (Josue Contreras & Rodrigo Arce). Umbral de ', num2str(umbral)]);
    set(T, 'FontWeight', 'Bold');
    set(T, 'HorizontalAlignment', 'center');
    set(T, 'LineStyle', 'none', 'FontSize', 15);
    
P1 = subplot('Position', [0.07 0.5238 0.3347 0.3412]);
    imshow(BN)
    title('Original', 'FontSize', 14)
    text(P1.XLim(2)*1.05, P1.YLim(2)/2, ['H =  ',num2str(H1)], 'FontSize', 13)

% Desplegar DCT
P2 = subplot('Position', [0.5403 0.5238 0.3347 0.3412]);
    imshow(dctSin)
    title('DCT', 'FontSize', 14)
    text(P2.XLim(2)*1.05, P2.YLim(2)/2, ['H =  ',num2str(H2)], 'FontSize', 13)

% Desplegar DCT con coeficientes de cero, ECM y potencia de imagen
P3 = subplot('Position', [0.07 0.1100 0.3347 0.3412]);
    imshow(dctCon)
    title('Umbral', 'FontSize', 14)
    text(P3.XLim(2)*1.05, P3.YLim(2)/2, ['H =  ',num2str(H3)], 'FontSize', 13)
    text(P3.XLim(2)*.3, P3.YLim(2)*1.15, ['ECM =  ' num2str(porComp)], 'FontSize', 13)    % ECM
    text(P3.XLim(2)*1.17, P3.YLim(2)*1.15, ['Err =  ' num2str(porComp)], 'FontSize', 13)   % Err
    
% Desplegar imagen recreada y porcentaje de compresión
P4 = subplot('Position', [0.5403 0.1100 0.3347 0.3412]);
    imshow(uint8(comp))
    title('Comprimida', 'FontSize', 14)
    text(P4.XLim(2)*1.05, P4.YLim(2)/2, ['H =  ',num2str(H4)], 'FontSize', 13)
    text(P4.XLim(2)*.3, P4.YLim(2)*1.15, ['% Compresión =  ' num2str(porComp) '%'], 'FontSize', 13)   % Compresión

end
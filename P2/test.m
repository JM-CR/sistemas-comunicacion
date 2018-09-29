function test(dir, umbral)

% Leer imagen
color = imread(dir);     

% Convertir a BN y calcular entropia
BN = rgb2gray(color);
H1=entropy(BN);
entropia(BN)

% Aplicar DCT en bloques y calcular entropia
fun = @(block_struct) dct2(block_struct.data);   % Función para cada bloque
dct = blockproc(BN,[8 8], fun);
H2=entropy(dct);
entropia(dct)
dctSin = dct;

% Aplicar umbral y calcular entropia
dct(abs(dct) < umbral) = 0;
H3=entropy(dct);
entropia(dct)
dctCon = dct;

% Aplicar IDCT en bloques y calcular entropia
fun2 = @(block_struct) idct2(block_struct.data);   % Función para cada bloque
comp = blockproc(dct,[8 8], fun2);
H4=entropy(comp);
entropia(comp)

% Calcular el error cuadrático medio (ECM) - Pendiente
% Calcular potencia de la imagen - Moshi
% Calcular porcentaje de compresión - Rodrigo
noCeros = sum(abs(dct(:)) > 0);
pixeles = numel(dct);
porComp = (1 - (noCeros/pixeles))*100;

% Calcular porcentaje Err (ECM/Pot) - Rodrigo



% Mostrar imagenes
close all
figure('units', 'normalized', 'outerposition', [0 0 1 1])

P1 = subplot(221);
    imshow(BN)
    title('Original', 'FontSize', 14)
    text(P1.XLim(2)*1.05, P1.YLim(2)/2, ['H =  ',num2str(H1)], 'FontSize', 13)
    
P2 = subplot(222);
    imshow(dctSin)
    title('DCT', 'FontSize', 14)
    text(P2.XLim(2)*1.05, P2.YLim(2)/2, ['H =  ',num2str(H2)], 'FontSize', 13)

P3 = subplot(223);
    imshow(dctCon)
    title('Umbral', 'FontSize', 14)
    text(P3.XLim(2)*1.05, P3.YLim(2)/2, ['H =  ',num2str(H3)], 'FontSize', 13)

P4 = subplot(224);
    imshow(uint8(comp))
    title('Comprimida', 'FontSize', 14)
    text(P4.XLim(2)*1.05, P4.YLim(2)/2, ['H =  ',num2str(H4)], 'FontSize', 13)
end

% Desplegar los cálculos de ECM, Err y % de compresión - Moshi
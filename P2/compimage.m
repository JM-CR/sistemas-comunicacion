function compimage(dir, umbral)

% Leer imagen original - 25/Septiembre/2018
A = imread(dir);
I = rgb2gray(A);

% Calcular probabilidad de cada mensaje - 25/Septiembre/2018


% Dividir imagen en bloques de 8x8 pixeles
% Aplicar DCT a cada bloque de 8x8 pixeles
% Hacer cero los coeficientes de la DCT mayores a 'umbral'
% Aplicar DCT inversa a la matriz con valores de cero

% Calcular la entropía de la imagen original - 25/Septiembre/2018


% Calcular la entropía de la DCT
% Calcular la entropía de la DCT inversa
% Calcular la entropía de la imagen recontruida
% Calcular el error cuadrático medio (ECM)
% Calcular potencia de la imagen
% Calcular porcentaje de compresión
% Calcular porcentaje Err (ECM/Pot)

% Desplegar imagen original - 25/Septiembre/2018
H = figure
subplot(221)
    imshow(I)
    title('Original')

% Desplegar DCT
% Desplegar DCT con coeficientes de cero
% Desplegar imagen recreada
% Desplegar los cálculos de ECM, Err y % de compresión

end
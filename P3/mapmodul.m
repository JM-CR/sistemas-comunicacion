function c = mapmodul(v, modo, modul)

% Escalar valores de 'v' a un rango de 0 a 255
esc = uint8(v);

% Pasar cada valor a binario | En bytes
bin = dec2bin(esc);

% Generar bitstream
str = convertCharsToStrings(bin);

% Recortar bitstream cada n chars
str = regexp(str, sprintf('\\w{1,%d}', n), 'match');

%Regresar bitstream a chars
chr = convertStringsToChars(str);
chr = char(chr);

% Mapear valores binarios a complejo
c = 1;

end
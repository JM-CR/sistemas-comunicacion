% Realiza el mapeo de modulación.
%
%     c = mapmodul(v, modo, modul)
%
% @param v Muestras del archivo de audio a fs
% @param modo Elección de tamaño de trama
%              0 = Subportadoras de 2048 (modo 2k)
%              1 = Subportadoras de 8192 (modo 8k)
%
% @param modul Elección del tipo de modulación
%               0 = QPSK
%               1 = 16-QAM
%
% @return y Señal ofdm analógica
%
% @author Josue M. Contreras Rocha
% @author Rodrigo Roberto Arce Anguiano
% @date 17/Octubre/2018

function c = mapmodul(v, modo, modul)

% Pasar cada valor a binario | En bytes
bin = dec2bin(v);

% Generar bitstream
stream = convertCharsToStrings(bin);

% Evaluar tamaño para la modulación
if modul == 0 
    tamGroup = 2;   % QPSK
elseif modul == 1
    tamGroup = 4;   % 16-QAM
end
    
% Recortar bitstream cada n chars
bitGroup = regexp(stream, sprintf('\\d{%d}', tamGroup), 'match');   

% Mapear valores binarios a complejo
if modul == 0
    bitGroup(bitGroup == '00') = 1 + 1j;
    bitGroup(bitGroup == '01') = 1 - 1j;
    bitGroup(bitGroup == '10') = -1 + 1j;
    bitGroup(bitGroup == '11') = -1 - 1j;
else
    bitGroup(bitGroup == '0000') = 3 + 3j;
    bitGroup(bitGroup == '0001') = 3 + 1j;
    bitGroup(bitGroup == '0010') = 1 + 3j;
    bitGroup(bitGroup == '0011') = 1 + 1j;
    bitGroup(bitGroup == '0100') = 3 - 3j;
    bitGroup(bitGroup == '0101') = 3 - 1j;
    bitGroup(bitGroup == '0110') = 1 - 3j;
    bitGroup(bitGroup == '0111') = 1 - 1j;
    bitGroup(bitGroup == '1000') = -3 + 3j;
    bitGroup(bitGroup == '1001') = -3 + 1j;
    bitGroup(bitGroup == '1010') = -1 + 3j;
    bitGroup(bitGroup == '1011') = -1 + 1j;
    bitGroup(bitGroup == '1100') = -3 - 3j;
    bitGroup(bitGroup == '1101') = -3 - 1j;
    bitGroup(bitGroup == '1110') = -1 - 3j;
    bitGroup(bitGroup == '1111') = -1 - 1j;
end

% Mapeo de string a número
complexVector = str2double(bitGroup);

% Generar tramas
c = complexVector;

end
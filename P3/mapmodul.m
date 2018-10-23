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
else
    tamGroup = 4;   % 16-QAM
end
    
% Recortar bitstream cada n chars
bitGroup = regexp(stream, sprintf('\\d{%d}', tamGroup), 'match');   

% Mapear valores binarios a complejo | Generar tramas
if modul == 0
    c = qpsk(bitGroup, modo)';   % Regresar transpuesta
else
    c = qam(bitGroup, modo)';    % Regresar transpuesta
end

end
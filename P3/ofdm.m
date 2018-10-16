function y = ofdm(arch, modo, modul)

% Leer señal de audio
[v, fs] = audioread(arch, 'native')

% Mapeo de modulación
c = mapmodul(v, modo, modul);

end
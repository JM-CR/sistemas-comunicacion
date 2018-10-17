function y = ofdm(arch, modo, modul)

% Leer señal de audio
[v , fs] = audioread(arch,'native');

% Recortar muestra a 2 segundos
v = v(1 : 2*fs);

% Mapeo de modulación
c = mapmodul(v, modo, modul);

end
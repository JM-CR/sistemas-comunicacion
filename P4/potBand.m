% Calcula el ancho de banda de potencia para la señal elegida.
%
%   pot = potBand(type, dc, Cn, P, frec)
%
% @param dc Valor promedio de la señal
% @param Cn Expresión de CTFS váida para n > 0
% @param P Potencia promedio de la señal
% @param frec Frecuencia fundamental
% @param type Señal elegida
%              1 = Senoidal
%              2 = Cuadrada
%              3 = Triangular
%
% @return pot Ancho de banda de potencia
%
% @author Josue M. Contreras Rocha
% @author Rodrigo Roberto Arce Anguiano
% @date 11/Noviembre/2018

function pot = potBand(type, dc, Cn, P, frec)
    
% Evaluar tipo
if type == 1
   % Senoidal
   pot = Cn;
else
   sum = dc^2;       % Acumulador
   cont = 0;         % Contador
   maxPot = .99*P;   % El 99% de la potencia
   
   % Verificar armónicas
   while maxPot > sum
       cont = cont + 1;
       sum = sum + 2*Cn(cont)^2;
   end
   
   % Ancho de banda
   pot = cont*frec;
end

end
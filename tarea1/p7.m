
%Pregunta 7

%Parámetros
c1 = 0.175; n = 800; h = 1.0; t = (0:h:n);
%f a variar
f = 0.0005;
%Vectores a usar para u(t) con ambos métodos
uModif = zeros(1, length(t));
uProgre = zeros(1, length(t));
utilda = zeros(1, length(t));

for j = 1:n / h
    %Cálculo de u(t) con Euler modificado
    uModif(1) = 0;
    u_Prima = c1 * uModif(j) * (uModif(j) - alfa) * (1 - uModif(j)) + f;
    utilda(1 + j) = uModif(j) + h / 2 * u_Prima;
    ut_Prima = c1 * utilda(j + 1) * (utilda(j + 1) - alfa) * (1 - utilda(j + 1)) + f;
    uModif(1 + j) = uModif(j) + h * ut_Prima;
    %Cálculo de u(t) con Euler progresivo
    uProgre(1) = 0;
    up_prima = c1 * uProgre(j) * (uProgre(j) - alfa) * (1 - uProgre(j)) + f;
    uProgre(j + 1) = uProgre(j) + h * up_prima;
end

%Gráficos
hold on
plot(t, uProgre, 'b'), xlabel('t'), ylabel('u(t)')
plot(t, uModif, 'r')
title('Gráfico de u(t) con f=0.0005 (Usando Euler Progresivo y Modificado)')
hold off

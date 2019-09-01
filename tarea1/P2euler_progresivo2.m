%Pregunta 2

%Par�metros
c1 = 0.175; alfa = 0.1; f = 0; n = 800;
%C�lculo de u(t) con h=1.0 (m�todo de Euler Progresivo)
h = 1.0;
t = (0:h:n);
u = zeros(1, length(t));
u(1) = 2 * alfa;

for i = 1:n / h
    u_prima = c1 * u(i) * (u(i) - alfa) * (1 - u(i)) + f;
    u(i + 1) = u(i) + h * u_prima;
end

%C�lculo de u(t) con h maximo (m�todo de Euler Progresivo)
hv = 24.4;
tv = (0:hv:n);
uv = zeros(1, length(tv));
uv(1) = 2 * alfa;

for j = 1:n / hv
    uv_prima = c1 * uv(j) * (uv(j) - alfa) * (1 - uv(j)) + f;
    uv(j + 1) = uv(j) + hv * uv_prima;
end

%C�lculo despreciando t�rminos cuadr�ticos y c�bicos
hm = 114.28;
tm = (0:hm:n);
um = zeros(1, length(tm));
um(1) = 2 * alfa;

for j = 1:n / hm
    um(j + 1) = um(j) * (1 - alfa * c1 * hm);
end

%Gr�ficos
hold on
plot(t, u, 'r')%Gr�fico de u(t) con h=1
plot(tv, uv, 'b')%Gr�fico de u(t) con h max
xlabel('t')
ylabel('u(t)')
title('Gr�fico de u(t) con m�todo de Euler Progresivo')
hold off

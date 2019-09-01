%Pregunta 1

%Parámetros dados
c1 = 0.175;
c2 = 0.025;
alfa = 0.1;
c3 = 0.65;
t = (0:1:800);

u0 = 2 * alfa; %Condicion inicial u(t)
u = zeros(1, length(t)); %vector de ceros para u(t)
u(1) = u0; %establecer la condicion inicial
r = zeros(1, length(t)); %vector de ceros para r(t)
r(1) = 0; %establecer la condicion inicial

%Iteracion con metodo de Euler progresivo
for i = 1:800
    %se definen los f(u,t) y g(r,t) (por enunciado)
    u_prima = c1 * u(i) * (u(i) - alfa) * (1 - u(i)) - c2 * r(i);
    r_prima = c2 * (u(i) - c3 * r(i));
    %se aplica la formula de euler progresivo para u y r
    u(i + 1) = u(i) + u_prima;
    r(i + 1) = r(i) + r_prima;
end

%Grafico
hold on
plot(t, u, 'r');
plot(t, r, 'b');
title('Potencial el�ctrico(u(t)) y variable de restituci�n(r(t)) en funci�n del tiempo');
xlabel('t'), ylabel('u(t),r(t)')
hold off

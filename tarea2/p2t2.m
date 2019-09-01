%Pregunta 2

%Parámetros para el calculo de u(t) y r(t) (pregunta 1)
%Aquí es el mismo codigo de la pregunta 1
c1 = 0.175;
c2 = 0.025;
alfa = 0.1;
c3 = 0.65;
t = (0:1:800);
u0 = 1.5 * alfa;
u = zeros(1, length(t));
u(1) = u0;
r = zeros(1, length(t));
r(1) = 0;

for i = 1:800
    u_prima = c1 * u(i) * (u(i) - alfa) * (1 - u(i)) - c2 * r(i);
    r_prima = c2 * (u(i) - c3 * r(i));
    u(i + 1) = u(i) + u_prima;
    r(i + 1) = r(i) + r_prima;
end

%fin del código de la pregunta 1

%Parámetros para el calculo de sigma(t)
b1 = -0.03;
b2 = 20;
X = 0.3;
sigma_m = 1; %sigma max
sigma = zeros(1, length(t)); %vector de ceros para sigma(t)
a = zeros(1, length(t)); %vector de ceros para a(t)
sigma(1) = 0; %valor inicial de sigma(t)

%Iteracion mediante Euler retrogrado
for i = 1:800

    if u(i + 1) > X
        f(i + 1) = 1; %se define f en base a u(t)
    end

    if u(i + 1) < X
        f(i + 1) = 0; %se define f en base a u(t)
    end

    a(i + 1) = b1 + (b2 - b1) * f(i + 1); %se calcula a(t) mediante iteracion
    sigma(i + 1) = (sigma(i) + sigma_m * max(a(i + 1), 0)) / (1 + abs(a(i + 1)));
    %se calcuma sigma(t) con el metodo de euler retrogrado
    %el valor no estaba explicito en la formula de e. retrogrado pero
    %se despejo sigma(i+1) en la ecuacion
end

%Gráfico
hold on
plot(t, sigma)
title('Tensión de la célula cardiaca en función del tiempo');
xlabel('t'), ylabel('Tensión')
hold off

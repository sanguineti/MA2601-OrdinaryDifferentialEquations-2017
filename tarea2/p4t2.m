%Par�metros para el calculo de u(t) y r(t)
%(mismo codigo usado en la P1)
c1 = 0.175;
c2 = 0.025;
alfa = 0.1;
c3 = 0.65;
t = (0:1:800);
u0 = 2 * alfa;
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

%Par�metros para el calculo de sigma(t)
%(mismo codigo usado en la P2)
t = (0:1:800);
b1 = -0.03;
b2 = 20;
X = 0.3;
sigma_m = 1;
sigma = zeros(1, length(t));
a = zeros(1, length(t));
sigma(1) = 0;

for i = 1:800

    if u(i + 1) > X
        f(i + 1) = 1;
    end

    if u(i + 1) < X
        f(i + 1) = 0;
    end

    a(i + 1) = b1 + (b2 - b1) * f(i + 1);
    sigma(i + 1) = (sigma(i) + sigma_m * max(a(i + 1), 0)) / (1 + abs(a(i + 1)));
end

%Parametros para el calculo de y(t)
k = 0.001; %se define el valor de k
c = sqrt(k); %se define el valor de c en funcion de k
z1 = zeros(1, length(t)); %vector de ceros para z1
z2 = zeros(1, length(t)); %vector de ceros para z2
A = [0 1; -k - c]; %matriz A usada en el calculo del sistema
Id = [1 0; 0 1]; %matriz identidad
B = Id - 0.5 * A; %matriz B usada en el calculo el sistema
B_inv = inv(B); %inversa de la matriz B

%Calculo de y(t) con el metodo del trapecio
for n = 1:800;
    %se utiliza el metodo del trapecio en la iteracion
    zetas = B_inv * [z1(n); z2(n)] + 0.5 * (B_inv) * ([0; -sigma(n + 1)] + A * [z1(n); z2(n)] + [0; -sigma(n)]);
    %se guardan los valor de z1 y z2 obtenidos en la matriz
    z1(n + 1) = zetas(1, :);
    z2(n + 1) = zetas(2, :);

end

%Grafico
plot(t, z1)
title('Acortamiento de la c�lula cardiaca en funci�n del tiempo')
xlabel('t')
ylabel('y(t)')
hold on

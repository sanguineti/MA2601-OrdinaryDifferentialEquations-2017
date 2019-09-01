%Bloqueo El�ctrico (Pregunta 5)
%Par�metros para el calculo de u(t) y r(t)
%Es el mismo codigo usado (y explicado) en la p1
c1 = 0.175;
c2 = 0.025;
alfa = 0.1;
c3 = 0.65;
t = (0:1:800);
u0 = 1.5 * alfa; %Este es el parametro modificado para simular la patologia
u = zeros(1, length(t));
u(1) = u0;
r = zeros(1, length(t));
r(1) = 0;
%iteracion u(t) y r(t)
for i = 1:800
    u_prima = c1 * u(i) * (u(i) - alfa) * (1 - u(i)) - c2 * r(i);
    r_prima = c2 * (u(i) - c3 * r(i));
    u(i + 1) = u(i) + u_prima;
    r(i + 1) = r(i) + r_prima;
end

%Par�metros para el calculo de sigma(t)
%Es el mismo codigo usado (y explicado) en la p2
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
%Es el mismo codigo usado en la p4
k = 0.001;
c = sqrt(k);
z1 = zeros(1, length(t));
z2 = zeros(1, length(t));
A = [0 1; -k - c];
Id = [1 0; 0 1];
B = Id - 0.5 * A;
B_inv = inv(B);

for n = 1:800;
    zetas = B_inv * [z1(n); z2(n)] + 0.5 * (B_inv) * ([0; -sigma(n + 1)] + A * [z1(n); z2(n)] + [0; -sigma(n)]);
    z1(n + 1) = zetas(1, :);
    z2(n + 1) = zetas(2, :);

end

%Graficos
hold on
subplot(2, 2, 1), plot(t, z1); title('Acortamiento de la c�lula cardiaca y(t)');
subplot(2, 2, 2), plot(t, sigma); title('Tensi�n de la c�lula sigma(t)');
subplot(2, 2, 3), plot(t, r); title('Variable de restituci�n r(t)');
subplot(2, 2, 4), plot(t, u); title('Potencial el�ctrico normalizado u(t)'); x
hold off

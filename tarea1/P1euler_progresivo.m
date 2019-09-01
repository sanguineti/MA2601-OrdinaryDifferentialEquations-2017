%Pregunta 1

%Parámetros
h = 1.0; c1 = 0.175; alfa = 0.1; f = 0; n = 800;
%Tiempo de 0 a 800 con paso h
t = (0:h:n);
%Vector de ceros de tamanno t
u = zeros(1, length(t));
%Valores de u inicial
u0 = [-1, 0, alfa / 2, alfa, (alfa + 1) / 2, 1, 2];

for j = 1:length(u0)
    u(1) = u0(j); %Calcula u(t) para cada valor de u0

    for i = 1:n / h
        u_prima = c1 * u(i) * (u(i) - alfa) * (1 - u(i)) + f; %Cálculo de u'(t,u(t))
        u(i + 1) = u(i) + h * u_prima; %Cálculo de u(t+1)
    end

    hold on
    plot(t, u)

end

xlabel('t'), ylabel('u(t)')
title('Gráfico de u(t) con método de Euler Progresivo')
hold off

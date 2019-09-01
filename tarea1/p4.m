%Pregunta 4

%Par�metros
c1 = 0.175; alfa = 0.1; f = 0; n = 800;
q = (0:5); %Exponentes de h

for k = 1:1
    h = 2^q(k);
    t = (0:h:n);
    uM = zeros(1, length(t)); %Vector para Euler Modificado
    ut = zeros(1, length(t)); %Vector auxiliar de Euler Modificado
    uP = zeros(1, length(t)); %Vector para Euler Progresivo

    for j = 1:n / h
        %C�lculo de u(t) con met. de Euler Modificado
        uM(1) = 2 * alfa;
        u_prima = c1 * uM(j) * (uM(j) - alfa) * (1 - uM(j)) + f;
        ut(1 + j) = uM(j) + h / 2 * u_prima;
        ut_prima = c1 * ut(j + 1) * (ut(j + 1) - alfa) * (1 - ut(j + 1)) + f;
        uM(1 + j) = uM(j) + h * ut_prima;

        %C�lculo de u(t) con met. de Euler Progresivo
        uP(1) = 2 * alfa;
        up_prima = c1 * uP(j) * (uP(j) - alfa) * (1 - uP(j)) + f;
        uP(j + 1) = uP(j) + h * up_prima;
    end

    %Gr�ficos
    %subplot(3,2,k),plot(t,uM,'r')
    plot(t, uP, t, uM)
    xlabel('t'), ylabel('u(t)')
    legend('Euler modificado', 'Euler progresivo')
    hold on
    %subplot(3,2,k),plot(t,uP,'b')
    title('Gr�fico de u(t)(con met. de Euler Progresivo y Modificado)')
end

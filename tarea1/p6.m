%Pregunta 6

%Par�metros
h = 2^-10; c1 = 0.175; alfa = 0.1; f = 0; n = 800; t = (0:h:n);

%Vectores para el c�lculo de u(t)
uM_ref = zeros(1, length(t)); uM_ref(1) = 2 * alfa; ut_ref = zeros(1, length(t));
%C�lculo de U ref con Euler Modificado
for i = 1:n / h
    u_prima = c1 * uM_ref(i) * (uM_ref(i) - alfa) * (1 - uM_ref(i)) + f;
    ut_ref(1 + i) = uM_ref(i) + h / 2 * u_prima;
    ut_prima = c1 * ut_ref(i + 1) * (ut_ref(i + 1) - alfa) * (1 - ut_ref(i + 1)) + f;
    uM_ref(1 + i) = uM_ref(i) + h * ut_prima;
end

%C�lculo de u(t) con h variable
q = (-5:1); %Exponentes de h (con un valor extra)
ErrorGlobal = zeros(1, 6); %Vector con los errores asociados a cada h
VectordeH = zeros(1, 6); %Vector con los valores de h

for k = 1:7
    h2 = 2^q(k); %se define el h
    VectordeH(k) = h2; %se guarda el h en el vector
    uH = zeros(1, (n / h2) + 1); %vector para crear u(t)
    utH = zeros(1, (n / h2) + 1); %vector auxiliar para u(t) ('u tilda')
    error_global = zeros(1, (n / h2) + 1); %vector para guardar errores

    for j = 1:n / h2
        %C�lculo de u(t)
        uH(1) = 2 * alfa;
        uH_prima = c1 * uH(j) * (uH(j) - alfa) * (1 - uH(j)) + f;
        utH(j + 1) = uH(j) + (h2) / 2 * uH_prima;
        utH_prima = c1 * utH(j + 1) * (utH(j + 1) - alfa) * (1 - utH(j + 1)) + f;
        uH(1 + j) = uH(j) + h2 * utH_prima;
        %C�lculo del error
        error_global(1) = abs(uM_ref(1) - uH(1));
        uk = uM_ref((j * (h2 / h)) + 1) - uH(j + 1);
        error_global(j + 1) = abs(uk);
    end

    a = max(max(error_global));
    ErrorGlobal(k) = a;
end

%Loop para eliminar el �ltimo valor de cada vector
for g = 1:6
    E_H(g) = ErrorGlobal(g);
    H_(g) = VectordeH(g);
end

%Gr�fico
plot(H_, E_H)
title('Gr�fico del error global en funci�n de h')
xlabel('h'), ylabel('e(h)')

%C�lculo del orden
P = (1:6);

for w = 1:6
    d = ErrorGlobal(w + 1) / ErrorGlobal(w);
    B = log(d) / log(2);
    P(w) = B;
end

P%mostrar el orden p

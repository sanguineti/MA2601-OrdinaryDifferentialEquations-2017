%Pregunta 3

%Parámetros
h=2^-10; c1=0.175; alfa=0.1; f=0; n=800; t=(0:h:n);
%Cálculo de u referencial
u_ref=zeros(1,length(t));
u_ref0=2*alfa; 
u_ref(1)=u_ref0;
for i=1:n/h
    u_ref_p=c1*u_ref(i)*(u_ref(i)-alfa)*(1-u_ref(i))+f;
    u_ref(i+1)=u_ref(i)+h*u_ref_p;
end
%Cálculo de u con h variable
q=(-5:4); %Exponentes de h (con un valor extra)
ErrorGlobal=zeros(1,9);  %Vector que guardará el error de cada H
VectordeH=zeros(1,9); %Vector que guardará cada H
for k=1:10
    h2=2^q(k); %Se define el H a usar (en función del loop for)
    VectordeH(k)=h2; %Se guarda el H en el vector
    u=zeros(1,(n/h2)+1); %Vector para calcular u(t)
    error_global=zeros(1,(n/h2)+1); %Vector para encontrar el error
        for j=1:n/h2
            %Cálculo de u(t)
            u(1)=2*alfa; 
            u_prima=c1*u(j)*(u(j)-alfa)*(1-u(j))+f;
            u(1+j)=u(j)+h2*u_prima;
            %Cálculo del error
            error_global(1)=abs(u_ref(1)-u(1));
            uk=u_ref(j*(h2/h)+1)-u(j+1);
            error_global(j+1)=abs(uk);
        end
        a=max(max(error_global)); 
        ErrorGlobal(k)=a; %Guarda el error asociado al H en el vector
end
for g=1:9
    E_H(g)=ErrorGlobal(g); %Elimina el último valor del Error (valor 10)
    H_(g)=VectordeH(g); %Elimina el último valor de H (valor 10)
end
%Gráficos
hold on
plot(H_,E_H),ylabel('e(h)'),xlabel('h')
title('Gráfico de e(h) en función de h')
hold off
%Cálculo del orden 
P=(1:9);
for w=1:9
 d=ErrorGlobal(w+1)/ErrorGlobal(w);
 B=log(d)/log(2);
 P(w)=B;
end

%Pregunta 5

%Parámetros
c1=0.175; alfa=0.1; f=0; n=800; 
%Valor de h a variar
hs=[1,5,10,20,21.8,21.9];
for i=1:6
    h=hs(i);
    t=(0:h:n);
    uM=zeros(1,length(t));
    ut=zeros(1,length(t));
    for j=1:n/h
      %Cálculo de u(t) con metodo de Euler Modificado
      uM(1)=2*alfa;
      u_prima=c1*uM(j)*(uM(j)-alfa)*(1-uM(j))+f;
      ut(1+j)=uM(j)+h/2*u_prima;
      ut_prima=c1*ut(j+1)*(ut(j+1)-alfa)*(1-ut(j+1))+f;
      uM(1+j)=uM(j)+h*ut_prima;
    end
    hold on
    subplot(2,3,i),plot(t,uM)
    title('Gráfico de u(t) con método de Euler Modificado')
    xlabel('t'),ylabel('u(t)')
end



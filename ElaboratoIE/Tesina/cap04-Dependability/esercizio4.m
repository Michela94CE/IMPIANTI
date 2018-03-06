%Calcolo della Reliability con R=0.8 e Costo=1000


N=3;
RCPU=0.8;
RTOT=zeros(10,1);
Costo = zeros(10,1);
for j=1:1:10
    for i=0:1:N-3
     RTOT(j)=RTOT(j)+ nchoosek(N,i)*((1-RCPU)^i)*(RCPU^(N-i)); 
     Costo(j) = N * 1000;
    end
    N=N+1;
end
%% Calcolo reliability nel caso in cui si scelgono cpu da 1800�
N=3;
RCPU2=0.9;
RTOT2=zeros(10,1);
Costo2 = zeros(10,1);
for j=1:1:10
    for i=0:1:N-3
     RTOT2(j)=RTOT2(j)+ nchoosek(N,i)*((1-RCPU2)^i)*(RCPU2^(N-i)); 
     Costo2(j) = N * 1800;
    end
    N=N+1;
end


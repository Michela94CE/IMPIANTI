%%Confronto della Reliability del parallelo di una serie e della serie di
%%un parallelo. 

lambda=0.5;
t=linspace(0,10,1000);

R=exp(-lambda*t);

m=5;
s=2;

%Funzione del parallelo di una serie
Rpos=1-(1-(R.^s)).^m;
%Funzione serie di parallelo
Rsop=(1-((1-R).^m)).^s;

% Grafico

plot(t,Rpos,t,Rsop);
xlabel('tempo');
ylabel('Reliability');
legend('Rel POS','Rel SOP');
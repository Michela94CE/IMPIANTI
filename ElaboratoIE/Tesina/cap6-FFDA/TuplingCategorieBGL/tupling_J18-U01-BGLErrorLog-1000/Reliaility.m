% Reliability di Mercury
H=zeros(3,1);
P=zeros(3,1);
K=zeros(3,1);
load interarrivals.txt
%calcolo la cdf empirica dei tempi di fallimento
[p,t]=cdfcalc(interarrivals);
ttf=p(2:size(p,1));
% la reliability è 1-CDF
rel=1-ttf;
plot(t,ttf,'-r',t,rel,'-b');
xlabel('time [s]');
ylabel('p');
legend('Empirical CDF','Empirical Reliability');
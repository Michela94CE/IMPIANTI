% Reliability di BGL
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

% dopo aver fatto cftool e quindi salvato i parametri del modello nel workspace
%ESPONENZIALE
plot(t,esponenziale(t),'--r',t,rel,'-*b','MarkerSize',2.5);
xlabel('time [s]');
ylabel('p');
legend('Modello esponenziale', 'Rel Empirica');
display(goodness);
%test di Kolmogorov-Smirnov
[H(1),P(1),K(1)]=kstest2(rel,esponenziale(t)); %livello di confidenza 95% di default
disp('Valore di H');
disp(H(1));
disp('Valore di P');
disp(P(1));
disp('Valore di K');
disp(K(1));

%WEIBULL4
% dopo aver fatto cftool e quindi salvato i parametri del modello nel workspace
plot(t,weibull(t),'--r',t,rel,'-*b','MarkerSize',2.5);
xlabel('time [s]');
ylabel('p');
legend('Modello Weibull', 'Rel Empirica');
display(goodnessWeibull);
%test di Kolmogorov-Smirnov
[H(2),P(2),K(2)]=kstest2(rel,weibull(t)); %livello di confidenza 95% di default
disp('Valore di H(Weibull)');
disp(H(2));
disp('Valore di P(Weibull)');
disp(P(2));
disp('Valore di K(Weibull)');
disp(K(2));

%iper-esponenziale
% dopo aver fatto cftool e quindi salvato i parametri del modello nel workspace
plot(t,iperesp(t),'--r',t,rel,'-*b','MarkerSize',2.5);
xlabel('time [s]');
ylabel('p');
legend('Modello iperesponenziale', 'Rel Empirica');
display(goodnessiper);
%test di Kolmogorov-Smirnov
[H(3),P(3),K(3)]=kstest2(rel,iperesp(t)); %livello di confidenza 95% di default
disp('Valore di H(Iper)');
disp(H(3));
disp('Valore di P(Iper)');
disp(P(3));
disp('Valore di K(Iper)');
disp(K(3));
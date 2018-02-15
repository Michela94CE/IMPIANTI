% Esercizio 3

lambda=0.005;
t=linspace(0,349,350);

R=exp(-lambda*t);

Rtot=(R.^8)+8*(R.^7).*(1-R)+20*(R.^6).*((1-R).^2)+16*(R.^5).*((1-R).^3)+2*(R.^4).*((1-R).^4);


plot(t,Rtot,t(find(t==48)),Rtot(find(t==48)),'ko');
disp(Rtot(find(t==48)));
xlabel('tempo');
ylabel('Rtot');
legend('Rtot','R-mission');

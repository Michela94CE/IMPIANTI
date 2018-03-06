%Esercizio FFDA
load tupleCount-MercuryErrorLog.txt;
x=tupleCount_MercuryErrorLog(:,1);
y=tupleCount_MercuryErrorLog(:,2);
z=-x+x(9)+y(9);
plot(x,y,'-k*',x,z,'-r');
xlabel('CWIN [s]');
ylabel('tuple count')
axis([0 5000 -6000 6000]);

hold off;

load tupleCount-BGLErrorLog.txt;
x=tupleCount_BGLErrorLog(:,1);
y=tupleCount_BGLErrorLog(:,2);
z=-x+x(7)+y(7);
plot(x,y,'-k*',x,z,'-g');
xlabel('CWIN [s]');
ylabel('tuple count')
axis([0 500 -100 1000]);
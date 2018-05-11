% EE 442 HW 6 No1 
omega0 = pi/2;
z1 = exp(j*omega0);
z2 = conj(z1);
b = poly([z1,z2]);
p1 = 0.7*exp(j*omega0);
p2 = conj(p1);
a = poly([p1,p2]);
o = pi*linspace(0,1,1001);
H0 = freqz(b,a,o);
MagH0 = abs(H0);
PhaH0 = angle(H0);
dbH0 = 20*log10(MagH0/max(MagH0));
dbH0(501) = -40;
figure;
subplot(3,2,1);
plot(o/pi,dbH0);
xlabel('w/pi');
ylabel('db');
title('Magnitude Response, r = 0.7');
xlim([0 1]);
ylim([-40 2]);
set(gca,'Ytick',[-3,0]);
grid;
subplot(3,2,2);
plot(o/pi, PhaH0/pi);
xlim([0 1]);
ylim([-1 1]);
xlabel('w/pi');
ylabel('pi');
title('Phase Response, r = 0.7');
p3 = 0.9*exp(j*omega0);
p4 = conj(p3);
a1 = poly([p3,p4]);
H1 = freqz(b,a1,o);
MagH1 = abs(H1);
PhaH1 = angle(H1);
dbH1 = 20*log10(MagH1/max(MagH1));
dbH1(501) = -40;
subplot(3,2,3);
plot(o/pi,dbH1);
xlabel('w/pi');
ylabel('db');
title('Magnitude Response, r = 0.9');
xlim([0 1]);
ylim([-40 2]);
set(gca,'Ytick',[-3,0]);
grid;
subplot(3,2,4);
plot(o/pi, PhaH1/pi);
xlim([0 1]);
ylim([-1 1]);
xlabel('w/pi');
ylabel('pi');
title('Phase Response, r = 0.9');
p5 = 0.99*exp(j*omega0);
p6 = conj(p5);
a2 = poly([p5,p6]);
H2 = freqz(b,a2,o);
MagH2 = abs(H2);
PhaH2 = angle(H2);
dbH2 = 20*log10(MagH2/max(MagH2));
dbH2(501) = -40;
subplot(3,2,5);
plot(o/pi,dbH2);
xlabel('w/pi');
ylabel('db');
title('Magnitude Response, r = 0.99');
xlim([0 1]);
ylim([-40 2]);
set(gca,'Ytick',[-3,0]);
grid;
subplot(3,2,6);
plot(o/pi, PhaH2/pi);
xlim([0 1]);
ylim([-1 1]);
xlabel('w/pi');
ylabel('pi');
title('Phase Response, r = 0.99');

%part2
%r = 0.7;
val0 = find(dbH0 <-3);
minVal0 = min(val0);
maxVal0 = max(val0);
computed0 = (maxVal0 - minVal0)*(pi/1000)

%r = 0.9;
val1 = find(dbH1 <-3);
minVal1 = min(val1);
maxVal1 = max(val1);
computed1 = (maxVal1 - minVal1)*(pi/1000)

%r = 0.99;
val2 = find(dbH2 <-3);
minVal2 = min(val2);
maxVal2 = max(val2);
computed2 = (maxVal2 - minVal2)*(pi/1000)





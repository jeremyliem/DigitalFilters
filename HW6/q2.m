%Q2
fs = 8000;
omega0 = 2*pi*1000/8000;
omega1 = 2*pi*2000/8000;
omega2 = 2*pi*3000/8000;
z1 = exp(j*omega0);
z2 = conj(z1);
b1 = poly([z1,z2]);
p1 = 0.99*exp(j*omega0);
p2 = conj(p1);
a1 = poly([p1,p2]);
z3 = exp(j*omega1);
z4 = conj(z3);
b2 = poly([z3,z4]);
p3 = 0.99*exp(j*omega1);
p4 = conj(p3);
a2 = poly([p3,p4]);
z5 = exp(j*omega2);
z6 = conj(z5);
b3 = poly([z5,z6]);
p5 = 0.99*exp(j*omega2);
p6 = conj(p5);
a3 = poly([p5,p6]);
b = conv(b1,b2);
b = conv(b,b3);
a = conv(a1,a2);
a = conv(a,a3);

%Part 2

o = pi*linspace(0,1,1001);
H1 = freqz(b,a,o);
MagH1 = abs(H1);
PhaH1 = angle(H1);
dbH1 = 20*log10(MagH1/max(MagH1));
figure;
subplot(2,1,1);
plot(o/pi,dbH1);
xlabel('w/pi');
ylabel('db');
title('Magnitude Response');
xlim([0 1]);
ylim([-40 2]);
set(gca,'Ytick',[-3,0]);
grid;
subplot(2,1,2);
plot(o/pi, PhaH1/pi);
xlim([0 1]);
ylim([-1 1]);
xlabel('w/pi');
ylabel('pi');
title('Phase Response');
%%
%Part 3
load handel;
x = y';
nx = length(x);
n = 0:nx-1;
omega0 = 2*pi*1000/8000;
omega1 = 2*pi*2000/8000;
omega2 = 2*pi*3000/8000;
I0 = cos(omega0*n);
I1 = cos(omega1*n);
I2 = cos(omega2*n);
newX = x + I0 + I1 + I2;
sound(newX,Fs);
pause(5);
filtered = filter(b,a,newX);
sound(filtered, Fs);

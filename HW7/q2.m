%8.31
Fsa = 8000;
Fp = 3200;
Rp = 0.5;
Fs = 3800;
As = 45;
wp = 2*pi*Fp/Fsa;
ws = 2*pi*Fs/Fsa;
T = 2;
omP = (2/T)*tan(wp/2);
omS = (2/T)*tan(ws/2);
[cs, ds] = afd_chb1(omP,omS,Rp,As);
[b,a] = bilinear(cs,ds,1/T);
[db,mag,pha,grd,w] = freqz_m(b,a);
N =25;
t = 0:T/10:T*N;
[ha,x,t] = impulse(cs,ds,t);
[x,n] = impseq(0,0,N);
h = filter(b,a,x);


figure;
subplot(1,2,1);
plot(w/pi,db);
title('Log-Magnitude Response');
xlabel('Freq(Hz)');
ylabel('db');

subplot(1,2,2);
plot(t,ha);
title('Impulse Response');
xlabel('time');
ylabel('h(t)');
hold on;
stem(n*T,h);



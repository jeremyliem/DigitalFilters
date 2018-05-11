Wp = 2*pi*10000; Ws = 2*pi*20000; Rp = 0.5; As = 9;
% Analog filter design:
[b,a] = afd_butt(Wp,Ws,Rp,As);
%*** Butterworth Filter Order = 9
% Calculation of second-order sections:
[C,B,A] = sdir2cas(b,a)
% Calculation of Frequency Response:
[db,mag,pha,w] = freqs_m(b,a,2*pi*30000);
pha = unwrap(pha);
% Calculation of Impulse response:
[ha,x,t] = impulse(b,a);

figure;
subplot(4,1,1);
plot(w/(2000*pi),mag);
title('Magnitude Response');
xlabel('Freq');
ylabel('Magnitude');
subplot(4,1,2);
plot(w/(2000*pi),db);
title('Log-Magnitude Response');
xlabel('Freq');
ylabel('Decibels');
subplot(4,1,3);
plot(w/(2000*pi),pha/pi);
xlabel('Freq');
ylabel('Angle');
title('Phase Response');
subplot(4,1,4);
plot(t,ha);
title('Impulse Response');
xlabel('t');
ylabel('h(t)');

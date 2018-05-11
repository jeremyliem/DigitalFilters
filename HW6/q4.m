%EE 442

Wp = 10; Ws = 15; Rp = 1; As = 50;
 % Analog filter design:
[b,a] = afd_chb1(Wp,Ws,Rp,As);
 % Calculation of second-order sections:
[C,B,A] = sdir2cas(b,a)
a0 = a(1);
b=b/a0;
a=a/a0;
% Calculation of Frequency Response:
[db,mag,pha,w] = freqs_m(b,a,30);
pha = unwrap(pha);
 % Calculation of Impulse response:
 [ha,x,t] = impulse(b,a);
 
 figure;
subplot(4,1,1);
plot(w,mag);
title('Magnitude Response');
xlabel('Freq');
ylabel('Magnitude');
subplot(4,1,2);
plot(w,db);
title('Log-Magnitude Response');
xlabel('Freq');
ylabel('Decibels');
subplot(4,1,3);
plot(w,pha/pi);
xlabel('Freq');
ylabel('Angle');
title('Phase Response');
subplot(4,1,4);
plot(t,ha);
title('Impulse Response');
xlabel('t');
ylabel('h(t)');

 
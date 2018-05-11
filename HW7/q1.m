
%% Number 8.21(1);
Fsa = 8000;
Fp = 3200;
Rp = 0.5;
Fs = 3800;
As = 45;
wp = 2*pi*Fp/Fsa;
ws = 2*pi*Fs/Fsa;
T = 1;
omP = wp/T;
omS = ws/T;
[cs, ds] = afd_chb1(omP,omS,Rp,As);
[b,a] = imp_invr(cs,ds,T);
[C,B,A] = dir2par(b,a);
[db,mag,pha,grd,w] = freqz_m(b,a);
[h,n] = impz(b,a,51);

figure;
subplot(1,2,1);
plot(w/(2*pi)*Fsa/1000,db);
title('Log-Magnitude Response');
xlabel('Frequency(kHz)');
ylabel('Decibels');

subplot(1,2,2);
stem(n,h);
title('Impulse Response');
xlabel('n');
ylabel('Amp');
%% Number 8.21(2)
Fsa = 8000;
Fp = 3200;
Rp = 0.5;
Fs = 3800;
As = 45;
wp = 2*pi*Fp/Fsa;
ws = 2*pi*Fs/Fsa;
T = 1/8000;
omP = wp/T;
omS = ws/T;
[cs, ds] = afd_chb1(omP,omS,Rp,As);
[b,a] = imp_invr(cs,ds,T);
[C,B,A] = dir2par(b,a);
[db,mag,pha,grd,w] = freqz_m(b,a);
[h,n] = impz(b,a,51);

figure;
subplot(1,2,1);
plot(w/(2*pi)*Fsa/1000,db);
title('Log-Magnitude Response');
xlabel('Frequency(kHz)');
ylabel('Decibels');

subplot(1,2,2);
stem(n,h);
title('Impulse Response');
xlabel('n');
ylabel('Amp');
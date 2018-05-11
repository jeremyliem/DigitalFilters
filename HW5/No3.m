%Hamming Window
wp = 0.48*pi;
ws = 0.54*pi;
wd = ws-wp;
M = ceil(6.6*pi/wd) +1;
wc = (ws+wp)/2;
hd = ideal_lp(wc,M);
w_ham = (hamming(M)');
h = hd.*w_ham;
[db, mag,pha,grd,w] = freqz_m(h,1);
figure;
subplot(2,1,1);
plot(w/pi,db);
xlabel('w/pi');
ylabel('db');
title('Low Pass Response using Hamming Window');
axis([0,1,-120,20]);

%Frequency Sampling
M = 81;
alpha = (M-1)/2;
l = 0:M-1; 
wl = (2*pi/M)*l;
T1 =0.107;
T2 = 0.58895;
Hrs = [ones(1,20) T2 T1 zeros(1,38) T1 T2 ones(1,19)];
Hdr = [1,1,0,0];
wdl = [0,0.48,0.54,1];
k1 = 0:floor((M-1)/2); k2 = floor((M-1)/2)+1:M-1;
angH = [-alpha*(2*pi)/M*k1, alpha*(2*pi)/M*(M-k2)];
H = Hrs.*exp(j*angH); h = real(ifft(H,M));
[db,mag,pha,grd,w] = freqz_m(h,1);
subplot(2,1,2);
plot(w/pi,db);
xlabel('w/pi');
ylabel('db');
title('Low Pass Response using Frequency Sampling');
%axis([0,1,-120,20]);
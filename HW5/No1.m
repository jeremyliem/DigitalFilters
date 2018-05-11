
ws1 = 0.3*pi;
wp1 = 0.4*pi;
ws2 = 0.7*pi;
wp2 = 0.6*pi;
Rp = 0.5;
As = 40;
M = 40;
alpha = (M-1)/2;
T1 = 0.405;
l = 0:M-1;
w1 = (2*pi/M)*l;
Hrs = [zeros(1,7),T1,ones(1,5),T1,zeros(1,13),T1,ones(1,5),T1,zeros(1,6)];
Hdr = [0,0,1,1,0,0];
wd1 = [0, 0.3,0.4,0.6,0.7,1];
k1 = 0:floor((M-1)/2);
k2 = floor((M-1)/2)+1 : M-1;
angH = [-alpha*(2*pi)/M*k1, alpha*(2*pi)/M*(M-k2)];
H = Hrs.*exp(j*angH);
h = real(ifft(H,M));
[db, mag,pha,grd,w] = freqz_m(h,1);
n = 0:M-1;
deltaW = pi/500;

Asd = floor(-max(db(ceil(ws2/deltaW)+2:end))) 

figure;
subplot(2,1,1);
stem(n,h);
xlabel('n');
ylabel('Amplitude');
title('Impulse Response');
subplot(2,1,2);
plot(w/pi,db);
axis([0,1 ,-80,10]);
xlabel('w/pi');
ylabel('dB');
title('Log-Magnitude Response');


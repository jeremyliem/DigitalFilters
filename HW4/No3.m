%Ingle & Proakis 7.13

wp1 = 0.25*pi;
wp2 = 0.75*pi;
ws1 = 0.35*pi;
ws2 = 0.65*pi;

delta1 = 0.025;
delta2 = 0.005;
trWidth = abs(min((wp1-ws1),(ws2-wp2)))/(2*pi);
wc1 = (wp1+ws1)/2; wc2 = (wp2+ws2)/2;
[Rp, As] = delta2db(delta1,delta2);
M = ceil((As-7.95)/(14.36*trWidth)+1)+1;
M = 2*floor(M/2) +1;
n = 0:1:M-1;
beta = 0.1102*(As - 8.7);
wKaiser = (kaiser(M, beta))';
hd = ideal_lp(pi,M) + ideal_lp(wc1,M) - ideal_lp(wc2, M);
h = hd.* wKaiser;
[db, mag, pha, grd ,w] = freqz_m(h, 1);
deltaW = pi/500;
[Hr,w,c,L] = Ampl_res(h);
figure;
subplot(2,3,1);
stem(n,hd);
xlabel('n');
ylabel('h_d (n)');
title('Ideal Impulse Response');
subplot(2,3,2);
stem(n,h);
xlabel('n');
ylabel('h(n)');
title('Actual Impulse Response');
subplot(2,3,3);
stem(n,wKaiser);
xlabel('n');
ylabel('WKaiser window');
title('Kaiser Window');
subplot(2,3,4);
plot(w/pi,db);
xlabel('w/pi');
ylabel('db');
title('Magnitude Response');
subplot(2,3,5);
plot(w/pi,Hr/pi);
xlabel('w/pi');
ylabel('Amplitude');
title('Amplitude Response');








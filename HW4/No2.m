%Ingle & proakis 7.9

wp1 = 0.35*pi;
wp2 = 0.55*pi;
ws1 = 0.2*pi;
ws2 = 0.75*pi;


trWidth = min((wp1 - ws1),(ws2-wp2));
M = ceil(6.2*pi/ trWidth) + 1;
wc1 = (wp1+ws1)/2;
wc2 = (wp2+ws2)/2;
n = 0:M-1;
hd = ideal_lp(wc2,M) - ideal_lp(wc1,M);
w_hann = (hann(M))';
h = hd .* w_hann;
[db,mag,pha,grd,w] = freqz_m(h,1);
deltaW = pi/500;

%Check properties
Rp = -min(db(wp1/deltaW + 1:wp2/deltaW)); 
As = -round(max(db(ws2/deltaW+1:1:501)));
figure;
subplot(2,2,1);
stem(n,hd);
xlabel('n');
ylabel('h_d (n)');
title('Ideal Impulse Response');
subplot(2,2,2);
stem(n,h);
xlabel('n');
ylabel('h(n)');
title('Actual Impulse Response');
subplot(2,2,3);
stem(n,w_hann);
xlabel('n');
ylabel('W_han window');
title('Hann Window');
subplot(2,2,4);
plot(w/pi,db);
xlabel('w/pi');
ylabel('db');
title('Magnitude Response');

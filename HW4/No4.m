% Ingle and Proakis

wp = 0.4*pi;
ws = 0.6*pi;
trWidth = ws-wp;
M = ceil(11*pi/trWidth) + 1;
n = 0:1:M-1;
wc = (ws+wp)/2;
hd = ideal_lp(wc,M);
w_window = blackman(length(hd))';
h = hd .*w_window;
h = h/sum(h);
[db,mag,pha,grd,w] = freqz_m(h,1);
deltaW = pi/500;


% Plot
subplot(2,1,1);
stem(n,h);
xlabel('n');
ylabel('h(n)');
title('Impulse Response');
subplot(2,1,2);
plot(w/pi, db);
xlabel('w/pi');
ylabel('dB');
title('Magnitude Response');
axis([0 1 -100 10])

%No4
Rp = -min(db(1:1:wp/deltaW+1)); 
As = -round(max(db(ws/deltaW+1:1:501)));


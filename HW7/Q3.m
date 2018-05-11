w1p = 0.2*pi;
w1s = 0.3*pi;
w2s = 0.7*pi;
w2p = 0.8*pi;
T=1;
W1p = (2/T)*tan(w1p/2);
W1s = (2/T)*tan(w1s/2);
W2s = (2/T)*tan(w2s/2);
W2p = (2/T)*tan(w2p/2);

w0 = (W1s + W2s)/2;
bw = W2p - W1p; 
Rp = 1; As = 50;
[N, Wc] = cheb1ord([0.2 0.8], [0.3 0.7], Rp, As, 's');
[Z, P, K] = cheb1ap(N, Rp);
[num,den] = zp2tf(Z,P,K);
[numt, dent] = lp2bs(num, den, w0, bw);

[nt, dt] = bilinear(numt, dent, 1);
[db,mag,pha,grd,w] = freqz_m(nt,dt);

figure;
subplot(3,1,1); plot(w, mag);
title('Magnitude Response');
xlabel('frequency (pi)'); ylabel('Magnitude');
subplot(3,1,2); plot(pha); 
title('Phase Response');
xlabel('w'); ylabel('Rad')
subplot(3,1,3); plot(db);
title('Log Magnitude Response'); xlabel('freq');
ylabel('dB');

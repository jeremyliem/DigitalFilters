%% EE 442 Homework 2 2018

% Ingle & Proakis 

n1 = -10 : 10;
x1 = 0.6.^abs(n1);
N1 = length(n1);
N = 300;
x1 = [x1,zeros(1,N-N1)];
X1 = fft(x1, N);
w = (0:N/2)*2*pi/N;
magx1 = abs(X1(1:N/2+1));
phax1 = angle(X1(1:N/2+1))*180/pi;
figure; 
subplot(2,1,1);
plot(w/pi,magx1);
title('Magnitude of DTFT of X_1(e^{jw})');
xlabel('w');
ylabel('Magnitude');
subplot(2,1,2);
plot(w/pi, phax1);
title('Phase of DTFT of X_1(e^{jw})');
xlabel('w/pi');
ylabel('Degrees');

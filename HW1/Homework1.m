%%
% Problem 2.9 Proakis Ingle
% part rxx
close all;
clear;
nX = 0:20;
x = 0.9.^nX;
[soln,axis] = conv_m(x, nX , fliplr(x), nX);
figure;
stem(-20:20,soln);
xlabel('n');
ylabel('r_x_x(n)');
title('autocorrelation r_x_x(n)');

% part rxy

nY = -20:0;
y = 0.8.^(-nY);
[soln2, axis2] = conv_m(x, nX, fliplr(y), nY);
figure(2);
stem(0:40, soln2);
xlabel('n');
ylabel('r_x_y(n)');
title('autocorrelation r_x_y(n)');

%%
close all;
clear;
% Problem 3.11 Proakis Ingle
w = (-200:200) * pi/200;
H = 0.19 * ones(size(w)) ./ (1.81 - 1.8 * cos(w));
mag = abs(H);
pha = angle(H);
figure;
subplot(2,1,1);
plot(w/pi, mag);
xlabel('w/pi');
ylabel('|H(e^j^w)|');
title('Magnitude response of h(n)');
subplot(2,1,2);
plot(w/pi, pha);
xlabel('w/pi');
ylabel('Degrees');
title('Phase response of h(n)');
%%
close all;
clear;
%Problem 4.3 Proakis Ingle
b = [0 0 2 1];
a = [1 -1];
figure;
zplane(b,a);
title('Z-Plane for problem 4.3');

%%
close all;
clear;
% Problem 4.11 Proakis Ingle
b = [1 1];
a = [1 -0.5];
figure;
zplane(b,a);
title('Z-Plane for problem 4.11');

%%
close all;
clear;
% Problem No 5 HW 1 EE 442
L = 50;
n = 1:L; 
x = ones(1,L);
k = -100:100;
w = (pi/100)*k; 
X = x * (exp(-1i*pi/100)).^(n'*k);
y = exp(1i*pi*n/3).*x;
Y = y * (exp(-1i*pi/100)).^(n'*k);
z = exp(1i*11*pi*n/4).*x;
Z = z * (exp(-1i*pi/100)).^(n'*k);

figure;
subplot(3,1,1);
plot(w/pi, abs(X));
grid;
title('DTFT of Unshifted Frequency Response');
xlabel('Frequency in pi radians');
ylabel('Magnitude');
subplot(3,1,2);
plot(w/pi, abs(Y));
grid;
title('DTFT of Shifted Response by (\pi/3) ');
xlabel('Frequency in pi radians');
ylabel('Magnitude');
subplot(3,1,3);
plot(w/pi, abs(Z));
grid;
title('DTFT of Shifted Response by (11\pi/4) ');
xlabel('Frequency in pi radians');
ylabel('Magnitude');




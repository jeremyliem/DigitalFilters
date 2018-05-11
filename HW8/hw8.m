clear all; close all; clc
n = 1024;
x = rand(1,n)*4 - 2;
A = [1 -0.3 0.1];
B = [1 4 -1]; 
d = filter(B,A,x);
Nd = length(d);
N1 = 32;
delta = 0.01;
h = randn(1,N1);
for i = N1:n
y_vector = filter(h,1,x(i-N1+1:i));
y(i) = y_vector(end);
e(i) = d(i)-y(i);
h = h+(e(i)*delta*x(i:-1:i-N1+1));
end
a = freqz(B,A);
figure;
subplot(3,2,1);
plot(abs(a));
title('Unknown Filter');
xlabel('Freq');
ylabel('Magnitude(dB)');
subplot(3,2,2);a
plot(angle(a));
title('Unknown Filter');
xlabel('Freq');
ylabel('Phase');

b = freqz(h,1);
subplot(3,2,3);
plot(abs(b));
title('Adaptive Filter');
xlabel('Freq');
ylabel('Magnitude(dB)');
subplot(3,2,4);
plot(angle(b));
title('Adaptive Filter');
xlabel('Freq');
ylabel('Phase');
subplot(3,2,[5,6]);
plot(e);
title('error function');
xlabel('n');
ylabel('e(n)');

delta1 = 0.05;
delta2 = 0.05;
delta3 = 0.025;
weights = [delta3/delta2,delta3/delta2,1];
f = [0, 0.4,0.5,0.7,0.8,1];
m = [0.4,0.4,0.95,0.95,0.025,0.025];
deltaF = 0.05;
As = -20*log10(0.05);
M = ceil((-20*log10(sqrt(delta2*delta3))-13)/(14.6*deltaF) + 1);
deltaW = pi/500;
%h = firpm(M-1,f,m,weights); 
%[db, mag,pha,grd,w] = freqz_m(h,1);
%Asd = floor(-max(db((0.8*pi/deltaW)+1:501)));

%decrease M

%M = M-2;
%h = firpm(M-1,f,m,weights); 
%[db, mag,pha,grd,w1] = freqz_m(h,1);
%Asd = floor(-max(db((0.8*pi/deltaW)+1:501)));

%Increase M
%M = M+4;
%h = firpm(M-1,f,m,weights); 
%[db, mag,pha,grd,w1] = freqz_m(h,1);
%Asd = floor(-max(db((0.8*pi/deltaW)+1:501)));

M = M+4;
h = firpm(M-1,f,m,weights); 
[db, mag,pha,grd,w1] = freqz_m(h,1);
Asd = floor(-max(db((0.8*pi/deltaW)+1:501)));
n = 0:M-1;
%get Desired Value
%From impulse response, we see it is type 1 response.
[Hr,w,c,L] = Ampl_res(h);

figure;
subplot(2,1,1);
stem(n,h);
xlabel('n');
ylabel('Amplitude');
title('Impulse Response');
subplot(2,1,2);
plot(w/pi,Hr);
xlabel('w/pi');
ylabel('Hr(w)');
title('Amplitude Response');
set(gca,'XTick',f,'YTick',[0, 0.05,0.35,0.45,0.9,1]);
grid;
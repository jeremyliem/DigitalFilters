%%
%Ingle & proakis 7.1 (2)
function[delta1 , delta2] = db2delta(Rp,As)
%converts dB specs Rp and As into absolute specs delta1 and delta2
%[delta1, delta2] = db2delta(Rp,As)
A = 10^(Rp/20);
delta1 = (A-1) / (A+1);
delta2 = (1+delta1)*(10^(-As/20));
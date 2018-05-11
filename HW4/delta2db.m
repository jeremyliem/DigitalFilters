%% HW 4 EE 442
%%
%Ingvle & proakis 7.1 (1)
function[Rp,As] = delta2db(delta1, delta2)
%convert absolute specs delta1 and delta2 into dB specs Rp and As
%[Rp,As] = delta2db(delta1, delta2)
Rp = -20*log10((1-delta1)/(1+delta1));
As = -20*log10((delta2)/(1+delta1));




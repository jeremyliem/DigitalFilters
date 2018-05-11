function [Hr,w,a,L] = ampl_res(h);
%
% function [Hr,w,P,L] = Ampl_Res(h)
% Computes Amplitude response Hr(w) and its polynomial P of order L,
% given a linear-phase FIR filter impulse response h.
% The type of filter is determined automatically by the subroutine.
% Hr = Amplitude Response
% w = 500 frequencies between [0 pi] over which Hr is computed
% P = Type-1 LP filter coefficients
% L = Order of P
% h = Linear Phase filter impulse response
%
M = length(h);
L = rem(M,2);
if L==1
    if h(M)==h(1)
    [Hr,w,a,L] = Hr_Type1(h);
    else
    [Hr,w,a,L] = Hr_Type3(h);
    end
else
    if h(M) == h(1)
    [Hr,w,a,L] = Hr_Type2(h);
    else
    [Hr,w,a,L] = Hr_Type4(h);
    end
end
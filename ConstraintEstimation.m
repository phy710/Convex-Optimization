clear;
clc;
close all;
rand('seed', 0);
v = rand(10, 1)-0.5;
Rv = cov(v);
H = rand(10, 1)-0.5;
K0 = (H'/Rv*H)\H'/Rv;
cvx_begin
    variable K(1, 10)
    minimize (K*Rv*K')
    subject to
        K*H == 1;
cvx_end
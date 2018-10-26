clear;
clc;
close all;
rand('seed', 0);
H = rand(15, 10)-0.5;
while rank(H)<10
    H = rand(15, 10)-0.5;
end
y = rand(15, 1);
w0 = H\y;
cvx_begin
    variable w(10)
    minimize (norm(w))
    subject to
        H'*H*w == H'*y;
cvx_end
format long
A = [11 -3 -2
    -1 5 -3
    -2 -12 19];
b = [3;6;-7];
x0 = zeros(3,1);
ep = 1e-5;
N = 50;
for i = 1:12
    omega = 0.1*i+0.5;
    x = xcy04(A,b,omega,x0,ep,N)
end
function [x,l,u] = malu(A,b)
%用途:用LU分解法解方程组Ax = b
%格式:[x,l,u]=manu(a,b) A为系数矩阵，b为右端向量，
%x为返回解向量，l返回下三角矩阵，u返回上三角矩阵
n = length(b);
u = zeros(n,n);
l = eye(n,n);u(1,:) = A(1,:);
l(2:n,1) = A(2:n,1)/u(1,1);
for k = 2:n
    u(k,k:n) = A(k,k:n)-l(k,1:k-1)*u(1:k-1,k:n);
    l(k+1:n,k) = (A(k+1:n,k)-l(k+1:n,1:k-1)*u(1:k-1,k))/u(k,k);
end
%解下三角方程组Ly = b
y = zeros(n,1);
y(1) = b(1);
for k = 2:n
    y(k) = b(k)-l(k,1:k-1)*y(1:k-1);
end
%解上三角方程组Ux = y
x = zeros(n,1);
x(n) = y(n)/u(n,n);
for k = n-1:-1:1
    x(k) = (y(k)-u(k,k+1:n)*x(k+1:n))/u(k,k);
end

end


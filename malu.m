function [x,l,u] = malu(A,b)
%��;:��LU�ֽⷨ�ⷽ����Ax = b
%��ʽ:[x,l,u]=manu(a,b) AΪϵ������bΪ�Ҷ�������
%xΪ���ؽ�������l���������Ǿ���u���������Ǿ���
n = length(b);
u = zeros(n,n);
l = eye(n,n);u(1,:) = A(1,:);
l(2:n,1) = A(2:n,1)/u(1,1);
for k = 2:n
    u(k,k:n) = A(k,k:n)-l(k,1:k-1)*u(1:k-1,k:n);
    l(k+1:n,k) = (A(k+1:n,k)-l(k+1:n,1:k-1)*u(1:k-1,k))/u(k,k);
end
%�������Ƿ�����Ly = b
y = zeros(n,1);
y(1) = b(1);
for k = 2:n
    y(k) = b(k)-l(k,1:k-1)*y(1:k-1);
end
%�������Ƿ�����Ux = y
x = zeros(n,1);
x(n) = y(n)/u(n,n);
for k = n-1:-1:1
    x(k) = (y(k)-u(k,k+1:n)*x(k+1:n))/u(k,k);
end

end


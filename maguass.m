%Ë³ĞòGuassÏûÈ¥·¨
function x = maguass( A,b,flag)
if nargin<3
    flag=0;
end
n = length(b);
for k = 1:(n-1)
    m = A(k+1:n,k)/A(k,k);
    A(k+1:n,k+1:n) = A(k+1:n,k+1:n)-m*A(k,k+1:n);
    b(k+1:n) = b(k+1:n)-m*b(k);
    A(k+1:n,k) = zeros(n-k,1);
end
if flag ~= 0
    Ab = [A,b];
end
x = zeros(n,1);
x(n) = b(n)/A(n,n);
for k = n-1:-1:1
    x(k) = (b(k)-A(k,k+1:n)*x(k+1:n))/A(k,k);
end
end


%列主元Guass消去法
function x = maguass2( A,b,flag )
if nargin<3
    flag = 0;
end
n = length(b);
for k = 1:(n-1)
    [ap,p] = max(abs(A(k:n,k)));
    p = p+k-1;
    if p>k
        t = A(k,:);A(k,:) = A(p,:);A(p,:) = t;
        t = b(k);b(k) = b(p);b(p) = t;
    end
    m = A(k+1:n,k)/A(k,k);
    A(k+1:n,k+1:n) = A(k+1:n,k+1:n)-m*A(k,k+1:n);
    b(k+1:n) = b(k+1:n)-m*b(k);
    A(k+1:n,k) = zeros(n-k,1);
    if flag ~= 0
        Ab = [A,b];
    end
end
x = zeros(n,1);
x(n) = b(n)/A(n,n);
for k = n-1:-1:1
    x(k) = (b(k)-A(k,k+1:n)*x(k+1:n))/A(k,k);
end
end


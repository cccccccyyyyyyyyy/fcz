format short
A = [];
for i = 1:100
    for j = 1:100
        if j == i-2 || j==i+2
            A(i,j) = -1/5;
        else if j == i-1||j==i+1
                A(i,j) = -1/3;
        else if j == i
                A(i,j) = 64;
            end
            end
        end
    end
end
b = [];
for i = 1:100
    b(i) = 1;
end
x0 = zeros(100,1);
ep = 1e-5;
N = 50;
input('64雅可比迭代结果：')
x = xcy02(A,b,x0,ep,N)

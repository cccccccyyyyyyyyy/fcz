format long
A = [];
%(1)n = 20,x0 = zeros(20,1),b = (1,2,3,...,18,19,20)
%(2)n = 20,x0 = ones(20,1),b = (1,1,1,...,1,1,1)
%(3)n = 100,x0 = ones(20,1),b = (1,2,3,...,18,19,20)
%(4)n = 100,x0 = zeros(20,1),b = (1,1,1,...,1,1,1)
%(1),(2)for i = 1:20
%(3),(4)for i = 1:100
for i = 1:100
    %(1),(2)for j = 1:20
    %(3),(4)for j = 1:100
    for j = 1:100
        if j == i-2 || j==i+2
            A(i,j) = -1/5;
        else if j == i-1||j==i+1
                A(i,j) = -1/3;
        else if j == i
                A(i,j) = 4;
            end
            end
        end
    end
end
b = [];
%(1),(2)for i = 1:20
%(3),(4)for i = 1:100
for i = 1:100
    b(i) = 1;
end
%(1),x0 = zeros(20,1)
%(2),x0 = ones(20,1)
%(3),x0 = ones(100,1)
%(4),x0 =  zeros(100,1)
x0 = zeros(100,1);
ep = 1e-5;
N = 50;
input('雅可比迭代结果：')
x = xcy02(A,b,x0,ep,N)
input('高斯赛德迭代结果：')
x = xcy03(A,b,x0,ep,N)
input('sor迭代结果：')
omega = 1.5;
x = xcy04(A,b,omega,x0,ep,N)
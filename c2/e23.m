%% 数据输入
format long
x = 0:0.4:2;
y = x.^7 - 1.2.*x.^5 + 2.3.*x.^4 + 2.3.*x.^3 - 5.6.*x + 1.9;

n = length(x);
f = zeros(n, n + 1);%差商表


%% 插值
x0 = 0:0.1:2;

%% 插值计算
%差商表

f(1:n, 1) = x;
f(1:n, 2) = y;
for j = 3 : n + 1
    for i = j - 1 : n
    f(i, j) = (f(i, j-1) - f(i-1, j-1))/(f(i, 1) - f(i-j+2, 1));
    end
end
%f
for k = 1:21
%插值多项式
res(k) = y(1);
for i = 2:n
    t = 1;
    for j = 1:i-1
    t=t*(x0(k)-x(j));
    end
    res(k) = res(k) + f(i,i+1) *  t;
end
%res

end
plot(x0,res, '.');

fx=polyval(res,x)
hold on
x = 0:0.1:2;
y = x.^7 - 1.2.*x.^5 + 2.3.*x.^4 + 2.3.*x.^3 - 5.6.*x + 1.9;
plot(x,y);

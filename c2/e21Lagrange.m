%% 数据输入
format long
x = [0.4 0.5 0.6 0.7 0.8];
y = [-0.916291 -0.693147 -0.510826 -0.356675 -0.223144];
n = length(x);

%% 插值
x0 = 0.65;

%% 插值计算
res = 0;
for i=1:n
    l = 1;
    for j = 1:n %计算lj
        if j ~= i
            l = l*(x0-x(j))/(x(i)-x(j));
        end
    end
    res = res + l*y(i);
end
res

%% 误差计算
%ln(x)的n阶导除以n的阶乘再乘(x0-x(i))连乘

%4阶误差估计
r1 = 1 / (5 * 0.4^5);%为了取最大可能误差，ξ取0.4
r2 = 1;
for i = 1:n
    r2 =r2 * abs(x0 - x(i));
end
R = r1*r2;
R %最大可能误差

%% 图形化输出
plot(x,y);
hold on
plot(x0,res, '*');
%% 数据输入
format long
x = [1,31,61];
yc = [5*60+51, 5*60+17 5*60+10];%分钟
yl = [19*60+4, 19*60+38 19*60+50];
y = yl-yc;
n = length(x);

%% 插值
x0 = 1:1:61;

%% 插值计算
for k = 1:1:61
res(k) = 0;
for i=1:n
    l = 1;
    for j = 1:n %计算lj
        if j ~= i
            l = l*(x0(k)-x(j))/(x(i)-x(j));
        end
    end
    res(k) = res(k) + l*y(i);
end
end


%% 图形化输出
plot(x,y,'x');
hold on
plot(x0,res);
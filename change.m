%% change函数 
function [x,g] = change(x,g,ps,pd,pb,T)
%% ps 潜伏对易感的感染率  pd 抵抗概率 pb 对易感者的概率

[a,b] = size(x);
p = zeros(a); %概率矩阵  p矩阵是指，p处传染邻居的概率
p1 = zeros(a); %概率转移矩阵
p(x == 0 | x == 3) = 0;
p(x == 1) = ps;
p(x == 2) = pb;

for i = 1:a  % 把p和p1遍历一遍
    for j = 1:a
        if i == 1 & j == 1
            p1(i,j) = p(i+1,j) + p(i,j+1);
        elseif i == 1 & j == a
            p1(i,j) = p(i+1,j) + p(i,j-1);
        elseif i == a & j == 1
            p1(i,j) = p(i-1,j) + p(i,j+1);
        elseif i == a & j == a
            p1(i,j) = p(i-1,j) + p(i,j-1);
        elseif j == 1 % 第一列
            p1(i,j) = p(i+1,j) + p(i-1,j) + p(i,j+1);
        elseif j == a % 最后一列
            p1(i,j) = p(i-1,j) + p(i+1,j) + p(i,j-1);
        elseif i == 1 % 第一行
            p1(i,j) = p(i,j-1) + p(i+1,j) + p(i,j+1);
        elseif i == a % 最后一行
            p1(i,j) = p(i-1,j) + p(i,j-1) + p(i,j+1);  
        else
            p1(i,j) = p(i-1,j) + p(i+1,j) + p(i,j-1) + p(i,j+1);
        end
    end
end
%% 以上，得到p1概率转移矩阵
%% 接下来再把x矩阵遍历一遍
for i = 1:a
    for j = 1:b
        if x(i,j) == 0   %如果处于易感者状态，检查状态转移矩阵对应位置的概率，比pd大，就发生
            if p1(i,j) > pd 
                x(i,j) = 1;
            end
        elseif x(i,j) == 1  % 如果处于潜伏状态，先看对应潜伏时间矩阵，大于12，令pe等于1
            if g(i,j)>12   %此处采用蒙特卡洛方法模拟随机性
                pe = 1;
            else 
                pe = exp(-1*(12-g(i,j))/12);
            end
            temp = rand(1);
            if temp > 1 - pe  %比1-pe大，就编程发病者
                x(i,j) = 2;
            else 
                g(i,j) = g(i,j) + 1;
            end
        elseif x(i,j) == 2
            if g(i,j) < T 
                g(i,j) = g(i,j) + 1;
            else
                x(i,j) = 3;
                g(i,j) = 0;
            end
        end
    end
end

            
        
            


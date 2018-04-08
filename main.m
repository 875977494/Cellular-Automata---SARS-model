%% 元胞自动机 SARS模型 by 张逸群 2018.4

a = 50;  %元胞自动机的边长 100*100
n = 0.1;
iterations = 365;  %迭代次数
[x,g] = create_x(a);
pd = 0.5;  %抵抗概率
ps = 0.05; %潜伏期对易感者的传染概率
pb = 0.7;  %对易感者的概率
T = 100;  % 从发病期进入免疫期的最长步长
[h,temp1,temp2,temp3] = show_x(NaN,x,g,n);

% x = change(x,g,ps,pd,pb)
for i = 1:iterations
    [x,g] = change(x,g,ps,pd,pb,T);
    [h,temp1,temp2,temp3] = show_x(NaN,x,g,n);
end
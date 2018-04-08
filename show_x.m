function [h,temp1,temp2,temp3] = show_x(h,x,g,n)  %h是句柄，temp123是储存rgb的矩阵
%% 状态1 易感 0 白色 1 1 1
%% 状态2 潜伏 1 黄色 1 1 0
%% 状态3 发病 2 红色 1 0 0
%% 状态4 免疫 3 蓝色 0 0 1
[L,W] = size(x);
temp3 = x;
temp2 = temp3;
temp1 = temp3;

%% 给易感人群上色 白色
temp1(x == 0) = 1;
temp2(x == 0) = 1;
temp3(x == 0) = 1;

%% 给潜伏人群上色 黄色
temp1(x == 1) = 1;
temp2(x == 1) = 1;
temp3(x == 1) = 0;

%% 给发病人群上色 红色
temp1(x == 2) = 1;
temp2(x == 2) = 0;
temp3(x == 2) = 0;

%% 给免疫人群上色 蓝色
temp1(x == 3) = 0;
temp2(x == 3) = 0;
temp3(x == 3) = 1;

%% 合并三个矩阵
check = cat(3,temp1,temp2,temp3);

%% 绘图
if ishandle(h)
    set(h,'CData',check)
    pause(n)
else
    figure(1)
    h = image(check);
    hold on 
    plot([[0:W]',[0:W]']+0.5,[0,L]+0.5,'k')
    plot([0,W]+0.5,[[0:L]',[0:L]']+0.5,'k')
    axis image
    set(gca,'xtick',[],'ytick',[]);
    pause(n)
end

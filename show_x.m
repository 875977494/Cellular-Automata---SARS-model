function [h,temp1,temp2,temp3] = show_x(h,x,g,n)  %h�Ǿ����temp123�Ǵ���rgb�ľ���
%% ״̬1 �׸� 0 ��ɫ 1 1 1
%% ״̬2 Ǳ�� 1 ��ɫ 1 1 0
%% ״̬3 ���� 2 ��ɫ 1 0 0
%% ״̬4 ���� 3 ��ɫ 0 0 1
[L,W] = size(x);
temp3 = x;
temp2 = temp3;
temp1 = temp3;

%% ���׸���Ⱥ��ɫ ��ɫ
temp1(x == 0) = 1;
temp2(x == 0) = 1;
temp3(x == 0) = 1;

%% ��Ǳ����Ⱥ��ɫ ��ɫ
temp1(x == 1) = 1;
temp2(x == 1) = 1;
temp3(x == 1) = 0;

%% ��������Ⱥ��ɫ ��ɫ
temp1(x == 2) = 1;
temp2(x == 2) = 0;
temp3(x == 2) = 0;

%% ��������Ⱥ��ɫ ��ɫ
temp1(x == 3) = 0;
temp2(x == 3) = 0;
temp3(x == 3) = 1;

%% �ϲ���������
check = cat(3,temp1,temp2,temp3);

%% ��ͼ
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

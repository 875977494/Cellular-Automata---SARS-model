%% Ԫ���Զ��� SARSģ�� by ����Ⱥ 2018.4

a = 50;  %Ԫ���Զ����ı߳� 100*100
n = 0.1;
iterations = 365;  %��������
[x,g] = create_x(a);
pd = 0.5;  %�ֿ�����
ps = 0.05; %Ǳ���ڶ��׸��ߵĴ�Ⱦ����
pb = 0.7;  %���׸��ߵĸ���
T = 100;  % �ӷ����ڽ��������ڵ������
[h,temp1,temp2,temp3] = show_x(NaN,x,g,n);

% x = change(x,g,ps,pd,pb)
for i = 1:iterations
    [x,g] = change(x,g,ps,pd,pb,T);
    [h,temp1,temp2,temp3] = show_x(NaN,x,g,n);
end
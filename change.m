%% change���� 
function [x,g] = change(x,g,ps,pd,pb,T)
%% ps Ǳ�����׸еĸ�Ⱦ��  pd �ֿ����� pb ���׸��ߵĸ���

[a,b] = size(x);
p = zeros(a); %���ʾ���  p������ָ��p����Ⱦ�ھӵĸ���
p1 = zeros(a); %����ת�ƾ���
p(x == 0 | x == 3) = 0;
p(x == 1) = ps;
p(x == 2) = pb;

for i = 1:a  % ��p��p1����һ��
    for j = 1:a
        if i == 1 & j == 1
            p1(i,j) = p(i+1,j) + p(i,j+1);
        elseif i == 1 & j == a
            p1(i,j) = p(i+1,j) + p(i,j-1);
        elseif i == a & j == 1
            p1(i,j) = p(i-1,j) + p(i,j+1);
        elseif i == a & j == a
            p1(i,j) = p(i-1,j) + p(i,j-1);
        elseif j == 1 % ��һ��
            p1(i,j) = p(i+1,j) + p(i-1,j) + p(i,j+1);
        elseif j == a % ���һ��
            p1(i,j) = p(i-1,j) + p(i+1,j) + p(i,j-1);
        elseif i == 1 % ��һ��
            p1(i,j) = p(i,j-1) + p(i+1,j) + p(i,j+1);
        elseif i == a % ���һ��
            p1(i,j) = p(i-1,j) + p(i,j-1) + p(i,j+1);  
        else
            p1(i,j) = p(i-1,j) + p(i+1,j) + p(i,j-1) + p(i,j+1);
        end
    end
end
%% ���ϣ��õ�p1����ת�ƾ���
%% �������ٰ�x�������һ��
for i = 1:a
    for j = 1:b
        if x(i,j) == 0   %��������׸���״̬�����״̬ת�ƾ����Ӧλ�õĸ��ʣ���pd�󣬾ͷ���
            if p1(i,j) > pd 
                x(i,j) = 1;
            end
        elseif x(i,j) == 1  % �������Ǳ��״̬���ȿ���ӦǱ��ʱ����󣬴���12����pe����1
            if g(i,j)>12   %�˴��������ؿ��巽��ģ�������
                pe = 1;
            else 
                pe = exp(-1*(12-g(i,j))/12);
            end
            temp = rand(1);
            if temp > 1 - pe  %��1-pe�󣬾ͱ�̷�����
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

            
        
            


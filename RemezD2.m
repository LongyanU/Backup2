% Sep 6  REMEZ
clear;clc;
v=2000;
h=10;
tau=0.001;
M=10;


k=linspace(0*pi/(100*h),80/(v/(2*h))*pi/h,M+1); %M=7 �ٶ�1500
r=v*tau/h;
%%%%%%%%%%%%%%%%%%%%%%

%%�����Etgen�ļ�Ϊ������
tic
    AA=zeros(M+1,M+1);
    b=zeros(M+1,1);
    for i=1:M+1
        for jj=1:9
            xita=(jj-1)*pi/16;
            AA(i,1)=1+AA(i,1);
            for j=2:M+1
                AA(i,j)=cos((j-1)*k(i)*h*cos(xita))+cos((j-1)*k(i)*h*sin(xita))+AA(i,j);
            end
        end
        
        b(i)=(cos(k(i)*v*tau)-1);
    end
    b=9*b/(r^2);
    a=AA\b;

toc

%����Ƶɢ����
figure
c=a;
% % c(1)=-2*sum(c(2:end));
% % k=linspace((1)/(100*h),(pi)/h,100);
% % for i=1:5
% %     xita=(i-1)*pi*15/180;
% %     g=c(1);
% %     for n=2:M+1
% %         g=g+c(n)*cos((n-1)*k*h*cos(xita))+c(n)*cos((n-1)*k*h*sin(xita));
% %     end
% %     g=r^2*g+1;
% %     delta=1./(r*k*h);
% %     delta=delta.*acos(g);
% %     hold on
% %     a1=h/v*(1./delta-1);
% %     hold on
% %     plot(v*k*h/(2*pi*h),(a1),'blue')
% %     
% %     grid on
% % end
%����Ƶɢ����


r=v*tau/h;
k=linspace(0,(pi)/h,100);
% c(1)=-2*sum(c(2:end));
for i=1:5
    xita=(i-1)*pi/16;
    temp=0;
    for m=1:M
        temp=temp+r^2*c(m+1)*(sin(m*k*h*cos(xita)/2).^2+sin(m*k*h*sin(xita)/2).^2);
    end
    delta2=2./(r*k*h);
    delta2=delta2.*asin(sqrt(temp));
    
    a1=(h/v*(1./delta2-1));
    hold on
    
        if (i==1)
            plot(v*k*h/(2*pi*h),a1,'k')
        elseif i==2
            plot(v*k*h/(2*pi*h),a1,'k--')
        elseif i==3
            plot(v*k*h/(2*pi*h),a1,'k:')
        elseif i==4
            plot(v*k*h/(2*pi*h),a1,'k-.')
        elseif i==5
            plot(v*k*h/(2*pi*h),a1,'k--o','MarkerSize',2)
        end
    
%         if (i==1)
%             plot(k*h,1-delta2,'k')
%         elseif i==2
%             plot(k*h,1-delta2,'k--')
%         elseif i==3
%             plot(k*h,1-delta2,'k:')
%         elseif i==4
%             plot(k*h,1-delta2,'k-.')
%         elseif i==5
%             plot(k*h,1-delta2,'k-o','MarkerSize',5)
%         end
    
%     if (i==1)
%         plot(k*h,-1+delta2,'k')
%     elseif i==2
%         plot(k*h,-1+delta2,'k--')
%     elseif i==3
%         plot(k*h,-1+delta2,'k:')
%     elseif i==4
%         plot(k*h,-1+delta2,'k-.')
%     elseif i==5
%         plot(k*h,-1+delta2,'k-o','MarkerSize',1.5)
%     end
end
Ylabel('���');
Xlabel('kh');

digits(6)
% axis([ 0 3.50 -0.05 0.250001])
legend('��=0','��=��/16','��=2��/16','��=3��/16','��=4��/16')
vpa(c)'
% title('remez')
%%���ݹ�ʽ������Ƶɢ����
grid on
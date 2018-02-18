function F = myfun7(x)

global v ratio M tau h;

r=v*tau/h;
k=linspace(1*pi/(600*h),ratio*pi/h,M+2); %M=7 �ٶ�1500

F=zeros(5,M+2);

for i=1:5  % F����˼��5���Ƕ�,30�������㣬����5���Ƕ�,30�������� ����ʱ��-�ռ���Ƶɢ��ϵ��ʵ�ʾ�������Щ�ض��ĽǶȺͲ����㣬��ʽ�������С��
    xita=(i-1)*pi/16;
    F(i,:)=2*x(1)+ F(i,:);
    for j=2:M+1
        F(i,:)=2*x(j)*cos((j-1)*k*h*cos(xita))+2*x(j)*cos((j-1)*k*h*sin(xita))+ F(i,:);
    end
   
    F(i,:)=F(i,:)+4*x(M+2)*cos(k*h*cos(xita)).*cos(k*h*sin(xita));
   
    F(i,:)=1+1/2* F(i,:)*r^2;
    F(i,:)=acos( F(i,:))./(k*v*tau);  %��ʵ�ٶȱ����޲���ٶ� ��ȥ1���������С
    
end

F=F-1;
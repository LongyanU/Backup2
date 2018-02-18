function F = myfun7(x)

global v ratio M tau h;

r=v*tau/h;
k=linspace(1*pi/(600*h),ratio*pi/h,M+2); %M=7 速度1500

F=zeros(5,M+2);

for i=1:5  % F的意思是5个角度,30个波数点，在这5个角度,30个波数点 满足时间-空间域频散关系。实际就是在这些特定的角度和波数点，公式的误差最小。
    xita=(i-1)*pi/16;
    F(i,:)=2*x(1)+ F(i,:);
    for j=2:M+1
        F(i,:)=2*x(j)*cos((j-1)*k*h*cos(xita))+2*x(j)*cos((j-1)*k*h*sin(xita))+ F(i,:);
    end
   
    F(i,:)=F(i,:)+4*x(M+2)*cos(k*h*cos(xita)).*cos(k*h*sin(xita));
   
    F(i,:)=1+1/2* F(i,:)*r^2;
    F(i,:)=acos( F(i,:))./(k*v*tau);  %真实速度比有限差分速度 减去1，的误差最小
    
end

F=F-1;
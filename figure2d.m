clear;
clc

global v ratio M tau h

v=2000;

h=20;
tau=0.001;
M=7;
r=v*tau/h;
ratio=0.8;

x0=0.001*ones(1,M+2);%系数的初值是0
x0(end)=0;
% x0=0.0001*zeros(1,M+2);%系数的初值是0
options = optimset('Algorithm','levenberg-marquardt','TolFun',10^-120,'TolX',10^-100,'MaxFunEvals',20000,'MaxIter',2000);

% [x,resnorm] = lsqnonlin(@myfun7,x0);    % Invoke optimizer


[x,resnorm] = lsqnonlin(@myfun7,x0,[],[],options);    % Invoke optimizer



c=real(x);

% c(1)=-2*sum(c(2:end-1));

d11=x(end);
%画出频散曲线
figure
k=linspace(1*pi/4000,(pi)/h,1000);
for i=1:5
    xita=(i-1)*pi/16;
    temp=2*c(1);
    for j=2:M+1
        temp=2*c(j)*cos((j-1)*k*h*cos(xita))+2*c(j)*cos((j-1)*k*h*sin(xita))+temp;
    end
    
    temp=temp+4*d11*cos(k*h*cos(xita)).*cos(k*h*sin(xita));
    temp=1+1/2*temp*r^2;
    
    temp=acos(temp)./(k*v*tau);

    a1=(h/v*(1./temp-1));

    if (i==1)
        plot(v*k*h/(2*pi*h),a1,'m','linewidth',2.5)
        hold on
    elseif i==2
        plot(v*k*h/(2*pi*h),a1,'r--','linewidth',2.5)
    elseif i==3
        plot(v*k*h/(2*pi*h),a1,'c:','linewidth',2.5)
    elseif i==4
        plot(v*k*h/(2*pi*h),a1,'k-.','linewidth',2.5)
    else
        plot(v*k*h/(2*pi*h),a1,'b','linewidth',2.5)
    end
end
ylabel('ε');
xlabel('f(Hz)');

digits(6)

legend('θ=0','θ=π/16','θ=2π/16','θ=3π/16','θ=4π/16')
vpa(c)'
grid on
axis([0 v/(2*h) -0.2*10^-4 0.5*10^-4])
clear
% Parameters are listed below

f=1.16;
eta=0.5;
Y0=1e-06;
e0=0.5;
ed=0.02;
alpha=0.2;
q=0.5;
n=10000;
L=250;
axis=0:L;
% Define Arrays
eu=zeros;
Yl=zeros;
R=zeros;
Ywl=zeros;
exu=zeros;
Rx=zeros;
Yif=zeros;
Rif=zeros;

eif=zeros;



gamma=5.3;
N=10^10;
P0=0.1;
Pu=0.6;
Pv=0.3;
Y0l=Y0*(1-gamma/sqrt(Y0*N*P0));
Y0u=Y0*(1+gamma/sqrt(Y0*N*P0));
eps = 0.08; %区间精度
% Beginn des Prozesses

% u(x+1) = 1.*rand(1,1);
% v(x+1) = 1.*rand(1,1);
%((P(n,u(x+1))/P(n,v(x+1)))>=(P(2,u(x+1))/P(2,v(x+1))))&& 


% for x=0:250
%         %(P(2,u(x+1))/P(2,v(x+1)))<(P(1,u(x+1))/P(1,v(x+1)))
%         temp1 = 1.*rand(1,1);
% %         temp2 = 1.*rand(1,1);
%         
%             u(x+1)=temp1;
%             v(x+1)=0.618*temp1;
%         
%     
% end
%          

v(x+1) = 0;u(x+1) = 1; %初始区间

for x= 0:L
    while((u(x+1) - v(x+1)) >= eps)
        x1 = v(x+1) + 0.382 * (u(x=1) - v(x+1));
        x2 = v(x+1) + 0.618 * (u(x+1) - v(x+1)); %黄金分割法主要步骤
        Qu= Q(x,x2);
        Qv= Q(x,x1);
        %     Qu =1-(1-Y0)*exp(-etar(x)*0.5);
        %     Qv =1-(1-Y0)*exp(-etar(x)*0.05);
        Tu=T(Qu);
        Tv=T(Qv);

        %     Tu=(e0-ed)*Y0+ed*Qu;
        %     Tv=(e0-ed)*Y0+ed*Qv; %2nd will use it
        E=Tu/Qu;


        %%%3态
        %     Yl(x+1)=(P(2,u(x+1))*(Qv-P(0,v(x+1))*Y0)-P(2,v(x+1))*(Qu-P(0,u(x+1))*Y0))/(P(1,v(x+1)(x+1))*P(2,u(x+1))-P(1,u(x+1))*P(2,v(x+1)(x+1)));
        %
        %     eu(x+1)=(Tv-P(0,v(x+1)(x+1))*Y0*e0)/(P(1,v(x+1)(x+1))*Yl(x+1));
        %
        %     R(x+1)=q*(P(1,u(x+1))*Yl(x+1)*(1-H2(eu(x+1)))-Qu*f*H2(E));



        %%%%%%%%%%%%%%考虑统计起伏
        Ywl(x+1)=(P(2,x2)*Qv*(1-delta(Pv,x,x1))-P(2,x1)*Qu*(1-delta(Pu,x,x2))+(P(2,x1)*P(0,x2)-P(2,x2)*P(0,x1))*Y0l)/(P(1,x1)*P(2,x2)-P(1,x2)*P(2,x1));
        %Ywl(x+1)=(P(2,u(x+1))*Qbar(Pv,x,v(x+1))*(1-delta(Pv,x,v(x+1)))-P(2,v(x+1))*Qbar(Pu,x,u(x+1))*(1-delta(Pu,x,u(x+1)))+(P(2,v(x+1))*P(0,u(x+1))-P(2,u(x+1))*P(0,v(x+1)))*Y0l)/(P(1,v(x+1))*P(2,u(x+1))-P(1,u(x+1))*P(2,v(x+1)));

        exu(x+1)=(Tbar(Pv,x,x1)*(1+deltaT(Pv,x,x1))-P(0,x1)*e0*Y0u)/(P(1,x1)*Ywl(x+1));

        Rx(x+1)=q*(P(1,x2)*Ywl(x+1)*(1-H2(exu(x+1)))-Qu*f*H2(E));
        
        if f(x1) < f(x2) %两种情形的判断
            u = x2;
        else
            v = x1;
        end

        %%%%%%%无穷
        %             Yif(x+1)= 1-(1-Y0)*(1-etar(x));
        %
        %             eif(x+1)=((e0-ed)*Y0+ed*Yif(x+1))/Yif(x+1);
        %
        %             Rif(x+1)=q*(P(1,u(x+1))*Yif(x+1)*(1-H2(eif(x+1)))-Qu*f*H2(E));


    end
end


% %Pic 1
% subplot(1,3,1)
% plot(axis,Ywl,"-g")
% hold on;
% plot(axis,Yif,"-u(x+1)")
% hold on
% plot(axis,Yl,"*r")
% xlabel("Kilometer"),ylabel("Y1"),title("计数率下界")
% %Pic 2
% subplot(1,3,2)
% plot(axis,eu,"*r")
% hold on;
% plot(axis,exu,"-g")
% hold on
% plot(axis,eif,"-u(x+1)")
% xlabel("Kilometer"),ylabel("e1"),title("误码率上界")
%Pic 3
% subplot(1,3,3)
subplot(1,2,1)
plot(axis,u)
hold on;
plot(axis,v)
subplot(1,2,2)
semilogy(axis,R,"*r")
hold on;
semilogy(axis,Rx,"-g")
hold on;
semilogy(axis,Rif,"-u(x+1)")
xlabel("Kilometer"),ylabel("Key Rate (bit/rate)"),title("成码率 R")




% plot(axis,Ywl)
% hold on;
% plot(axis,Yif,"*")
% hold on
% plot(axis,Yl)
% 
% 
% plot(axis,eu)
% hold on;
% plot(axis,exu,"*")
% hold on
% plot(axis,eif)


% semilogy(axis,R,"*g")
% hold on;
% semilogy(axis,Rx)
% hold on;
% semilogy(axis,Rif)
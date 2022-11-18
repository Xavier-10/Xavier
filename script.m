clear
% Parameters are listed below
u=0.5;
v=0.05;
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
% Beginn des Prozesses
for x= 0:L
    Qu= Q(x,u);
    Qv= Q(x,v);
%     Qu =1-(1-Y0)*exp(-etar(x)*0.5);
%     Qv =1-(1-Y0)*exp(-etar(x)*0.05);
    Tu=T(Qu);
    Tv=T(Qv);

%     Tu=(e0-ed)*Y0+ed*Qu;
%     Tv=(e0-ed)*Y0+ed*Qv; %2nd will use it
    E=Tu/Qu;
    %%%3态
    Yl(x+1)=(P(2,u)*(Qv-P(0,v)*Y0)-P(2,v)*(Qu-P(0,u)*Y0))/(P(1,v)*P(2,u)-P(1,u)*P(2,v)); 

    eu(x+1)=(Tv-P(0,v)*Y0*e0)/(P(1,v)*Yl(x+1));

    R(x+1)=q*(P(1,u)*Yl(x+1)*(1-H2(eu(x+1)))-Qu*f*H2(E));


    %%%%%%%%%%%%%%考虑统计起伏
        Ywl(x+1)=(P(2,u)*Qv*(1-delta(Pv,x,v))-P(2,v)*Qu*(1-delta(Pu,x,u))+(P(2,v)*P(0,u)-P(2,u)*P(0,v))*Y0l)/(P(1,v)*P(2,u)-P(1,u)*P(2,v)); 
        %Ywl(x+1)=(P(2,u)*Qbar(Pv,x,v)*(1-delta(Pv,x,v))-P(2,v)*Qbar(Pu,x,u)*(1-delta(Pu,x,u))+(P(2,v)*P(0,u)-P(2,u)*P(0,v))*Y0l)/(P(1,v)*P(2,u)-P(1,u)*P(2,v));

        exu(x+1)=(Tbar(Pv,x,v)*(1+deltaT(Pv,x,v))-P(0,v)*e0*Y0u)/(P(1,v)*Ywl(x+1));
        %exu(x+1)=(Tbar(Pv,x,v)*(1+deltaT(Pv,x,v))-P(0,v)*e0*Y0u)/(P(1,v)*Ywl(x+1));


        Rx(x+1)=q*(P(1,u)*Ywl(x+1)*(1-H2(exu(x+1)))-Qu*f*H2(E));

        %%%%%%%无穷
            Yif(x+1)= 1-(1-Y0)*(1-etar(x));

            eif(x+1)=((e0-ed)*Y0+ed*Yif(x+1))/Yif(x+1);

            Rif(x+1)=q*(P(1,u)*Yif(x+1)*(1-H2(eif(x+1)))-Qu*f*H2(E));


end

%Pic 1
subplot(1,3,1)
plot(axis,Ywl,"-g")
hold on;
plot(axis,Yif,"-b")
hold on
plot(axis,Yl,"*r")
xlabel("Kilometer"),ylabel("Y1"),title("计数率下界")
%Pic 2
subplot(1,3,2)
plot(axis,eu,"*r")
hold on;
plot(axis,exu,"-g")
hold on
plot(axis,eif,"-b")
xlabel("Kilometer"),ylabel("e1"),title("误码率上界")
%Pic 3
subplot(1,3,3)
semilogy(axis,R,"*r")
hold on;
semilogy(axis,Rx,"-g")
hold on;
semilogy(axis,Rif,"-b")
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
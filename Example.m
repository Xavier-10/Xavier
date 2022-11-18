clear all;
clc
format long;

tic
global eta_det;eta_det=0.145; %global parameter
%%%%%%%%%%%%%%example 1
L1=0:1:100;                   %数组
eta1 = eta_det*10.^(-0.02*L1);%公式代码

figure                       %新图
plot(L1,eta1)                 %线性坐标画图
xlabel('Distance (km)');     %横坐标
ylabel('eta');               %纵坐标
title('eta\_det=0.145')      %标题

%%%%%%%%%%%%%%example 2
L2=0:1:500;
eta2 = eta(L2);               %子函数调用

figure
semilogy(L2,eta2)  %对数坐标画图
xlabel('Distance (km)');
ylabel('eta');
title('eta\_det=0.145')

toc
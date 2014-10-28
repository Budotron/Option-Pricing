%attempt to model evolution of an interest rate
clear all;
R0=1.3734; %exchange rate on 10/02/10
D=xlsread('exchange_rate.xlsx'); %all the data we have
days= 100; %length(D);
dt=1/365; %interest rates are taken at the close of the business day
sigma=sqrt(var(D(3:8, 4))); %estimate of volatility from historical data
stdDev=sigma*sqrt(dt);
mu=mean(D(3:length(D), 4)); 
expTerm=mu*dt;
R(1, days)=0;
Y=zeros(1, days);
z=zeros(1, days);
trials=1000;
for i=1:trials
    for j=1:days
        z(j)=rand;
        Y(j)=exp((mu-sigma^2)/2*sqrt(dt)*z(j)+mu*dt);
        if j==1
            Y(j)=Y(j);
        else
            Y(j)=Y(j)*Y(j-1);
        end
        R(j)=R0*Y(j);
    end
    hold on
    plot (R)
end
figure, hist(R)


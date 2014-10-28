nDays=90;                   %number of days to the expiry of the option
dt=1/365;                   %time discretization in years
T=nDays*dt;                 %time in years to the expiry of the option
S0=20;                      %initial stock price
K=25;                       %strike price of the option
r=4.4127;                     %risk free interest rate
expTerm=r*dt;
sigma=0.057;                  %volatility
sddev=sigma*sqrt(dt);       %
nTrials=10000;              %number of times to perform the simulation
value=0;
for j=1:nTrials
    n=rand(1, nDays);       %1x90 vector of random numbers
    S=S0;
    for i=1:nDays
        dS=S*(expTerm+sddev*n(i));
        S=S+dS;
    end
    S90(j)=S;
    value=value+max(S-K, 0);
end
value=value/nTrials
price=exp(-r*T)*value
hist(S90)
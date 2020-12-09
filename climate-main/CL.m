function [F1AvgThat,F1AvgGamhat,F2AvgThat,F2AvgGamhat,F3AvgThat,F3AvgGamhat,F4AvgThat,F4AvgGamhat,AvgThat, AvgGamhat, nRange, epRange,meantimeseries,S,TS] = CL(nRange, epRange,tau,G, time,tstep, Iter,Ini_CO2,Ini_T,x,c,v)

%define seconds per day, seconds per month, and seconds per year
dy = 60*60*24;
mo = 60*60*24*30;
yr = 60*60*24*365;
%Specify timestep, end time, and initial values (with units)
h = tstep; %seconds
tspan = time*yr; % seconds
CO2_0 = Ini_CO2; %ppm
T_0 = Ini_T; %kelvin

%nondimensionalize time variables
K = 1e-7;

dyhat = K*dy;
mohat = K*mo;
yrhat = K*yr;
tspanhat= K*tspan;
hhat = K*h;

timeseriesdata = cell(Iter,1);
timeseries = cell(Iter,1);

F1AvgThat = zeros(length(nRange),length(epRange));
F1AvgGamhat = zeros(length(nRange),length(epRange));

F2AvgThat = zeros(length(nRange),length(epRange));
F2AvgGamhat = zeros(length(nRange),length(epRange));

F3AvgThat = zeros(length(nRange),length(epRange));
F3AvgGamhat = zeros(length(nRange),length(epRange));

F4AvgThat = zeros(length(nRange),length(epRange));
F4AvgGamhat = zeros(length(nRange),length(epRange));

AvgThat = zeros(length(nRange),length(epRange));
AvgGamhat = zeros(length(nRange),length(epRange));


parfor k = 1:Iter
[F1That,F1Gamhat,F2That,F2Gamhat,F3That,F3Gamhat, F4That,F4Gamhat,TermThat, TermGamhat, data, TS] = MainLoop(nRange,epRange,tau,G,hhat,CO2_0,T_0,tspanhat);

timeseriesdata{k,1} = data{x,c,v};
timeseries{k,1} = TS;

F1AvgThat = F1AvgThat + F1That;
F1AvgGamhat = F1AvgGamhat + F1Gamhat;

F2AvgThat = F2AvgThat + F2That;
F2AvgGamhat = F2AvgGamhat + F2Gamhat;

F3AvgThat = F3AvgThat + F3That;
F3AvgGamhat = F3AvgGamhat + F3Gamhat;

F4AvgThat = F4AvgThat + F4That;
F4AvgGamhat = F4AvgGamhat + F4Gamhat;

AvgThat = AvgThat + TermThat;
AvgGamhat = AvgGamhat + TermGamhat;

end
TS = timeseries{1,1};
meantimeseries = zeros(size(timeseriesdata{1,1}));

parfor k = 1:Iter
    meantimeseries = meantimeseries + timeseriesdata{k,1}
end

meantimeseries = meantimeseries/Iter;

DevMat = zeros(Iter,length(timeseriesdata{1,1}));

parfor k=1:Iter
    DevMat(k,:) = timeseriesdata{k,1}'
end

S = std(DevMat);

F1AvgThat = F1AvgThat/Iter;
F1AvgGamhat = F1AvgGamhat/Iter;

F2AvgThat = F2AvgThat/Iter;
F2AvgGamhat = F2AvgGamhat/Iter;

F3AvgThat = F3AvgThat/Iter;
F3AvgGamhat = F3AvgGamhat/Iter;

F4AvgThat = F4AvgThat/Iter;
F4AvgGamhat = F4AvgGamhat/Iter;

AvgThat = AvgThat/Iter;
AvgGamhat = AvgGamhat/Iter;

end
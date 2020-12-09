clear
clear variables

%%Initialize values for simulation

%CO2 reduction amount
n = [2,3,4,5,6,7,8,9,10];

%Time between plateaus, in years
delta = [10,13,16,20,23,26,29,32,35,38,41,44,47,50];

%Delay, in seconds
tau = 60*60*24*365;

%Emissions, in s^-1
G = 3.0603;

%Simulation time, in years
time = 200;

%Timestep, in seconds
tstep = 60*60*24;

%Iterations of simulation
Iter = 10;

%Initial CO2 in ppm
Ini_CO2 = 410;

%Initial temperature in Kelvin
Ini_T = 288.15;

%% Which time series data to obtain
% Index of n
i = 2;
% Index of delta
j = 14;
% k = 1 for temperature, k = 2 for CO2
k = 2;

%%
[F1AvgThat,F1AvgGamhat,F2AvgThat,F2AvgGamhat,F3AvgThat,F3AvgGamhat,F4AvgThat,F4AvgGamhat,AvgThat, AvgGamhat, delaygrid, Ggrid,meantimeseries,S,TS] = CL(n,delta,tau,G,time,tstep,Iter,Ini_CO2,Ini_T,i,j,k);

c2 = 5.556/(365*24*60*60*410);
K = 1e-7;


%%
h(1)=figure
s = pcolor(delta,n,288*AvgThat - 273.15)
s.FaceColor = 'interp';
xlabel('$\Delta t$','fontsize',18,'interpreter','latex')
ylabel('$n$','fontsize',18,'interpreter','latex')
colorbar
colormap jet
shading interp
caxis([12 23])
title('200 year temperature of model with parameter drift','fontsize',14,'interpreter','latex')

h(2)=figure
s = pcolor(delta,n,288*F1AvgThat - 273.15)
s.FaceColor = 'interp';
xlabel('$\Delta t$','fontsize',18,'interpreter','latex')
ylabel('$n$','fontsize',18,'interpreter','latex')
colorbar
colormap jet
shading interp
caxis([12 23])
title('40 year temperature of model with parameter drift','fontsize',14,'interpreter','latex')

h(3)=figure
s = pcolor(delta,n,288*F2AvgThat - 273.15)
s.FaceColor = 'interp';
xlabel('$\Delta t$','fontsize',18,'interpreter','latex')
ylabel('$n$','fontsize',18,'interpreter','latex')
colorbar
colormap jet
shading interp
caxis([12 23])
title('80 year temperature of model with parameter drift','fontsize',14,'interpreter','latex')

h(4)=figure
s = pcolor(delta,n,288*F3AvgThat - 273.15)
s.FaceColor = 'interp';
xlabel('$\Delta t$','fontsize',18,'interpreter','latex')
ylabel('$n$','fontsize',18,'interpreter','latex')
colorbar
colormap jet
shading interp
caxis([12 23])
title('120 year temperature of model with parameter drift','fontsize',14,'interpreter','latex')

h(5)=figure
s = pcolor(delta,n,288*F4AvgThat - 273.15)
s.FaceColor = 'interp';
xlabel('$\Delta t$','fontsize',18,'interpreter','latex')
ylabel('$n$','fontsize',18,'interpreter','latex')
colorbar
colormap jet
shading interp
caxis([12 23])
title('160 year temperature of model with parameter drift','fontsize',14,'interpreter','latex')

%%
h(6)=figure
s = pcolor(delta,n,280*AvgGamhat)
s.FaceColor = 'interp';
xlabel('$\Delta t$','fontsize',18,'interpreter','latex')
ylabel('$n$','fontsize',18,'interpreter','latex')
colorbar
colormap jet
shading interp
caxis([130 430])
title('200 year CO2 of model with parameter drift','fontsize',14,'interpreter','latex')

h(7)=figure
s = pcolor(delta,n,280*F1AvgGamhat)
s.FaceColor = 'interp';
xlabel('$\Delta t$','fontsize',18,'interpreter','latex')
ylabel('$n$','fontsize',18,'interpreter','latex')
colorbar
colormap jet
shading interp
caxis([130 430])
title('40 year CO2 of model with parameter drift','fontsize',14,'interpreter','latex')

h(8)=figure
s = pcolor(delta,n,280*F2AvgGamhat)
s.FaceColor = 'interp';
xlabel('$\Delta t$','fontsize',18,'interpreter','latex')
ylabel('$n$','fontsize',18,'interpreter','latex')
colorbar
colormap jet
shading interp
caxis([130 430])
title('80 year CO2 of model with parameter drift','fontsize',14,'interpreter','latex')

h(9)=figure
s = pcolor(delta,n,280*F3AvgGamhat)
s.FaceColor = 'interp';
xlabel('$\Delta t$','fontsize',18,'interpreter','latex')
ylabel('$n$','fontsize',18,'interpreter','latex')
colorbar
colormap jet
shading interp
caxis([130 430])
title('120 year CO2 of model with parameter drift','fontsize',14,'interpreter','latex')

h(10)=figure
s = pcolor(delta,n,280*F4AvgGamhat)
s.FaceColor = 'interp';
xlabel('$\Delta t$','fontsize',18,'interpreter','latex')
ylabel('${n}$','fontsize',18,'interpreter','latex')
colorbar
colormap jet
shading interp
caxis([130 430])
title('160 year CO2 of model with parameter drift','fontsize',14,'interpreter','latex')

%%
h(11)=figure
ts = TS/(K*60*60*24*365);
hold all
postd = 288*(meantimeseries + S')- 273.15;
negstd = 288*(meantimeseries - S')- 273.15;

x2 = [TS/(K*60*60*24*365), fliplr(TS/(K*60*60*24*365))];
inBetween = [288*(meantimeseries - S')- 273.15,fliplr(288*(meantimeseries + S')- 273.15)];
fill(x2, inBetween, 'g');
%%

GamHatSq = cat(3,F1AvgGamhat,F2AvgGamhat,F3AvgGamhat,F4AvgGamhat,AvgGamhat);
TempSq = cat(3,F1AvgThat,F2AvgThat,F3AvgThat,F4AvgThat,AvgThat);

GamHatSq2 = zeros(size(GamHatSq,2),size(GamHatSq,1),size(GamHatSq,3));
TempSq2 = zeros(size(TempSq,2),size(TempSq,1),size(TempSq,3));

for j = 1:size(GamHatSq,2)
    for i = 1:size(GamHatSq,1)
        for k = 1:size(GamHatSq,3)
            GamHatSq2(j,i,k) = GamHatSq(i,j,k);
            TempSq2(j,i,k) = TempSq(i,j,k);
        end
    end
end
    
delt = linspace(40,200,5);
[nn, yy, deltt] = meshgrid(n,delta,delt);

clf
isosurface(nn, yy, deltt, 288*TempSq2 - 273.15)
colorbar
colormap jet
[fe, ve, ce] = isocaps(nn, yy, deltt, 288*TempSq2- 273.15, 0);
p2 = patch('Faces', fe, 'Vertices', ve, 'FaceVertexCData', ce);
p2.FaceColor = 'interp';
p2.EdgeColor = 'none' ;
grid on
xlabel('n','fontsize',18,'interpreter','latex');
ylabel('$\Delta t$','fontsize',18,'interpreter','latex');
zlabel({'Timespan','Years'},'fontsize',18,'interpreter','latex');
%title('Temperatures');
set(gca, 'clim', [12 15.5])
%set(get(colorbar, 'title'), 'string', 'K', 'FontW', 'bold', 'fontname', 'Times New Roman', 'fontsize', 14);
view(3)


save('ClimData')
savefig(s,'ClimFigs.jpg')
close(s)

%% Slices
slice(nn,yy,deltt,288*TempSq2 - 273.15,[],[],[40 80 120 160 200])
colorbar
colormap jet
shading interp
xlabel('n','fontsize',18,'interpreter','latex');
ylabel('$\Delta t$','fontsize',18,'interpreter','latex');
zlabel({'Timespan','Years'},'fontsize',18,'interpreter','latex');
title('Temperature');
set(gca, 'clim', [12 23])















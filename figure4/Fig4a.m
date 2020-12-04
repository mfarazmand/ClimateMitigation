%load('100yearsB.mat','ep')
%load('100yearsB.mat','n')

Gam20 = load('100yearsB.mat','F1AvgGamhat');
Gam40 = load('100yearsB.mat','F2AvgGamhat');
Gam60 = load('100yearsB.mat','F3AvgGamhat');
Gam80 = load('100yearsB.mat','F4AvgGamhat');
Gam100 = load('100yearsB.mat','AvgGamhat');

Gam20 = Gam20.F1AvgGamhat;
Gam40 = Gam40.F2AvgGamhat;
Gam60 = Gam60.F3AvgGamhat;
Gam80 = Gam80.F4AvgGamhat;
Gam100 = Gam100.AvgGamhat;

Temp20 = load('100yearsB.mat','F1AvgThat');
Temp40 =load('100yearsB.mat','F2AvgThat');
Temp60 =load('100yearsB.mat','F3AvgThat');
Temp80 =load('100yearsB.mat','F4AvgThat');
Temp100 =load('100yearsB.mat','AvgThat');

Temp20 = Temp20.F1AvgThat;
Temp40 = Temp40.F2AvgThat;
Temp60 = Temp60.F3AvgThat;
Temp80 = Temp80.F4AvgThat;
Temp100 = Temp100.AvgThat;


%Gam40 = load('ClimData2a.mat','F1AvgGamhat');
%Gam80 = load('ClimData2a.mat','F2AvgGamhat');
Gam120 = load('200yearsB.mat','F3AvgGamhat');
Gam160 = load('200yearsB.mat','F4AvgGamhat');
Gam200 = load('200yearsB.mat','AvgGamhat');

Gam120 = Gam120.F3AvgGamhat;
Gam160 = Gam160.F4AvgGamhat;
Gam200 = Gam200.AvgGamhat;

%Temp40 = load('ClimData2a.mat','F1AvgThat');
%Temp80 = load('ClimData2a.mat','F2AvgThat');
Temp120 = load('200yearsB.mat','F3AvgThat');
Temp160 = load('200yearsB.mat','F4AvgThat');
Temp200 = load('200yearsB.mat','AvgThat');

Temp120 = Temp120.F3AvgThat;
Temp160 = Temp160.F4AvgThat;
Temp200 = Temp200.AvgThat;

GamHatSq = cat(3,Gam20,Gam40,Gam60,Gam80,Gam100,Gam120,Gam160,Gam200);
TempSq = cat(3,Temp20,Temp40,Temp60,Temp80,Temp100,Temp120,Temp160,Temp200);

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

n = [2,3,4,5,6,7,8,9,10];
ep = [10,13,16,20,23,26,29,32,35,38,41,44,47,50];
delt = [20,40,60,80,100,120,160,200];
[nn, yy, deltt] = meshgrid(n,ep,delt);

%clf
%isosurface(nn, yy, deltt, 288*TempSq2 - 273.15)
%colorbar
%colormap jet
%[fe, ve, ce] = isocaps(nn, yy, deltt, 288*TempSq2- 273.15, 0);
%p2 = patch('Faces', fe, 'Vertices', ve, 'FaceVertexCData', ce);
%p2.FaceColor = 'interp';
%p2.EdgeColor = 'none' ;
%grid on
%xlabel('n','fontsize',18,'interpreter','latex');
%ylabel('$\Delta t$','fontsize',18,'interpreter','latex');
%zlabel({'Timespan','Years'},'fontsize',18,'interpreter','latex');
%title('Temperatures');
%set(gca, 'clim', [12 22])
%set(get(colorbar, 'title'), 'string', 'K', 'FontW', 'bold', 'fontname', 'Times New Roman', 'fontsize', 14);


figure
slice(nn,yy,deltt,288*TempSq2 - 273.15,[],[],[20 40 80 120 160 200])
colorbar
colormap jet
shading interp
c = colorbar;
c.Label.String = 'Temperature (Celsius)';
c.Label.FontSize = 18;
c.Label.Interpreter = 'latex';
%title('Temperature with gain $G = \frac{6 \alpha(0)}{10}$','fontsize',18,'interpreter','latex');
set(gca, 'clim', [12 25],'FontSize',13)
xlabel('n','fontsize',18,'interpreter','latex');
ylabel('$\Delta t$ (years)','fontsize',18,'interpreter','latex');
zlabel('Time (years)','fontsize',18,'interpreter','latex');
view(-40,10)

figure
slice(nn,yy,deltt,280*GamHatSq2,[],[],[20 40 80 120 160 200])
colorbar
colormap jet
shading interp
c = colorbar;
c.Label.String = 'CO2 (ppm)';
c.Label.FontSize = 18;
c.Label.Interpreter = 'latex';
%title('Temperature with gain $G = \frac{6 \alpha(0)}{10}$','fontsize',18,'interpreter','latex');
set(gca, 'clim', [100 500],'FontSize',13)
xlabel('n','fontsize',18,'interpreter','latex');
ylabel('$\Delta t$ (years)','fontsize',18,'interpreter','latex');
zlabel('Time (years)','fontsize',18,'interpreter','latex');
view(-40,10)
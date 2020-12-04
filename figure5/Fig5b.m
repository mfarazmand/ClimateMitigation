clc; clear

load('n3ep29v2.mat','TS');
load('n3ep29v2.mat','K');
load('n3ep29v2.mat','meantimeseries');
meantimeseries1 = meantimeseries;
load('n4ep29v2.mat','meantimeseries');
meantimeseries2 = meantimeseries;
load('n6ep29v2.mat','meantimeseries');
meantimeseries3 = meantimeseries;


load('n3ep29v2.mat','S');
S1 = S;
load('n4ep29v2.mat','S');
S2 = S;
load('n6ep29v2.mat','S');
S3 = S;

load('n3ep29v2.mat','negstd');
negstd1 = negstd;
load('n4ep29v2.mat','negstd');
negstd2 = negstd;
load('n6ep29v2.mat','negstd');
negstd3 = negstd;
load('n3ep29v2.mat','postd');
postd1 = postd;
load('n4ep29v2.mat','postd');
postd2 = postd;
load('n6ep29v2.mat','postd');
postd3 = postd;

figure
ts = TS/(K*60*60*24*365);
hold all
postd1 = 288*(meantimeseries1 + S1')- 273.15;
negstd1 = 288*(meantimeseries1 - S1')- 273.15;
postd2 = 288*(meantimeseries2 + S2')- 273.15;
negstd2 = 288*(meantimeseries2 - S2')- 273.15;
postd3 = 288*(meantimeseries3 + S3')- 273.15;
negstd3 = 288*(meantimeseries3 - S3')- 273.15;

ts = ts';
negstd1 = negstd1';
postd1 = postd1';
negstd2 = negstd2';
postd2 = postd2';
negstd3 = negstd3';
postd3 = postd3';

plot(ts,postd1,'Color',[1 0 0,0.08], 'LineWidth', 0.5,'HandleVisibility','off')
plot(ts,negstd1,'Color',[1 0 0,0.08], 'LineWidth', 0.5,'HandleVisibility','off')
patch([ts fliplr(ts)], [negstd1 fliplr(postd1)], 'r','FaceAlpha',.1)
plot(ts,288*meantimeseries1- 273.15,'k', 'LineWidth', 2,'HandleVisibility','off')

plot(ts,postd2,'Color',[0 1 0,0.08], 'LineWidth', 0.5,'HandleVisibility','off')
plot(ts,negstd2,'Color',[0 1 0,0.08], 'LineWidth', 0.5,'HandleVisibility','off')
patch([ts fliplr(ts)], [negstd2 fliplr(postd2)], 'g','FaceAlpha',.1)
plot(ts,288*meantimeseries2- 273.15,'k', 'LineWidth', 2,'HandleVisibility','off')

plot(ts,postd3,'Color',[0 0 1,0.08], 'LineWidth', 0.5,'HandleVisibility','off')
plot(ts,negstd3,'Color',[0 0 1,0.08], 'LineWidth', 0.5,'HandleVisibility','off')
patch([ts fliplr(ts)], [negstd3 fliplr(postd3)], 'b','FaceAlpha',.1)
plot(ts,288*meantimeseries3- 273.15,'k', 'LineWidth', 2)

hold off
xlim([0 200])
set(gca,'fontname','latex')
ax = gca;
ax.FontSize = 12;
% legend('$n=3$,$\Delta t = 29$','$n=4$,$\Delta t = 29$','$n=6$,$\Delta t = 29$','Mean','fontsize',18,'interpreter','latex')
xlabel('Time (years)','fontsize',18,'interpreter','latex')
ylabel('Temperature (Celsius)','fontsize',18,'interpreter','latex')
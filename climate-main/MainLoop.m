function [F1That,F1Gamhat,F2That,F2Gamhat,F3That,F3Gamhat,F4That,F4Gamhat,TermThat, TermGamhat, data,TS] = MainLoop(nRange,epRange,tau,G,hhat,CO2_0,T_0,tspanhat)
%preallocate cell array and terminal matrices
data = cell(length(nRange),length(epRange),2);

F1That = zeros(length(nRange),length(epRange));
F1Gamhat = zeros(length(nRange),length(epRange));

F2That = zeros(length(nRange),length(epRange));
F2Gamhat = zeros(length(nRange),length(epRange));

F3That = zeros(length(nRange),length(epRange));
F3Gamhat = zeros(length(nRange),length(epRange));

F4That = zeros(length(nRange),length(epRange));
F4Gamhat = zeros(length(nRange),length(epRange));

TermThat = zeros(length(nRange),length(epRange));
TermGamhat = zeros(length(nRange),length(epRange));

for i = 1:length(nRange)
n = nRange(i);
    for j = 1:length(epRange)
            ep = epRange(j);
       
            %nondimensional initial values
            tauhat = tau*1e-7;
            m = round(tauhat/hhat);
            K = 1e-7;
            
            IniGam = (CO2_0/280)*ones(m+1,1);
            IniT = (T_0/288)*ones(m+1,1);
            Ghat = G/(410*365*24*60*60*K);
            % integrate
            Sol=ClimSolv(IniGam,IniT,tspanhat,hhat,Ghat,tauhat,n,ep);
            TS = Sol(:,3);
            Gamhat = Sol(:,2);
            That = Sol(:,1);
       
            %Remove transients
            TS(1:m) = [];
            That(1:m) = [];
            Gamhat(1:m) = [];
       
            %get terminal values
            F1That(i,j) = That(ceil(end/5));
            F1Gamhat(i,j) = Gamhat(ceil(end/5));
            
            F2That(i,j) = That(ceil(2*end/5));
            F2Gamhat(i,j) = Gamhat(ceil(2*end/5));
            
            F3That(i,j) = That(ceil(3*end/5));
            F3Gamhat(i,j) = Gamhat(ceil(3*end/5));
            
            F4That(i,j) = That(ceil(4*end/5));
            F4Gamhat(i,j) = Gamhat(ceil(4*end/5));
            
            TermThat(i,j) = That(end);
            TermGamhat(i,j) = Gamhat(end);
       
            %collect data
            data{i,j,1} = That;
            data{i,j,2} = Gamhat;

    end
end
end
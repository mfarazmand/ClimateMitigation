function temp=ndEPSILON(x)
%% switch EM
EPSE=20.0;
EM1=0.53;
EM2=0.39;
T0=288;

T0hat = T0/T0;
EPSEhat = EPSE/T0;

tt=(1+tanh((x-T0hat)/EPSEhat))/2;
temp=EM1+(EM2-EM1).*tt;
end
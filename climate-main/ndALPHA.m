function temp=ndALPHA(x)
%% switch albedo
AB1=0.31;
AB2=0.2;
T1=289;
T2=295;
T0 = 288;

T1 = T1/T0;
T2 = T2/T0;

temp=AB1.*ndH(T1-x)+AB2.*ndH(x-T2)+...
    (AB1+(AB2-AB1)*(x-T1)./(T2-T1)).*ndH(x-T1).*ndH(T2-x);
end
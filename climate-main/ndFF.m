function dy = ndFF(x, Gam_delay,G,n,ep)
QG=342.0;
AT=20.5;
CT=5e8;
Gn = 150;
sigmaB=5.67e-8;
T0=288;
K = 1e-7;

%nondim parameters
QGhat = (QG)/(CT*T0*K);
AThat = (AT)/(CT*T0*K);
Gnhat = (Gn)/(CT*T0*K);
sigmaBhat = (sigmaB*T0^4)/(CT*T0*K);

tt = QGhat*(1-ndALPHA(x(1)))+AThat*log(x(2)) + Gnhat -...
    sigmaBhat*1.*x(1)^4;

dy(1) = (tt) ;
dy(2) = ndF(x(2),Gam_delay(2),x(3),G,n,ep);
dy(3) = 1;
end
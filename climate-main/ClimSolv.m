function Sol = ClimSolv(IniGam,IniT,tspan,h,G,tau,n,ep)

N = round(tspan/h);

z = zeros([N,1]);
% A is zero since we do not add noise to the transient values
m = round(tau/h);
A = zeros(m,3);
B = randn([N, 2]);

D = cat(2,B,z);

dW = cat(1,A,D);
dW = sqrt(h)*dW;
t = zeros(size(IniT));


Ini = cat(2,IniT,IniGam,t);

Sol=PCS_SDDE_1d(h,N,Ini,@ndFF,@TotNoise,dW,G,n,ep);

end
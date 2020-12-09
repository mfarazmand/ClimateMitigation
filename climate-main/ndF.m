function temp=ndF(Chat,Chat_delay,t,G,n,ep)
% soft constraints on random walk

c2 = 5.556/(365*24*60*60*410);
K = 1e-7;
yrhat = 365*24*60*60*K;

a=c2/K;
b=c2/(n*K);
delt = ep*yrhat;


IndexOfLessThan5 = t < 25*yrhat;
IndexOfGreaterThan10 = t > (delt + 25*yrhat);
IndexBtw2and5 = ~(IndexOfLessThan5 | IndexOfGreaterThan10);

p1 = IndexOfLessThan5*a;
p2 = IndexOfGreaterThan10*b;
p3 = (a*IndexBtw2and5 + (b-a)/(delt)*((t - 25*yrhat)*IndexBtw2and5));

temp =  (p1 + p2 + p3)*Chat -G*(Chat_delay);
end




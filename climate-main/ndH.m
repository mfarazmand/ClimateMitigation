function temp=ndH(x)
%% smoothed heaviside
T0 = 288;
EPSH = (3);
EPSHhat = EPSH/T0;
temp=(1+tanh(x./EPSHhat))./2.0;
end
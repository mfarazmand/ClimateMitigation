function X=PCS_SDDE_1d(h,N,X0,f,g,dW,G,n,ep)
% Predictor-corrector scheme of 
% Cao, Zhaong and Karniadakis, SIAM J. SCI. COMPUT, 2015
% f = drift, g=diffusion terms

m = length(X0)-1;

X=NaN(round(N+m+1),3);
X(1:m+1,:)=X0;

for j=m+1:N+m
%     dW = W(j+1)-W(j);
    X_bar = X(j,:) + h*f(X(j,:),X(j-m,:),G,n,ep) + g(X(j,:)).*dW(j,:);
    X(j+1,:) = X(j,:) + (h/2)*(f(X(j,:),X(j-m,:),G,n,ep)+f(X_bar,X(j-m+1,:),G,n,ep))...
        +(1/2)*(g(X(j,:))+g(X_bar)).*dW(j,:);
end
end
function [tn,yn] = rungekuttafunction(f,tid,y0,n)
%% Runge-kutta

t0 = tid(1); %starttid
tmax = tid(2); % sluttid
h = (tmax-t0)/(n-1);

tn = zeros(1,n);
yn = zeros(length(y0),n);


t = t0;
y = y0;
yn(:,1) = y;
tn(:,1) = t;

for i = 2:n

    k1 = f(t,y);
    k2 = f(t+h/2,y+h*k1/2);
    k3 = f(t+h/2,y+h*k2/2);
    k4 = f(t+h,y+h*k3);
    
    y = y + (h/6)*(k1+2*k2+2*k3+k4);
    t = t+h;
    yn(:,i) = y;
    tn(:,i) = t;

end

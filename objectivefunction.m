function a = objectivefunction(x,t,y)

f = @(t,u) [u(2); -x(3)*u(1)-0.2*u(2)+sin(t/2)];

TSPAN = [min(t) max(t)];
[Tout,YOUT] = rungekuttafunction(f,TSPAN,[x(1);x(2)],201);
[common, ~] = ismember(Tout,t);
Yout = YOUT(1,:);
Yout = Yout(common)';

% Residual between approximated ODE and measurment data
r = Yout - y;


% Minimizes the variable a to fit the data in least square sense.
a = r'*r; 

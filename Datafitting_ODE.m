%----------------------------------------------------------------------%
% Combines methods for solving ODEs with numerical optimization to 
% solve a fitting - problem. The given ODE is of the form:
%               y'' + 0.2*y' + k*y = sin(t/2)
% The program uses the Runge-Kutta method and the fminsearch matlab function 
% which uses the Nelder-Mead simplex to solve the problem.
% ---------------------------------------------------------------------%


clear all;

% data from a second order differential equation
ytilde=[-1.2373 0.3954 -0.0322 0.9921 -0.2512 0.1200 -0.0448,...
        0.4486 -0.3082 -0.2226]';
t= [0 1 3 6 10 15 21 28 36 50]';

% Approximation of variables from measurment data - [y(0); y'(0); k]
x0 = [ytilde(1); ytilde(2)-ytilde(1); 1];

% ODE rewritten to first order
u = zeros(2,1);
f = @(t,u) [u(2); -x0(3)*u(1)-0.2*u(2)+sin(t/2)];


TSPAN = [min(t) max(t)];

% Form of ODE with approximated variables
[TOUT,YOUT] = rungekuttafunction(f,TSPAN,[x0(1);x0(2)],201);

% Adjustment of variables with measurmentdata
[X,FVAL,EXITFLAG] = fminsearch(@(x) objectivefunction(x,t,ytilde),x0);

% ODE with fitted variables
ff = @(t,u) [u(2); -X(3)*u(1)-0.2*u(2)+sin(t/2)];

% Form of ODE with fitted variables
[TF,YF] = rungekuttafunction(ff,TSPAN,[X(1);X(2)],201);

figure(1);
plot(t,ytilde,'r*',TOUT,YOUT(1,:),TF,YF(1,:),'b');
legend('ODE data','Initial guess','Calculated fit')
ylabel('y(t)');
xlabel('t');
disp('y(0) = '),disp(X(1));
disp('y^(0)='),disp(X(2));
disp('k = '),disp(X(3));




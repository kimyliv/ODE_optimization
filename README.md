# ODE_optimization

The code uses the Runge-Kutta method and Nelder-Mead simplex to solve an optimization problem
for given data (tdata, ydata) and an ordinary differential equation ODE given by 
y'' + 0.2*y' + k*y = sin(t/2).

The program optimizes the variables: y'(0), y(0) and k in least square sense.



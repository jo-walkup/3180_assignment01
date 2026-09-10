%Root finding function via Newton's method
%INPUTS:
%   fun: the function we are computing the root of
%   Note that fun(x) should output [f,dfdx], where dfdx is the derivative of f
%   (see test_func01 below for example)
%   x0: initial guess for Newton's method
%   dxtol: termination threshold (stop when interval abs(x_{i+1}-x_i) < dxtol)
%   ftol: termination threshold (stop when abs(f(x_{i}))<ftol
%   max_iter: maximum iteration limit
%   dxmax: threshold for checking for a divide by zero error: 
%   terminate when abs(x_{i+1}-x_i) > dxmax, where dxmax is a very large number
%OUTPUTS
%   x: estimate for root of fun
%   exit_flag: an integer indicating whether or not the solver succeeded
function [xn, x_list] = newton_solver(fun,x0)
    xn=x0;
    x_list=[];
    while abs(fun(xn))>0.000000005

        [fn, dfn]= fun(xn);
        if abs(dfn)<0.000000000000000000000005
            return
        end
        xn1= xn- fn/dfn;
        x_list=[x_list, xn];
        xn=xn1;

        if abs(xn1-xn)<1*10^-14 && abs(fun(xn))<1*10^-14
            return
        end
    end 
   
    return;
end

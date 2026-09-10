%Root finding function via secant method

function [xn,x_list] = secant_solver(fun,x0, x1)
    xn2=x0;
    xn1=x1;
    xn = xn1;
    x_list=[];
    x1_list=[];

    fn1=fun(xn1);
    fn2=fun(xn2);

    while abs(fn1)>1*10^-14
      
        if abs(fun(xn1)-fun(xn2))<1e-6
            return
        end
        xn = xn1-fn1*((xn1-xn2)/(fn1-fn2));

        fnext=fun(xn);
        x_list=[x_list, xn];
        % x1_list=[x1_list, xn1];

        xn2=xn1;
        xn1=xn;
        fn2=fn1;
        fn1= fnext;
        
        if abs(xn1-xn)<(1*10^-14) && abs(fun(xn))<(1*10^-14)
            return
        end
    end 
 
    return;
end
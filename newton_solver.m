function [xn, x_list] = newton_solver(fun,x0)

    xn = x0;
    x_list = [];

    max_iter = 100;

    for i = 1:max_iter

        [fn, dfn] = fun(xn);

        if abs(fn) < 5e-9
            return
        end

        if abs(dfn) < 5e-24
            return
        end

        xn1 = xn - fn/dfn;
        x_list = [x_list, xn];

        if abs(xn1-xn) < 1e-14 && abs(fn) < 1e-14
            xn = xn1;
            return
        end

        if abs(xn1-xn) > 1e6
            return
        end

        xn = xn1;

    end

end
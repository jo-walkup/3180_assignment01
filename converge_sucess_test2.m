function converge_sucess_test2()

    close all

    % Plot the sigmoid function
    % xvals = linspace(-50,50,201);
    % [yvals,~] = test_func03(xvals);
    % 
    % figure
    % hold on
    % 
    % axis([-15,40,-8,8]);
    % xlabel('x');
    % ylabel('y');
    % title('Newton Method');

    x_guess = linspace(1,50,1000);

    successful = [];
    failed = [];

    for i = 1:length(x_guess)

        [x_root, ~] = bisection_solver(@test_func03,x_guess(i), x_guess(i)+1);

        [f_root,~] = test_func03(x_root);

        if abs(f_root) < 5e-9
            successful(end+1) = x_guess(i);
        else
            failed(end+1) = x_guess(i);
        end

    end

    [fs,~] = test_func03(successful);
    [ff,~] = test_func03(failed);

    scatter(successful,fs,20,'b.');
    scatter(failed,ff,20,'r.');

    legend('Successful','Failed');

end

%Example sigmoid function
function [f_val,dfdx] = test_func03(x)
    a = 27.3; b = 2; c = 8.3; d = -3;
    H = exp((x-a)/b);
    dH = H/b;
    L = 1+H;
    dL = dH;
    f_val = c*H./L+d;
    dfdx = c*(L.*dH-H.*dL)./(L.^2);
end
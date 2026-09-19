function converge_sucess_test2()
    % 
    % close all
    % 
    % % Plot the sigmoid function
    % % xvals = linspace(-50,50,201);
    % % [yvals,~] = test_func03(xvals);
    % % 
    % % figure
    % % hold on
    % % 
    % % axis([-15,40,-8,8]);
    % % xlabel('x');
    % % ylabel('y');
    % % title('Newton Method');
    % 
    % xleft = 1:50;
    % xright = 1:50;
    % [Xleft, Xright] = meshgrid(xleft, xright)
    % successful = [];
    % failed = [];
    % 
    % % for i = 1:length(x)*length(y)
    % % 
    % %     [x_root, ~] = bisection_solver(@test_func03,X(i), Y(i));
    % % 
    % %     [f_root,~] = test_func03(x_root);
    % % 
    % %     if abs(f_root) < 5e-9
    % %         successful(end+1) = X(i);
    % %     else
    % %         failed(end+1) = Y(i);
    % %     end
    % % 
    % % end
    % 
    % root = bisection_solver(@test_func03, 26, 27)
    % successful = (Xleft < root) & (Xright > root)
    % failed = ~successful;
    % 
    % [fs,~] = test_func03(successful);
    % [ff,~] = test_func03(failed);
    % 
    % scatter(failed,ff,20,'r.'); hold on
    % scatter(successful,fs,20,'b.');
    % 
    % legend('Successful','Failed');







    clc;
clear;
close all;

% Root
root = bisection_solver(@test_func03, 26, 27);

% Values for x_left and x_right
x = linspace(0, 50, 100);

% Create grid of all possible endpoint combinations
[x_left, x_right] = meshgrid(x, x);

% Successful bisection brackets
success = ((x_left < root) & (x_right > root)) | ((x_right < root) & (x_left > root));

% Failed brackets
failed = ~success;

% Create figure
figure;
hold on;

% Plot failed points in red
scatter(x_left(failed), x_right(failed), 8, 'r', 'filled');

% Plot successful points in blue
scatter(x_left(success), x_right(success), 8, 'b', 'filled');

% Plot root boundaries
xline(root, 'k--', 'LineWidth', 1.5);
yline(root, 'k--', 'LineWidth', 1.5);

% Plot root
scatter(root, root, 150, 'g', 'filled');

% Formatting
xlim([0 50]);
ylim([0 50]);

xlabel('Left x guess (-)');
ylabel('Right x guess (-)');
t = title('Initial guess convergence for bisection method (sigmoid function)');
t.Position(2) = t.Position(2) + 0.5

grid on;
axis square;

% Legend
legend('Failed', 'Success', 'Root', 'Location', 'northeast');

saveas(gcf, "bisection_sigmoid.png")
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
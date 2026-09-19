function converge_success_2guesses()
    clc;
    clear;
    close all;
    
    % Root
    root = bisection_solver(@test_func03, 26, 27);
    
    % Values for x_left and x_right
    x = linspace(0, 50, 1000);
    
    % Create grid of all possible endpoint combinations
    [x_left, x_right] = meshgrid(x, x);

    sleft = [];
    sright = [];
    fleft = [];
    fright = [];
    for i = 1:length(x)*length(x)
        [x_root, ~] = bisection_solver(@test_func03, x_left(i), x_right(i));

        if abs(x_root-root)<0.0003
            sleft=[sleft, x_left(i)];
            sright = [sright, x_right(i)];
        else
            fleft=[fleft, x_left(i)];
            fright=[fright, x_right(i)];
        end
    end

    
    % Create figure
    figure;
    hold on;
    
    % Plot failed points in red
    scatter(fleft, fright, 8, 'r', 'filled');
    
    % Plot successful points in blue
    scatter(sleft, sright, 8, 'b', 'filled');
    
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

function [f_val,dfdx] = test_func03(x)
    a = 27.3; b = 2; c = 8.3; d = -3;
    H = exp((x-a)/b);
    dH = H/b;
    L = 1+H;
    dL = dH;
    f_val = c*H./L+d;
    dfdx = c*(L.*dH-H.*dL)./(L.^2);
end
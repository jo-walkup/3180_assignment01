function converge_sucess_test()
    close all
    xvals = linspace(-50,50,201);
    [yvals,~] = test_func03(xvals);


    hold on
 
    axis([-15,40,-50,80]);
    plot(xvals,yvals,'r','linewidth',2);
    plot(xvals,0*xvals,'k--','linewidth',1);
    xlabel('x'); ylabel('y'); title('Test Function 3');
  
    x_left=linspace(1,23,1000);
    x_right=linspace(27,50,1000);

    total_x_roots=[];

    [x, y]=meshgrid(x_left, x_right);

    % en_list=[];
    % en1_list=[];
    % index_list = []; %line 36
    % figure()
    
    for i=1:length(x_left)*length(x_right)

    [x_root, ~] = bisection_solver(@test_func03,x_left(i),x_right(i));
    
    total_x_roots=[total_x_roots, x_root]

    % en=abs(x_list-x_sol);
    % en1=abs(x_listn-x_sol);
    % en_list=[en_list,en];
    % en1_list=[en1_list,en1];
    % 
    % index_list = [index_list,1:length(en)];
    % 
    % end
    % 
    % x_regression = []; % e_n
    % y_regression = []; % e_{n+1}
    % filter_list = [1e-15, 1e-2, 1e-14, 1e-2, 2];
    % % iterate through the collected data
    % for n=1:length(index_list)
    % 
    %     if en_list(n)>filter_list(1) && en_list(n)<filter_list(2) && ...
    %     en1_list(n)>filter_list(3) && en1_list(n)<filter_list(4) && ...
    %     index_list(n)>filter_list(5)
    %     %then add it to the set of points for regression
    %     x_regression(end+1) = en_list(n);
    %     y_regression(end+1) = en1_list(n);
    %     end
    end

    hold off; 


    % loglog(en_list,en1_list,'r.', 'MarkerSize',5 ); hold on
    % loglog(x_regression,y_regression,'b.', 'MarkerSize',5);
    
    scatter(x,y, "r")
    title("Bisection Method Error")
    xlabel('x')
    ylabel('x')

end

% compute root at begining and then check all guesse agaisnt that 
% x,y=
% meshgrid(x_range,y_range)

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
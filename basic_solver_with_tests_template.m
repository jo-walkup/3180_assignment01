%template for testing your basic root finding implementations
function basic_solver_with_tests_template()
    xvals = linspace(-50,50,201);
    [yvals,~] = test_func01(xvals);

    % hold on
    % axis([-15,40,-50,80]);
    % plot(xvals,yvals,'r','linewidth',2);
    % plot(xvals,0*xvals,'k--','linewidth',1);
    % xlabel('x'); ylabel('y'); title('Test Function 1');

    % %Newton's method example test
    % 
    % x0_guess = linspace(1,3.5,1000);
    % en_list=[];
    % en1_list=[];
    % index_list = []; %line 36
    % figure()
    % 
    % 
    % for i=1:1000
    % 
    % 
    %     [x_sol, xs_list, xs1_list] = newton_solver(@test_func01,x0_guess(i));  
    % 
    % 
    %     en=abs(xs_list-x_sol);
    %     en1=abs(xs1_list-x_sol);
    %     en_list=[en_list,en];
    %     en1_list=[en1_list,en1];
    % 
    %     index_list = [index_list,1:length(en)]; %line 54
    % 
    % end
    %     x_regression = []; % e_n
    %     y_regression = []; % e_{n+1}
    %     filter_list = [1e-15, 1e-2, 1e-14, 1e-2, 2];
    %     % iterate through the collected data
    %     for n=1:length(index_list)
    %     %if the error is not too big or too small
    %     %and it was enough iterations into the trial...
    %         if en_list(n)>filter_list(1) && en_list(n)<filter_list(2) && ...
    %         en1_list(n)>filter_list(3) && en1_list(n)<filter_list(4) && ...
    %         index_list(n)>filter_list(5)
    %             %then add it to the set of points for regression
    %             x_regression(end+1) = en_list(n);
    %             y_regression(end+1) = en1_list(n);
    %         end
    % 
    %     end
    % 
    % 
    %  % plot(x0_guess,test_func01(x0_guess),'bo','markerfacecolor','b','markersize',5);
    %  % 
    %  % 
    %  % plot(x_sol,test_func01(x_sol),'go','markerfacecolor','g','markersize',5);
    %  loglog(en_list,en1_list,'r.', 'MarkerSize',5 ); hold on
    %  loglog(x_regression,y_regression,'b.', 'MarkerSize',5);
    %  [p,k] = generate_error_fit(x_regression,y_regression);
    % % 
    % %example for how to plot fit line
    % %generate x data on a logarithmic range
    % fit_line_x = 10.^[-16:.01:1];
    % %compute the corresponding y values
    % fit_line_y = k*fit_line_x.^p;
    % %plot on a loglog plot.
    % loglog(fit_line_x,fit_line_y,'k-','linewidth',1)
    % 
    % title("Newton's Method Error")
    % xlabel('\epsilon_{n}')
    % ylabel('\epsilon_{n+1}')
    % legend("Raw Data", "Filtered Data", "Line of Best Fit")

    %Secant method example test
    % x0_guess = -5;
    % x1_guess = 2;
    % plot(x0_guess,test_func01(x0_guess),'bo','markerfacecolor','b','markersize',5);
    % plot(x1_guess,test_func01(x1_guess),'ko','markerfacecolor','k','markersize',5);
    % 
    % x_sol = secant_solver(@test_func01,x0_guess,x1_guess);
    % plot(x_sol,test_func01(x_sol),'go','markerfacecolor','g','markersize',5);

    
    % % Bisection method example test
    % x_left=linspace(-7,-0.2,1000);
    % x_right=linspace(0.2,7,1000);
    % 
    % en_list=[];
    % en1_list=[];
    % index_list = []; %line 36
    % figure()
    % 
    % 
    % for i=1:1000
    % 
    % 
    % % plot(x_left(i),test_func01(x_left(i)),'bo','markerfacecolor','b','markersize',5);
    % % plot(x_right(i),test_func01(x_right(i)),'ko','markerfacecolor','k','markersize',5);
    % 
    % [x_sol, x_list, x_listn] = bisection_solver(@test_func01,x_left(i),x_right(i));
    % %plot(x_sol,test_func01(x_sol),'go','markerfacecolor','g','markersize',5);
    % 
    % 
    % en=abs(x_list-x_sol);
    % en1=abs(x_listn-x_sol);
    % en_list=[en_list,en];
    % en1_list=[en1_list,en1];
    % 
    % index_list = [index_list,1:length(en)]; %line 54
    % 
    % end
    % 
    % %example for how to filter the error data
    % %currently have error_list0, error_list1, index_list
    % %data points to be used in the regression
    % 
    % 
    % x_regression = []; % e_n
    % y_regression = []; % e_{n+1}
    % filter_list = [1e-15, 1e-2, 1e-14, 1e-2, 2];
    % % iterate through the collected data
    % for n=1:length(index_list)
    % %if the error is not too big or too small
    % %and it was enough iterations into the trial...
    %     if en_list(n)>filter_list(1) && en_list(n)<filter_list(2) && ...
    %     en1_list(n)>filter_list(3) && en1_list(n)<filter_list(4) && ...
    %     index_list(n)>filter_list(5)
    %     %then add it to the set of points for regression
    %     x_regression(end+1) = en_list(n);
    %     y_regression(end+1) = en1_list(n);
    %     end
    % end
    % 
    % loglog(en_list,en1_list,'r.', 'MarkerSize',5 ); hold on
    % loglog(x_regression,y_regression,'b.', 'MarkerSize',5);
    % 
    % [p,k] = generate_error_fit(x_regression,y_regression)
    % 
    % %example for how to plot fit line
    % %generate x data on a logarithmic range
    % fit_line_x = 10.^[-16:.01:1];
    % %compute the corresponding y values
    % fit_line_y = k*fit_line_x.^p;
    % %plot on a loglog plot.
    % loglog(fit_line_x,fit_line_y,'k-','linewidth',2)
    % 
    % title("Bisection Method Error")
    % xlabel('\epsilon_{n}')
    % ylabel('\epsilon_{n+1}')
    % legend("Raw Data", "Filtered Data", "Line of Best Fit")


end

%example for how to compute the fit line
%data points to be used in the regression
%x_regression -> e_n
%y_regression -> e_{n+1}
%p and k are the output coefficients

function [p,k] = generate_error_fit(x_regression,y_regression)
%generate Y, X1, and X2
%note that I use the transpose operator (')
%to convert the result from a row vector to a column
%If you are copy-pasting, the ' character may not work correctly
Y = log(y_regression)';
X1 = log(x_regression)';
X2 = ones(length(X1),1);
%run the regression
coeff_vec = regress(Y,[X1,X2]);
%pull out the coefficients from the fit
p = coeff_vec(1);
k = exp(coeff_vec(2));
end

%Definition of the test function and its derivative (as a single function):
%This definition uses the function keyword
%when passing this function as an argument to a solver,
%you'll need to use the handle operator
%ex. solver(@test_func01,x_guess)

function [fval,dfdx] = test_func01(x)
    fval = (x.^3)/100 - (x.^2)/8 + 2*x + 6*sin(x/2+6) -.7 - exp(x/6);
    dfdx = 3*(x.^2)/100 - 2*x/8 + 2 +(6/2)*cos(x/2+6) - exp(x/6)/6;
end


function [x,x_list, x_listn] = bisection_solver(fun,x_left,x_right)
    x_mid=(x_left+x_right)/2;
    x_list=[];
    x_listn=[];
    if (fun(x_left)<0 && fun(x_right)>0) || (fun(x_left)>0 && fun(x_right)<0)

        while abs(fun(x_mid))>(1*10^-14)
            
            if fun(x_left)>0 && fun(x_mid)<0 || fun(x_left)<0 && fun(x_mid)>0
                x_right=x_mid;
    
            else 
                x_left=x_mid;
            end
            
            x=x_mid;
            x_list(end+1)=x;
            
            x_mid=(x_left+x_right)/2;
            x_listn(end+1)=x_mid;
    
            if abs(x-x_mid)<1*10^-14 && abs(fun(x_mid))<1*10^-14
                return
            end
        end 
    else
        x=0;
        return
    end
   
    return;
end

%Note that fun(x) should output [f,dfdx], where dfdx is the derivative of f
function [xn, x_list, x1_list] = newton_solver(fun,x0)
    xn=x0;
    x_list=[];
    x1_list=[];
    while abs(fun(xn))>0.000000005

        [fn, dfn]= fun(xn);
        if abs(dfn)<0.000000000000000000000005
            return
        end
        xn1= xn- fn/dfn;
        x_list=[x_list, xn];
        x1_list=[x1_list, xn1];
        xn=xn1;

        if abs(xn1-xn)<1*10^-14 && abs(fun(xn))<1*10^-14
            return
        end
    end 
   
    return;
end

function xn = secant_solver(fun,x0, x1)
    xn2=x0;
    xn1=x1;
    xn = xn1;
    while abs(fun(xn))>1*10^-14

        if abs(fun(xn1)-fun(xn2))<0.000000000000000000000005
            return
        end
        xn = xn1-fun(xn1)*((xn1-xn2)/(fun(xn1)-fun(xn2)));
        xn2=xn1;
        xn1=xn;

        if abs(xn1-xn)<1*10^-14 && abs(fun(xn))<1*10^-14
            return
        end
    end 
 
    return;
end





function converge_sucess_test()
    close all
    xvals = linspace(-50,50,201);
    [yvals,~] = test_func03(xvals);


    % hold on
 
    % axis([-15,40,-50,80]);
    % plot(xvals,yvals,'r','linewidth',2);
    % plot(xvals,0*xvals,'k--','linewidth',1);
    % xlabel('x'); ylabel('y'); title('Test Function 3');
  
    
    s=[];
    f=[];

    newton_guess = linspace(1,50,1000);

    for i = 1:length(newton_guess)
        [x_root, ~] = fzero_solver(@test_func03,newton_guess(i));
        
        if abs(x_root-26.1618)<0.0003
            s=[s, newton_guess(i)];
        else
            f=[f,newton_guess(i)];

        end
    end   

    [fs,~] = test_func03(s);
    [ff,~] = test_func03(f);
    
    plot(s,fs, "b."); hold on
    plot(f,ff,"r.")
    plot(26.1618, 0, "k.", "MarkerSize", 20)
    plot(0:50, (0:50)*0, "k--")
    xlabel("Input x")
    ylabel("Output f(x)")
    legend("Converging guesses", "Diverging guesses", "Root", "Location", "northwest")
    title("Newton's Method Guess Convergence Plot")

    % fail = [];
    % faily = [];
    % success = [];
    % successy = [];
    % length(total_x_roots)
    % 
    % 
    % for i = 1:length(total_x_roots)
    %     root = total_x_roots(i)
    %     if root == 0
    %         disp("wtf")
    %         fail = [fail, root];
    %         faily = [faily, i];
    %     else
    %         disp("help")
    %         root
    %         success(end+1) = root;
    %         successy = [successy, i];
    %     end
    % end
    % success
    % successy
    % fail;

    % axis([-15,40,-50,80]);
    % % plot(fail,faily,'r','linewidth',2); hold on
    % plot(success,successy,'b*','linewidth',2); hold on
    % plot(xvals,yvals,'r','linewidth',2);
    % plot(xvals,0*xvals,'k--','linewidth',1);
    % 
    % xlabel('x'); ylabel('y'); title('Test Function 3');
    % % loglog(en_list,en1_list,'r.', 'MarkerSize',5 ); hold on
    % % loglog(x_regression,y_regression,'b.', 'MarkerSize',5);
    % figure();
    % scatter(x,y, "r")
    % title("Bisection Method Error")
    % xlabel('x')
    % ylabel('x')

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
%INPUTS:
%solver_flag: an integer from 1-4 indicating which solver to use
% 1->Bisection 2-> Newton 3->Secant 4->fzero
%fun: the mathematical function that we are using the
% solver to compute the root of
%x_guess0: the initial guess used to compute x_root
%guess_list1: a list of initial guesses for each trial
%guess_list2: a second list of initial guesses for each trial
% if guess_list2 is not needed, then set to zero in input
%filter_list: a list of constants used to filter the collected data
function convergence_analysis(solver_flag, fun, ...
    x_guess0, guess_list1, guess_list2, filter_list)
    en_list=[];
    en1_list=[];
    index_list = [];
    % run the solver
    switch solver_flag
        case 1
            for i=1:1000
                [x_sol, x_list] = bisection_solver(fun, guess_list1(i), guess_list2(i));
                en=abs(x_list(1:end-1)-x_sol);
                en1=abs(x_list(2:end)-x_sol);
                en_list=[en_list,en];
                en1_list=[en1_list,en1];
                index_list = [index_list,1:length(en)];
            end
            method = "Bisection";
        case 2
            for i=1:1000
                [x_root, x_list] = newton_solver(fun, guess_list1(i)); 
                en=abs(x_list(1:end-1)-x_root);
                en1=abs(x_list(2:end)-x_root);
                en_list=[en_list,en];
                en1_list=[en1_list,en1];
                index_list = [index_list,1:length(en)];
            end
            method = "Newton's";
        case 3
            for i=1:1000
                [x_root, x_list] = secant_solver(fun, guess_list1(i), guess_list2(i));
                en=abs(x_list(1:end-1)-x_root);
                en1=abs(x_list(2:end)-x_root);
                en_list=[en_list,en];
                en1_list=[en1_list,en1];
                index_list = [index_list,1:length(en)];
            end
            method = "Secant";
        case 4
            for i=1:1000
                [x_root, x_list] = input_recorder_example(fun, guess_list1(i));
                en=abs(x_list(1:end-1)-x_root);
                en1=abs(x_list(2:end)-x_root);
                en_list=[en_list,en];
                en1_list=[en1_list,en1];
                index_list = [index_list,1:length(en)];
            end
            method = "fzero";
    end

    % compute error
    x_regression = []; % en
    y_regression = []; % en1
    for n=1:length(index_list)
        if en_list(n)>filter_list(1) && en_list(n)<filter_list(2) && ...
        en1_list(n)>filter_list(3) && en1_list(n)<filter_list(4) && ...
        index_list(n)>filter_list(5)
            x_regression(end+1) = en_list(n);
            y_regression(end+1) = en1_list(n);
        end
    end

    % plot
    plot_error(en_list, en1_list, x_regression, y_regression, method)
end
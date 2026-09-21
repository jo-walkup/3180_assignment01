function plot_error(en_list, en1_list, x_regression, y_regression, method)
    set(groot, 'defaultTextInterpreter', 'latex');
    set(groot, 'defaultAxesTickLabelInterpreter', 'latex');
    set(groot, 'defaultLegendInterpreter', 'latex');
    loglog(en_list,en1_list,'r.', 'MarkerSize',5 ); hold on
    loglog(x_regression,y_regression,'b.', 'MarkerSize',5);

    [p,k] = generate_error_fit(x_regression,y_regression)
    fit_line_x = 10.^[-16:.01:1];
    fit_line_y = k*fit_line_x.^p;
    loglog(fit_line_x,fit_line_y,'k-','linewidth',1)
    
    plot_name = "Error convergence of " + method + " method with fit"
    title(plot_name)
    xlabel('Error at current iteration (-)')
    ylabel('Error at next iteration (-)')
    legend("Raw Data", "Filtered Data", "Line of Best Fit", "Location", "northwest")
    axis([10e-17,10e0,10e-17,10e0])
    gca.FontSize = 15;
    
    filename = method + "error.png";
    saveas(gcf, filename);
end
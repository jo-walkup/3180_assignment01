function plot_error(en_list, en1_list, x_regression, y_regression, method)
    loglog(en_list,en1_list,'r.', 'MarkerSize',5 ); hold on
    loglog(x_regression,y_regression,'b.', 'MarkerSize',5);

    [p,k] = generate_error_fit(x_regression,y_regression)
    fit_line_x = 10.^[-16:.01:1];
    fit_line_y = k*fit_line_x.^p;
    loglog(fit_line_x,fit_line_y,'k-','linewidth',1)

    title(method, " Method Error")
    xlabel('\epsilon_{n}')
    ylabel('\epsilon_{n+1}')
    legend("Raw Data", "Filtered Data", "Line of Best Fit", "Location", "northwest")
    axis([10e-20,10e0,10e-20,10e0])
end
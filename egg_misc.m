function egg_misc()

    %set the oval hyper-parameters
    egg_params = struct();
    egg_params.a = 3; egg_params.b = 2; egg_params.c = .15;
    %specify the position and orientation of the egg
    x0 = 5; y0 = 5; theta = pi/6;
    %wrapper function that calls egg_wrapper1
    %but only takes s as an input (other inputs are fixed)
    %(single input)
    egg_wrapperx2 = @(s) egg_wrapperx1(s,x0,y0,theta,egg_params);
    egg_wrappery2 = @(s) egg_wrappery1(s,x0,y0,theta,egg_params);
    
    
    [V_list, G_list] = egg_func(linspace(0,1,100),x0,y0,theta,egg_params);
    %plot the perimeter of the egg
    plot(V_list(1,:),V_list(2,:),'k'); hold on
    
    %compute the value of s for which the corresponding point on the oval
    %has an x-coordinate of zero
    % hold on
    % vs=[];
    % for s_guess = [0,.25]
    %     s_root = secant_solver(egg_wrapper2,s_guess,s_guess+.01);
    % 
    %     [V, G] = egg_func(s_root,x0,y0,theta,egg_params);
    %     vs=[vs, V];
    %     plot(V(1), V(2), "ro"); % results from s_root hold on
    % end
    % 
    % vright=max(vs(1,:));
    % vleft=min(vs(1,:)); hold on
    % 
    % plot(ones(10)*vleft, linspace(0,10, 10), "b-")
    % plot(ones(10)*vright, linspace(0,10, 10), "b-")
    
    vy=[];
    vx=[];
    
    for s_guess = [0,0.25,0.5,0.75,1]
        s_rootx = secant_solver(egg_wrapperx2,s_guess,s_guess+.01);
        s_rooty = secant_solver(egg_wrappery2,s_guess,s_guess+.01);
        
        [V, G] = egg_func(s_rootx,x0,y0,theta,egg_params);
        vy=[vy, V]
        plot(V(1), V(2), "ro"); % results from s_root hold on

        [V, G] = egg_func(s_rooty,x0,y0,theta,egg_params);
        vx=[vx, V]
        plot(V(1), V(2), "ro"); % results from s_root hold on
    end
    
 
    [vrx, coly]=max(vy(1,:));
    vry = vy(2, coly);
    [vlx,coly]=min(vy(1,:));
    vly = vy(2, coly);
    [vtx, coly] =max(vx(1,:));
    vty = vx(2, coly);
    [vbx, coly]=min(vx(1,:));
    vby = vx(2, coly);
    
    

    hold on

    xs = [vlx, vlx, vrx, vrx];
    ys = [vby, vty, vty, vby];

    plot(xs([1:end 1]), ys([1:end 1]), '-b', 'LineWidth', 2);
    % for i=1:4
    %     line(xs(i), ys(1))
    % end
    % plot(ones(vheight)*vleft, linspace(0,vbottom, vtop), "b-")
    % plot(ones(vheight)*vright, linspace(0,vbottom, vtop), "b-")
    % plot(ones(vlength)*vbottom, linspace(0,vleft, vright), "b-")
    % plot(ones(vlength)*vtop, linspace(0,vleft, vright), "b-")
    
    % plot(Vleft(1),Vleft(2), "bo")
    title("secant solver results??")
    axis equal; axis square
    axis([0,12,0,12])


end



%wrapper function that calls egg_func
%and only returns the x coordinate of the
%point on the perimeter of the egg
%(single output)

function x_out = egg_wrapperx1(s,x0,y0,theta,egg_params)
    [V, G] = egg_func(s,x0,y0,theta,egg_params);
    x_out = G(1);
end

%wrapper function that calls egg_func
%and only returns the x coordinate of the
%point on the perimeter of the egg
%(single output)

function x_out = egg_wrappery1(s,x0,y0,theta,egg_params)
    [V, G] = egg_func(s,x0,y0,theta,egg_params);
    x_out = G(2);
end


%Function that computes the bounding box of an oval
%INPUTS:
%theta: rotation of the oval. theta is a number from 0 to 2*pi.
%x0: horizontal offset of the oval
%y0: vertical offset of the oval
%egg_params: a struct describing the hyperparameters of the oval
%OUTPUTS:
%x_range: the x limits of the bounding box in the form [x_min,x_max]
%y_range: the y limits of the bounding box in the form [y_min,y_max]
function [x_range,y_range] = compute_bounding_box(x0,y0,theta,egg_params)
%your code here
end
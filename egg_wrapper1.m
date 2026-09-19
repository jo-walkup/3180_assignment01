%wrapper function that calls egg_func
%set the oval hyper-parameters
egg_params = struct();
egg_params.a = 3; egg_params.b = 2; egg_params.c = .15;
%specify the position and orientation of the egg
x0 = 5; y0 = 5; theta = 20;
%Example parabolic trajectory

function [x0,y0,theta] = egg_trajectory01(t)
x0 = 7*t + 8;
y0 = -6*t.^2 + 20*t + 6;
theta = pi/(5*t);
end

[x_range,y_range] = compute_bounding_box(x0,y0,theta,egg_params);

y_ground=0;
x_wall=15;

[t_ground,t_wall] = collision_func(@egg_trajectory01, egg_params, y_ground, x_wall);

[x0,y0,theta] = egg_trajectory01(t_ground);

[V_list, G_list] = egg_func(linspace(0,1,100),x0,y0,theta,egg_params);
    %plot the perimeter of the egg
figure

plot(V_list(1,:),V_list(2,:),'k');
axis([30 40 -20 0])
%Function that computes the collision time for a thrown egg
%INPUTS:
%traj_fun: a function that describes the [x,y,theta] trajectory
% of the egg (takes time t as input)
%egg_params: a struct describing the hyperparameters of the oval
%y_ground: height of the ground
%x_wall: position of the wall
%OUTPUTS:
%t_ground: time that the egg would hit the ground
%t_wall: time that the egg would hit the wall
function [t_ground,t_wall] = collision_func(traj_fun, egg_params, y_ground, x_wall)
    t=0;
    t_ground=0;
    t_wall=0;
    while t_ground==0
       [x0, y0, theta] = traj_fun(t);
       [x_range,y_range] = compute_bounding_box(x0,y0,theta,egg_params);
       
       f(t) = @(t) y_range_bottom(t) - y_ground;

       [x, ~]=secant_solver(f(t), );
       t_ground=x;
           return
       end 

     
       t=t+0.1;
end 


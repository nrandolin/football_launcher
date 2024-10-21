% football parameters
polar_moment = 0.0501*0.1; % polar moment of inertia: kg*m^2
a0 = 0.089; 
b0 = 0.089;
c0 = 0.1395;
a1 = 0.085;
b1 = 0.085;
c1 = 0.136;
leather_density = 1000;
mass = leather_density*(4/3)*pi*(a0*b0*c0 - a1*b1*c1)*0.1;

% launcher parameters
omega_w1 = 100; % wheel 1 angular velocity: rad/s
omega_w2 = 100; % wheel 2 angular velocity: rad/s
r_wheel = 0.125; % radius of wheels: meters
angle_w1 = 20; % angle between wheel and horizontal: deg
angle_w2 = -20; % angle between wheel and horizontal: deg
efficiency = 0.8; % efficiency due to slip/friction
angle_launch = 30; % angle that ball is launched: deg
cont_time = 0.1; % contact time: sec


v_w1 = omega_w1 * r_wheel; % wheel 1 linear velocity: m/s
v_w2 = omega_w2 * r_wheel; % wheel 2 linear velocity: m/s
v_ball = sqrt(((v_w1*cosd(angle_w1) + v_w2*cosd(angle_w2))*efficiency)^2 ...
    + ((v_w1*sind(angle_w1) + v_w2*sind(angle_w2))*efficiency)^2); % velocity of ball: m/s
dist_traveled = (v_ball^2*sind(2*angle_launch))/9.81; % distance traveled: m
v_ball_1 = sqrt((v_ball*cosd(angle_w1))^2 ...
    + (v_ball*sind(angle_w1))^2); % velocity imparted on ball from wheel 1: m/s
v_ball_2 = sqrt((v_ball*cosd(angle_w2))^2 ...
    + (v_ball*sind(angle_w2))^2); % velocity imparted on ball from wheel 2: m/s
force_1 = mass*v_ball_1/cont_time*sind(angle_w1); % y force from wheel 1 on ball: N
force_2 = mass*v_ball_2/cont_time*sind(angle_w2); % y force from wheel 2 on ball: N
omega_ball = (cont_time*(abs(force_1)*r_wheel ...
    + abs(force_2*r_wheel)))/polar_moment; % angular velocity of ball: rad/s
rpm = omega_ball/(2*pi)*60; % rpm of ball





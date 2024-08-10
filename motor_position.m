clc;
clear;
close; 
J = 3.2284E-6;
b = 3.5077E-6;
K = 0.0274;
R = 4;
L = 2.75E-6;
s = tf('s');
P_motor = K/(s*((J*s+b)*(L*s+R)+K^2));
Kp =1;
C = Kp;
sys_cl = feedback(C*P_motor,1);

t = 0:0.001:0.2;
figure(1)
step(sys_cl,t)
axis([0 0.2 0 1.8])
ylabel('Position, \theta (radians)')
title('Response to a Step Reference with Different Values of K_p')
Kp =1;
C = Kp;
dist_cl = feedback(P_motor,C);
figure(2)
step(dist_cl, t)
axis([0 0.2 0 1.2])
ylabel('Position, \theta (radians)')
figure(1);
title('Response to a Step Disturbance with Different Values of K_p')
Kp = 25;
Ki = 100;
C= Kp + Ki/s;
sys_cl = feedback(C*P_motor,1);
t = 0:0.001:0.30;
figure(3)
subplot(1,2,2)
subplot(1,2,1)
step(sys_cl, t);
axis([0 0.3 0 2])
ylabel('Position, \theta (radians)');
figure(2);
title('Step Reference Response'); 
subplot(1,2,2)
dist_cl = feedback(P_motor,C);
step(dist_cl, t)
axis([0 0.2 0 0.1])
ylabel('Position, \theta (radians)')
figure(3);
title('Step Disturbance Response')
stepinfo(sys_cl(:,:,2))

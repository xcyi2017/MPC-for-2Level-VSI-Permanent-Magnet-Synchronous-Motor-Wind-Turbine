%% Model Parameters
clear all;
close all;

N=22.5; %rpm rated speed,the generator will works at its maximum rated speed
r=22.9;  %m radius of the rotor
Cp_op=0.43;
Cp_min=0.32;
Cp_max=0.52; %min and max values of the power coefficient change the reference power of the generator if to beused



ri=0.1;  % Grid side converter harmonic filter resistance
Ts=1e-4;%data sampling time
step_size=1/Ts;

w_g=N*pi/30; % mechanical speed
T=1/(2*pi*w_g);
% generator is 26 pole pair machine hence: w_g_e=w_g*26; the electrical
% speed equivalent
Theta=zeros();
for k=0:1:(step_size-1)
    Theta(k+1)=k*Ts*w_g;
end

Li= 0.16e-3; % Grid side converter harmonic filter inductance

open_system('electrical_model.slx'); 

% A11=(1-ri*Ts)/Li;
% A12=w_g*Ts;
% A21=-A12;
% A22=A11;
% 
% B11=Ts/Li;
% B22=B11;
% B12=0;
% B21=0;

% %% Voltage vectoral representation in dq frame
% 
% A=[A11 A12; A21 A22];
% B=[B11 B12; B21 B22];
% T_dq=zeros(2,2);
% s=zeros(3,1,8);
% v=zeros(2,1);
% Vc=690;
% 
% s(:,:,1)=[0; 0; 0];
% s(:,:,2)=[1; 0; 0];
% s(:,:,3)=[1; 1; 0];
% s(:,:,4)=[0; 1; 0];
% s(:,:,5)=[0; 1; 1];
% s(:,:,6)=[0; 0; 1];
% s(:,:,7)=[1; 0; 1];
% s(:,:,8)=[1; 1; 1];
% 
% for m=0:9999
%     T_dq(:,:,m+1)=[cos(Theta(m+1)) sin(Theta(m+1)); -sin(Theta(m+1)) cos(Theta(m+1))];
%     Tabc=2/3*[1 -0.5 -0.5; 0 sqrt(3)*0.5 -1*sqrt(3)*0.5];
%     v(:,:,m+1)=Vc*T_dq(m+1)*Tabc*sw(:,:,m);  % Vdand Vq voltages in state space representation
% end
% 
% %% Current vectoral representation in dq frame
% 
% sys=ss(A,B,0,0)



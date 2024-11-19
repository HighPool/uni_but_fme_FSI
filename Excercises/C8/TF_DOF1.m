%% Transfer function and SS of 1 DOF system

clc; clear all; close all

%% Parameters
m = 1; % kg
b = 2; % Nsm-1
k = 50; % Nm-1

F0 = 1; % N
omega = 5; % rads-1
freq = omega/(2*pi); % Hz

omega_0 = sqrt(k/m);
freq_0 = omega_0/(2*pi)

x0 = -0.5; % m
v0 = 0; % ms-1

%% TF
num = [1];
den = [m, b, k];
TF_1DOF = tf(num, den);

%% A-F
bode_opt = bodeoptions('cstprefs');
bode_opt.FreqUnits = 'Hz';
bode_opt.FreqScale = 'linear';
bode_opt.MagUnits = 'abs';
freq_bode = 2*pi*linspace(0,3,1000);

figure;
bode(TF_1DOF,freq_bode,bode_opt)
grid on; grid minor

%% State-Space model
[A1,B1,C1,D1] = tf2ss(num,den);
A2 = [0 1;-k/m -b/m];
B2 = [0; 1/m];
C2 = eye(2,2);
D2 = zeros(2,1);
SS1DOF1 = ss(A1,B1,C1,D1);
SS1DOF2 = ss(A2,B2,C2,D2);

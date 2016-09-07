%%%%%%%%%%%%%%%%%%%%%%%%
%  cleaning workspace
bdclose all;
clear all;
bdclose all;
clc

sampleTime = 0.04; 
%%%%%%%%%%%%%%%%%%%%%%%%
disp('Select one of the following options:'); 
disp('    (1) Hover'); 
disp('    (2) Avoiding_Obstacle'); 

option = input('');

switch option
            case 1
                waypoints = getWaypoints();
                ARDroneHover; 
            case 2
                waypoints = getWaypoints();
                Avoiding_Obstacle; 
            otherwise
                disp('An incorrect option was selected')             
 end
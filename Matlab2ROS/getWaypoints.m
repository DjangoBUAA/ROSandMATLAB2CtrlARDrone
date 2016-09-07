function [ waypoint ] = getWaypoints(  )
% Number of waypoints. Edit this value as desired. 
nPoints = 1;

waypointsListARDrone = zeros(5,nPoints);

% waypointsListARDrone(:,k) = [ Xe (m), Ye (m), h (m) , yaw,waiting time
waypointsListARDrone(:,1) = [0.0255;0.51;1;0;30] ;
% waypointsListARDrone(:,2) = [-0.34;0.1;1;1.57;30] ;
% waypointsListARDrone(:,2) = [-0.84;1.02;1;0;70] ;
% waypointsListARDrone(:,3) = [0.82;1.20;1;0;70] ;
% waypointsListARDrone(:,4) = [0.87;-0.23;1;0;70] ;
% waypointsListARDrone(:,5) = [0.0255;0.51;1;0;70] ;

waypoint = waypointsListARDrone ; 

end


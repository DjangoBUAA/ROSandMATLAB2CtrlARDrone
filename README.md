# ROSandMATLAB2CtrlARDrone

This project aims to use ROS and Matlab to control ARDrone. 

1、In ROS, there are three nodes:ardrone_autonomy,ardrone_tutorials and vps_driver.
（1）ardrone_autonomy: communicate with ardrone,get the state information of ardrone and send control command to ardrone (C++);
（2）ardrone_tutorials:make the ardrone take-off and land by keyboard control or joystick (Python); 
（3）vps_driver:communicate with the indoor Visual Positioning System (VPS), get the position, velocity and attitude angles of ardrone (C++\UDP);

2、In MATLAB2ROS, a simulink mode has been built. This mode is a mission decision-make module, such as mission assignment, path planing and obstacle avoidance. What you should note here is that you must use the ROS tool box in simulink to publish and subscribe messages from ROS, and maybe you need to create your message (.msg) type , if that, you can refer the readme file in /vps_driver/matlab_gen/. Good luck to you!

这个文件夹是matlab2015b产生的配置文件夹。
自定义的消息和服务不能直接在MATLAB使用，处理步骤如下：
（1）先装第三方软件Robotics System Toolbox Interface for ROS Custom Messages
	http://www.mathworks.com/matlabcentral/fileexchange/49810-robotics-system-toolbox-interface-for-ros-custom-messages
（2）再利用rosgenmsg函数将自定义的消息和服务生成MATLAB可识别的语言
	自定义消息包路径：path = '/home/exbot/catkin_ws/src/vps_driver/';  
	生成配置文件：rosgenmsg(path)
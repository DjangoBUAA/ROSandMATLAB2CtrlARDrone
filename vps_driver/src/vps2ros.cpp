/* 发布器，从socket接收导航数据并发布到vpsnavdata话题
*/
#include <sys/socket.h>   // socket 头文件
#include <arpa/inet.h> // socket 常量头文件
#include <errno.h> // 获取socket错误码
#include <cstdlib> // argc,argv c语言标准库文件
#include <iostream> 
#include <sys/time.h>
#include <string.h> // memset 函数头文件
#include <unistd.h> // sleep 函数头文件
#include "ros/ros.h" // ros包头文件
#include "vps_driver/vps_navdata.h"  // 自定义消息vps_navdata头文件

unsigned short GenerateCRCCode(const unsigned char * pBuf, int nLength)
{
	unsigned short wCrc = (unsigned short)0xFFFF;

	for(int i = 0; i < nLength; i++) 
	{
		wCrc ^= (unsigned short)(unsigned char)pBuf[i];

		for(int j = 0; j < 8; j++)
		{
			if(wCrc & 1)
			{
				wCrc >>= 1; 
				wCrc ^= 0xA001;
			}
			else {
				wCrc >>= 1;
			}
		}
	}

	return wCrc;
}


int main(int argc, char **argv) {
// 初始化发布器
	ros::init(argc, argv, "vps_driver");
	ros::NodeHandle vps;
	ros::Publisher vps_pub = vps.advertise<vps_driver::vps_navdata>("vpsnavdata",1000);
	// 设置发布频率
	ros::Rate loop_rate(50);
/******************************************************************************/
	// 定义socket文件描述符、接收字节长度、socket地址
	int socket_srv,socket_client,bind_rv,recv_len;
	struct sockaddr_in address_srv,address_client,address_client_send;
	
	// 初始化服务端UDP socket并获取其文件描述符
	socket_srv = socket(AF_INET,SOCK_DGRAM,0);
            if (socket_srv == -1) {
		std::cout << "Unable to create a valid socket. EXIT." << std::endl;
        		return -1; 
	}
	
	// 初始化服务端地址结构
	memset((char *) &address_srv,0,sizeof(address_srv));
	address_srv.sin_family = AF_INET;
	address_srv.sin_port = htons(5500);
	address_srv.sin_addr.s_addr = inet_addr("192.168.0.10");

/***********************************************************************/	
            // 发送缓冲区，用于CRC检验
	unsigned char szBuf[4] = {0};
	szBuf[0] = 0x9a;
	szBuf[1] = 0x9b;
	unsigned short sCRCCode = GenerateCRCCode(szBuf, sizeof(szBuf)-2);
	szBuf[2] = sCRCCode & 0x00FF;
	szBuf[3] = (sCRCCode & 0xFF00)>> 8;

            // socket地址长度必须定义为"unsigned int"类型或 "socklen_t"类型
	socklen_t len_caddr=sizeof(address_srv); 
	int step = sizeof(double);
	int nSizeOfInt = sizeof(int);

	// 循环接收导航数据
	while (ros::ok())
	{	// 先向服务端发送CRC校验码确认连接	
		int nSent = sendto(socket_srv, (char*)szBuf, sizeof(szBuf), 0,(struct sockaddr * ) &address_srv,len_caddr);  
		if (nSent == -1) {
			if (errno == 10049) {
				close(socket_srv);
				//socket_srv = INVALID_SOCKET;
				address_srv.sin_family = AF_INET;
				address_srv.sin_addr.s_addr = inet_addr("192.168.0.10");//IP  
				address_srv.sin_port = htons(5500);
				socket_srv = socket(AF_INET, SOCK_DGRAM, 0);
				int nNetTimeout = 3000;//3秒

				//接收时限
				setsockopt(socket_srv, SOL_SOCKET, SO_RCVTIMEO, (char *)&nNetTimeout, sizeof(int));
			}
		}

		// 等待回应   
		unsigned char szRecvBuf[256] = {0};
		recv_len = recvfrom(socket_srv, (char*)szRecvBuf, sizeof( szRecvBuf), 0, (struct sockaddr *) &address_srv,&len_caddr);  

		if (recv_len != -1) {
			// 定义vps_navdata消息msg，用于向ROS空间发布导航数据
			vps_driver::vps_navdata msg;

			/*struct timeval tv;
			gettimeofday(&tv,NULL);*/

			// 导航数据解码
			int nDataTotalLen = 0 ; // 存放发送过来的数据总长度
			unsigned char *pDataBuf = (unsigned char*)szRecvBuf;
			memcpy(&nDataTotalLen,  pDataBuf, nSizeOfInt);
                                       for (unsigned char *p = pDataBuf + nSizeOfInt; p < pDataBuf + nDataTotalLen;  )
                                       {
                                       	// 读第一架多旋翼定位信息
                                       	p += nSizeOfInt;  // 跳过刚体id
                                       	memcpy(&msg.X_e,  p,  step);
	             		p += step;

				memcpy(&msg.Y_e,  p, step);
	             		p += step;

				memcpy(&msg.Z_e, p, step);
	            			p += step;

				memcpy(&msg.yaw_e, p, step);
	             		p += step;

				memcpy(&msg.Vx_e, p, step);
	             		p += step;

				memcpy(&msg.Vy_e, p, step);
	             		p += step;	             	
                                       }
			
             		msg.Vz_e = 0;     
             		//msg.Vz_e = tv.tv_sec*1000+tv.tv_usec/1000;
             		//std::cout << msg.X_e << std::endl;           		
			//ROS_INFO("%lf  %lf",msg1.Vz_e,msg2.Vz_);
			
			// 向话题vpsnavdata发布vps_navdata消息msg
			vps_pub.publish(msg);

			// 允许订阅器回调
			ros::spinOnce();
			
			// 睡眠，实现设定的发布频率
			loop_rate.sleep();	
			
		}
		else {
			std::cout << "WARNING: UDP reception error" << std::endl;
		}
		//usleep(50);       
	}

	close(socket_srv);
	std::cout << "Closing UDP socket at port " << 5500 << ". EXIT." << std::endl;
	return 0;
}

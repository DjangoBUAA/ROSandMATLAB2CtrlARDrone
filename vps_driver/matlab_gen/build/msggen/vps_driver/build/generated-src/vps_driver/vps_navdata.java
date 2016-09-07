package vps_driver;

public interface vps_navdata extends org.ros.internal.message.Message {
  static final java.lang.String _TYPE = "vps_driver/vps_navdata";
  static final java.lang.String _DEFINITION = "float64 X_e \nfloat64 Y_e \nfloat64 Z_e \nfloat64 yaw_e \nfloat64 Vx_e \nfloat64 Vy_e \nfloat64 Vz_e\n";
  double getXE();
  void setXE(double value);
  double getYE();
  void setYE(double value);
  double getZE();
  void setZE(double value);
  double getYawE();
  void setYawE(double value);
  double getVxE();
  void setVxE(double value);
  double getVyE();
  void setVyE(double value);
  double getVzE();
  void setVzE(double value);
}

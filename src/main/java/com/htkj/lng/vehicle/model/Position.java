package com.htkj.lng.vehicle.model;

/**
 * @author lyz
 * @date 2018/1/12 10:05
 */
public class Position
{
    /*
     * //主键
     * */
    private long id;

    /*
     * //车牌号
     * */
    private String plateNum;

    /*
     * //速度
     * */
    private float speed;

    /*
     * //方向 (正北  东北   正东  东南  正南  西南  正西  西北)
     * */
    private String direction;

    /*
     * //状态 在线(行驶) / 在线(静止)/ 离线
     * */
    private int status;

    /*
     * //统计时间（遵循约定时间格式）yyyy-mm-dd HH:MI:SS
     * */
    private String reportTime;

    /*
     * 	//经度
     * */
    private double longitude;

    /*
     * //纬度
     * */
    private double latitude;

    public long getId() { return id; }

    public void setId(long id) { this.id = id; }

    public String getPlateNum() { return plateNum; }

    public void setPlateNum(String plateNum) { this.plateNum = plateNum; }

    public float getSpeed() { return speed; }

    public void setSpeed(float speed) { this.speed = speed; }

    public String getDirection() { return direction; }

    public void setDirection(String direction) { this.direction = direction; }

    public int getStatus() { return status; }

    public void setStatus(int status) { this.status = status; }

    public String getReportTime() { return reportTime; }

    public void setReportTime(String reportTime) { this.reportTime = reportTime; }

    public double getLongitude() { return longitude; }

    public void setLongitude(double longitude) { this.longitude = longitude; }

    public double getLatitude() { return latitude; }

    public void setLatitude(double latitude) { this.latitude = latitude; }

    @Override
    public String toString()
    {
        return "position{" +
                "id=" + id +
                ", plateNum='" + plateNum + '\'' +
                ", speed=" + speed +
                ", direction='" + direction + '\'' +
                ", status=" + status +
                ", reportTime='" + reportTime + '\'' +
                ", longitude=" + longitude +
                ", latitude=" + latitude +
                '}';
    }
}

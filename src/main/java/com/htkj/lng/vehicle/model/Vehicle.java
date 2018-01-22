package com.htkj.lng.vehicle.model;

/**
 * (车辆实体类）
 * @author lyz
 * @date 2018/1/12 10:05
 */
public class Vehicle
{
    /*
     * //id
     */
    private long id;

    /*
     * //车牌号
     * */
    private String plateNum;

    /*
     * //客户名称
     * */
    private String userName;

    /*
     * //电话
     * */
    private String phoneNum;

    /*
     * //所属公司
     * */
    private String company;

    /*
     * //部门号
     * */
    private String depNum;

    /*
     * //部门名
     * */
    private String depName;

    /*
     * //终端号
     * */
    private String terNum;

    /*
     * //终端状态
     * */
    private int terStatus;

    /*
     * //气瓶号
     * */
    private String potNum;

    /*
     * //气瓶状态
     * */
    private int potStatus;

    /*
     * //服务到期时间（遵循约定时间格式）yyyy-mm-dd HH:MI:SS
     * */
    private String serviceEndTime;

    /*
     * //服务状态
     * */
    private int serviceStatus;

    public long getId() { return id; }

    public void setId(long id) { this.id = id; }

    public String getPlateNum() { return plateNum; }

    public void setPlateNum(String plateNum) { this.plateNum = plateNum; }

    public String getUserName() { return userName; }

    public void setUserName(String userName) { this.userName = userName; }

    public String getPhoneNum() { return phoneNum; }

    public void setPhoneNum(String phoneNum) { this.phoneNum = phoneNum; }

    public String getCompany() { return company; }

    public void setCompany(String company) { this.company = company; }

    public String getDepNum() { return depNum; }

    public void setDepNum(String depNum) { this.depNum = depNum; }

    public String getDepName() { return depName; }

    public void setDepName(String depName) { this.depName = depName; }

    public String getTerNum() { return terNum; }

    public void setTerNum(String terNum) { this.terNum = terNum; }

    public int getTerStatus() { return terStatus; }

    public void setTerStatus(int terStatus) { this.terStatus = terStatus; }

    public String getPotNum() { return potNum; }

    public void setPotNum(String potNum) { this.potNum = potNum; }

    public int getPotStatus() { return potStatus; }

    public void setPotStatus(int potStatus) { this.potStatus = potStatus; }

    public String getServiceEndTime() { return serviceEndTime; }

    public void setServiceEndTime(String serviceEndTime) { this.serviceEndTime = serviceEndTime; }

    public int getServiceStatus() { return serviceStatus; }

    public void setServiceStatus(int serviceStatus) { this.serviceStatus = serviceStatus; }

    @Override
    public String toString()
    {
        return "vehicle{" +
                "id=" + id +
                ", plateNum='" + plateNum + '\'' +
                ", userName='" + userName + '\'' +
                ", phoneNum='" + phoneNum + '\'' +
                ", company='" + company + '\'' +
                ", depNum='" + depNum + '\'' +
                ", depName='" + depName + '\'' +
                ", terNum='" + terNum + '\'' +
                ", terStatus=" + terStatus +
                ", potNum='" + potNum + '\'' +
                ", potStatus=" + potStatus +
                ", serviceEndTime='" + serviceEndTime + '\'' +
                ", serviceStatus=" + serviceStatus +
                '}';
    }
}

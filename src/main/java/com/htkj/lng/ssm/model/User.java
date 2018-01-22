package com.htkj.lng.ssm.model;

/**
 * Created by Zhangxq on 2016/7/15.
 */
public class User {

    private int id;
    private String userName;
    private String userPhone;
    private String userEmail;
    private String userPwd;
    private String QQ;
    private String userSex;
    private String createTime;
    private String modifyTime;
    private Short isDelete;
    private int userStatus;
    private String address;
    private int roleId;
    public int getRoleId() {return roleId;}

    public void setRoleId(int roleId) {this.roleId = roleId;}

    public void setUserStatus(int userStatus) {
        this.userStatus = userStatus;
    }

    public void setUserStatus(Integer userStatus) {
        this.userStatus = userStatus;
    }

    public Integer getUserStatus() {
        return userStatus;
    }

    public void setUserSex(String userSex) { this.userSex = userSex;}

    public String getUserSex() { return userSex;}

    public void setAddress(String address) {this.address = address;}

    public String getAddress() {return address;}

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getUserPhone() {
        return userPhone;
    }

    public void setUserPhone(String userPhone) {
        this.userPhone = userPhone;
    }

    public String getUserEmail() {
        return userEmail;
    }

    public void setUserEmail(String userEmail) {
        this.userEmail = userEmail;
    }

    public String getUserPwd() {
        return userPwd;
    }

    public void setUserPwd(String userPwd) {
        this.userPwd = userPwd;
    }

    public String getQQ() {
        return QQ;
    }

    public void setQQ(String QQ) {
        this.QQ = QQ;
    }

    public String getCreateTime() {
        return createTime;
    }

    public void setCreateTime(String createTime) {
        this.createTime = createTime;
    }

    public String getModifyTime() {
        return modifyTime;
    }

    public void setModifyTime(String modifyTime) {
        this.modifyTime = modifyTime;
    }

    public Short getIsDelete() {
        return isDelete;
    }

    public void setIsDelete(Short isDelete) {
        this.isDelete = isDelete;
    }
}

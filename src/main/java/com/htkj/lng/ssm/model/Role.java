/******************************************************************
 *
 * 无锡坦程第三方增值业务平台
 *
 * Package: com.tcwl.vsmp.sysuser.po
 *
 * Filename: SysRole.java
 *
 * Description: TODO(用一句话描述该文件做什么)
 *
 * Copyright: Copyright (c) 2012 Wu Xi Tan Cheng IOT Technology Co.,Ltd
 *
 * Company: 无锡坦程物联网科技有限公司
 *
 * @author: ChenLei
 *
 * @version: 1.0.0
 *
 * @since: 1.6.0
 *
 *         Create at: 2016-1-20 下午4:43:08
 *
 *         Revision:
 *
 *         2016-1-20 下午4:43:08 - first revision
 *
 *****************************************************************/

package com.htkj.lng.ssm.model;

import java.io.Serializable;

/**
 * 角色Po
 *
 * @author ChenLei  2016-1-20 下午4:43:08
 * @version 1.0.0
 */
public class Role implements Serializable {

    /**
     * @Field @serialVersionUID : TODO(这里用一句话描述这个类的作用)
     */
    private static final long serialVersionUID = 1L;

    /**
     * id
     */
    private int role_id;
    /**
     * 角色
     */
    private String role_code;
    /**
     * 角色名
     */
    private String role_name;
    /**
     * 角色描述
     */
    private String role_info;
    /**
     * 状态
     */
    private int status;
    /**
     * 可见菜单
     */
    private String menu_id;
    /**
     * 添加时间
     */
    private String create_time;
    /**
     * 修改时间
     */
    private String modify_time;
    /**
     * 部门
     */
    private String dept;

    public void setDept(String dept) {
        this.dept = dept;
    }

    public String getDept() {
        return dept;
    }

    public int getRole_id() {
        return role_id;
    }

    public void setRole_id(int role_id) {
        this.role_id = role_id;
    }

    public String getRole_code() {
        return role_code;
    }

    public void setRole_code(String role_code) {
        this.role_code = role_code;
    }

    public String getRole_name() {
        return role_name;
    }

    public void setRole_name(String role_name) {
        this.role_name = role_name;
    }

    public String getRole_info() {
        return role_info;
    }

    public void setRole_info(String role_info) {
        this.role_info = role_info;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getMenu_id() {
        return menu_id;
    }

    public void setMenu_id(String menu_id) {
        this.menu_id = menu_id;
    }

    /**
     * @return 结果
     */
    public String getCreate_time() {
        return create_time;
    }

    public void setCreate_time(String create_time) {
        this.create_time = create_time;
    }

    /**
     * @return 结果
     */
    public String getModify_time() {
        return modify_time;
    }

    public void setModify_time(String modify_time) {
        this.modify_time = modify_time;
    }

    public static long getSerialversionuid() {
        return serialVersionUID;
    }

}

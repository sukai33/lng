/**
 * 航天科技机构实体类
 */

package com.htkj.lng.ssm.model;

import java.io.Serializable;

/**
 * 
 *  机构Model
 * @author hecs
 * @version 1.0.0
 */
public class Dept implements Serializable
{

    /**
     * @Field @serialVersionUID : TODO(这里用一句话描述这个类的作用)
     */
    private static final long serialVersionUID = 1L;

    /**
     * 部门id
     */
    private int depart_id;
    /**
     * 部门名称
     */
    private String dept_name;
    /**
     * 父id
     */
    private int dept_parentId;
    /**
     * 部门信息
     */
    private String dept_info;
    /**
     * 电话
     */
    private String mobile;
    /**
     * 创建时间
     */
    private String set_time;

    public int getDepart_id()
    {
        return depart_id;
    }

    public static long getSerialversionuid()
    {
        return serialVersionUID;
    }

    public void setDepart_id(int depart_id)
    {
        this.depart_id = depart_id;
    }

    public String getDept_name()
    {
        return dept_name;
    }

    public void setDept_name(String dept_name)
    {
        this.dept_name = dept_name;
    }

    public int getDept_parentId()
    {
        return dept_parentId;
    }

    public void setDept_parentId(int dept_parentId)
    {
        this.dept_parentId = dept_parentId;
    }

    public String getDept_info()
    {
        return dept_info;
    }

    public void setDept_info(String dept_info)
    {
        this.dept_info = dept_info;
    }

    public String getMobile()
    {
        return mobile;
    }

    public void setMobile(String mobile)
    {
        this.mobile = mobile;
    }

    /**
     * 
     * @return 结果
     */
    public String getSet_time()
    {
        if (null != set_time)
        {
            return set_time.substring(0, set_time.length() - 2);
        }
        return set_time;
    }

    public void setSet_time(String set_time)
    {
        this.set_time = set_time;
    }

}

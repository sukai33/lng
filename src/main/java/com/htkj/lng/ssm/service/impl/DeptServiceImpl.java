/******************************************************************
 * 
 * 无锡坦程第三方增值业务平台
 * 
 * Package: com.tcwl.vsmp.dept.service.impl
 * 
 * Filename: DeptServiceImpl.java
 * 
 * Description: TODO(用一句话描述该文件做什么)
 * 
 * Copyright: Copyright (c) 2012 Wu Xi Tan Cheng IOT Technology Co.,Ltd
 * 
 * Company: 无锡坦程物联网科技有限公司
 * 
 * @author: Administrator
 * 
 * @version: 1.0.0
 * 
 * @since: 1.6.0
 * 
 *         Create at: 2016-1-27 上午9:22:00
 * 
 *         Revision:
 * 
 *         2016-1-27 上午9:22:00 - first revision
 * 
 *****************************************************************/

package com.htkj.lng.ssm.service.impl;

import com.htkj.lng.ssm.dao.DeptDao;
import com.htkj.lng.ssm.model.Dept;
import com.htkj.lng.ssm.service.DeptService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * 
 *  机构业务
 * @author ChenLei 2016-1-27 上午9:22:00
 * @version 1.0.0
 */
@Service
public class DeptServiceImpl implements DeptService
{

    /**
     * 机构信息Dao
     */
    @Autowired
    private DeptDao deptDao;

    /**
     * 添加新的机构
     * @param dept 部门
     * @return
     */
    public int insertDept(Dept dept)
    {
        try
        {
            deptDao.insertDept(dept);
            return 1;
        }
        catch (Exception e)
        {
            return 0;
        }
    }

    /**
     * @Description 查询所有销售机构
     * @return 结果
     */
    public List<Dept> querySaleDept()
    {
        List<Dept> data = (List<Dept>) (deptDao.querySaleDept());
        return data;
    }

    /**
     * 根据 id查询机构
     * @param id ： 机构id
     * @return : 机构
     */
    public Dept querySaleDeptById(Integer id) {
        return deptDao.querySaleDeptById(id);
    }

    /**
     * 查询机构
     * @return 机构
     */
    public List<Dept> queryAllDept(){ return deptDao.queryAllDept();}

    /**
     * 根据条件查询机构
     * @param map
     * @return
     */
    public List<Dept> findDeptByCond(Map<String,Object> map){return deptDao.findDeptByCond(map);}

}

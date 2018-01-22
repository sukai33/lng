package com.htkj.lng.ssm.service;

import com.htkj.lng.ssm.model.Dept;
import com.htkj.lng.ssm.model.Role;

import java.util.List;
import java.util.Map;

/**
 * Created by Zhangxq on 2016/7/15.
 */
public interface DeptService {

    /**
     * 添加
     * @param dept 部门
     * @return 结果
     */
    int insertDept(Dept dept);

    /**
     * 查询所有机构
     * @return 机构
     */
    List<Dept> queryAllDept();

    /**
     * 根据条件查询机构
     * @param map
     * @return
     */
    List<Dept> findDeptByCond(Map<String,Object> map);

}
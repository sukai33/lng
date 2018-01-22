package com.htkj.lng.ssm.service;

import com.htkj.lng.ssm.model.Role;

import java.util.List;

/**
 * Created by Zhangxq on 2016/7/15.
 */
public interface RoleService {
    /**
     * @Description (TODO这里用一句话描述这个方法的作用)
     * @param roleId id
     * @return 结果
     */
    Role getRoleById(int roleId);
    /**
     * 添加角色
     * @param r 角色
     * @return 结果
     */
    int insertSysRole(Role r);

    /**
     * 修改一个角色
     * @param r 角色
     */
    void updateRole(Role r);

    /**
     * 删除角色
     * @param id id
     * @return 结果
     */
    int delRole(int id);

    /**
     * 查询所有角色
     * @return 结果
     */
    List<Role> findAll();

}
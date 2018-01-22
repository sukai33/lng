package com.htkj.lng.ssm.dao;

import com.htkj.lng.ssm.model.Role;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by Zhangxq on 2016/7/15.
 */

@Repository
public interface RoleDao {

    Role selectRoleById(@Param("roleId") int roleId);

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

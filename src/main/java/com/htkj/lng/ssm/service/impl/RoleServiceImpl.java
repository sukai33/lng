package com.htkj.lng.ssm.service.impl;

import com.htkj.lng.common.Constant.OperateInfo;
import com.htkj.lng.ssm.dao.RoleDao;
import com.htkj.lng.ssm.model.Role;
import com.htkj.lng.ssm.service.RoleService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by Zhangxq
 */

@Service
@Transactional(rollbackFor = Exception.class)
public class RoleServiceImpl implements RoleService {

    @Resource
    private RoleDao roleDao;

    public Role getRoleById(int roleId) {
        return roleDao.selectRoleById(roleId);
    }

    /**
     * 添加角色
     *
     * @param r 角色
     * @return 结果
     */
    public int insertSysRole(Role r) {
        try {
            roleDao.insertSysRole(r);
            return OperateInfo.OPERATE_SUCCESS;
        } catch (Exception e) {
            return OperateInfo.OPERATE_FAILURE;
        }
    }

    /**
     * 修改一个角色
     *
     * @param r 角色
     */
    public void updateRole(Role r) {
        roleDao.updateRole(r);
    }

    /**
     * 删除角色
     *
     * @param id id
     * @return 结果
     */
    public int delRole(int id) {
        try {
            roleDao.delRole(id);
            return 1;
        } catch (Exception e) {
            return 0;
        }
    }

    /**
     * 查询所有角色
     * @return 结果
     */
    public List<Role> findAll() {
        return roleDao.findAll();
    }
}

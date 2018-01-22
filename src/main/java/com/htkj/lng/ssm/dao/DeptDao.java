/**
 * 
 * 航天科技后台管理子系统
 * 
 * Package: com.htkj.lng.ssm.dao
 * 
 * Filename: DeptDao.java
 * 
 * Description: TODO(用一句话描述该文件做什么)
 *
 */

package com.htkj.lng.ssm.dao;

import com.htkj.lng.ssm.model.Dept;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

/**
 * 机构信息Dao
 * @author hecs
 * @version 1.0.0
 */
@Repository
public interface DeptDao
{

    /**
     * @Description 查询所有一级机构
     * @return 部门
     */
    List<Dept> queryAllParentDept();

    /**
     * 查询所有机构信息
     * @return 部门
     */
    List<Dept> queryAllDept();

    /**
     * @Description 查询记录数
     * @param parentId 父id
     * @param is_join 是否递归
     * @return 数量
     */
    int queryAllDeptCount(@Param("parentId") int parentId,
                          @Param("is_join") int is_join);

    /**
     * @Description 查询该部门及其下级部门是否有客户存在
     * @param deptId 部门编号
     * @return 数量
     */
    int queryUserByDept(int deptId);

    /**
     * @Description 查询该部门及其下级部门是否有角色存在
     * @param deptId 部门编号          
     * @return 结果
     */
    int queryRoleByDept(int deptId);

    /**
     * @Description 删除该部门及其下级部门信息
     * @param deptid 部门编号          
     * @return 结果
     */
    int deleteDeptById(int deptid);

    /**
     * @Description 根据机构编号查询机构详情
     * @param deptid 机构id
     * @return 部门
     */
    Dept queryByDeptId(int deptid);

    /**
     * @Description 修改部门信息
     * @param dept 部门
     * @return 结果
     */
    int updateDeptById(Dept dept);

    /**
     * @Description 添加部门信息
     * @param dept 部门
     * @return 结果
     */
    int insertDept(Dept dept);

    /**
     * @Description 查询所有销售机构
     * @return 部门
     */
    List<Dept> querySaleDept();

    /**
     * 根据 id查询机构
     * @return 机构
     */
    Dept querySaleDeptById(Integer id);

    /**
     * 根据条件查询机构
     * @param map
     * @return
     */
    List<Dept> findDeptByCond(Map<String,Object> map);

}

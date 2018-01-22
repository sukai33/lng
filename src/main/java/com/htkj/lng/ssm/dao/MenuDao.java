/******************************************************************
 * 
 * 无锡坦程第三方增值业务平台
 * 
 * Package: com.tcwl.vsmp.role.dao
 * 
 * Filename: MenuDao.java
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
 *         Create at: 2016-1-30 下午1:49:03
 * 
 *         Revision:
 * 
 *         2016-1-30 下午1:49:03 - first revision
 * 
 *****************************************************************/

package com.htkj.lng.ssm.dao;

import com.htkj.lng.ssm.model.SysMenu;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * 
 *  菜单dao
 * @author ChenLei  2016-1-30 下午1:49:03
 * @version 1.0.0
 */
@Repository
public interface MenuDao
{

    /**
     * 
     * @return 结果
     */
    List<SysMenu> findAll();
}

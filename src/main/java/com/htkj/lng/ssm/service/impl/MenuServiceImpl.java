/******************************************************************
 * 
 * 无锡坦程第三方增值业务平台
 * 
 * Package: com.tcwl.vsmp.role.serviceimpl
 * 
 * Filename: MenuServiceImpl.java
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
 *         Create at: 2016-1-30 下午1:52:42
 * 
 *         Revision:
 * 
 *         2016-1-30 下午1:52:42 - first revision
 * 
 *****************************************************************/

package com.htkj.lng.ssm.service.impl;

import com.htkj.lng.ssm.dao.MenuDao;
import com.htkj.lng.ssm.model.SysMenu;
import com.htkj.lng.ssm.service.MenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 *  
 *  
 * @author ChenLei  2016-1-30 下午1:52:42
 * @version 1.0.0
 */
@Service
public class MenuServiceImpl implements MenuService
{

    /**
     * 菜单dao
     */
    @Autowired
    private MenuDao dao;

    /*
     * (非 Javadoc) Description:
     * 
     * @see com.tcwl.vsmp.role.service.MenuService#findAll()
     */
    public List<SysMenu> findAll()
    {
        return dao.findAll();
    }

}

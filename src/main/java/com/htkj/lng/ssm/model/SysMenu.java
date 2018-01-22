/**
 * 航天科技系统菜单
 */

package com.htkj.lng.ssm.model;

import java.io.Serializable;

/**
 * 
 *  系统菜单
 * @author hecs
 * @version 1.0.0
 */
public class SysMenu implements Serializable
{

    /**
     * @Field @serialVersionUID : TODO(这里用一句话描述这个类的作用)
     */
    private static final long serialVersionUID = 1L;

    /**
     * id
     */
    private int menu_id;
    /**
     *菜单名
     */
    private String menu_name;
    /**
     * 菜单url
     */
    private String menu_url;
    /**
     * 父id
     */
    private int parent_id;

    public int getMenu_id()
    {
        return menu_id;
    }

    public void setMenu_id(int menu_id)
    {
        this.menu_id = menu_id;
    }

    public String getMenu_name()
    {
        return menu_name;
    }

    public void setMenu_name(String menu_name)
    {
        this.menu_name = menu_name;
    }

    public String getMenu_url()
    {
        return menu_url;
    }

    public void setMenu_url(String menu_url)
    {
        this.menu_url = menu_url;
    }

    public int getParent_id()
    {
        return parent_id;
    }

    public void setParent_id(int parent_id)
    {
        this.parent_id = parent_id;
    }
}

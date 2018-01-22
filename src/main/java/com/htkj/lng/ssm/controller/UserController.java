package com.htkj.lng.ssm.controller;

import com.htkj.lng.ssm.model.SysMenu;
import com.htkj.lng.ssm.model.User;
import com.htkj.lng.ssm.service.MenuService;
import com.htkj.lng.ssm.service.UserService;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 关于权限，角色，机构的控制类
 * Created by hecs
 */

@Controller
@RequestMapping("/admin")
public class UserController {

    private Logger log = Logger.getLogger(UserController.class);
    public static final String[] DEPT_NAME = {"研发部","财务部","总经办","服务部","综合部"};
    @Resource
    private UserService userService;
    /**
     *  菜单service
     */
    @Autowired
    private MenuService menuService;
    /**
     * 查询所有角色
     * @param request
     * @param model
     * @return
     */
    @RequestMapping("/showUser")
    public String showUser(HttpServletRequest request, Model model){
        log.info("查询所有用户信息");
        List<User> userList = userService.getAllUser();
        model.addAttribute("userList",userList);
        return "show-user";
    }

    /**
     * 添加用户
     * @param request
     * @param model
     * @return
     */
    @RequestMapping("/addUser")
    public String addUser(HttpServletRequest request, Model model){
        log.info("查询所有用户信息");
        List<User> userList = userService.getAllUser();
        model.addAttribute("userList",userList);
        JSONArray jsonArray = JSONArray.fromObject(DEPT_NAME);
        request.setAttribute("depts",jsonArray);
            return "add-role";
    }

    /**
     * 查询所有菜单
     * @param response 返回
     * @return 结果
     */
    @RequestMapping(value = "/findAllMenu", produces = "application/json;charset=UTF-8")
    public @ResponseBody
    String findAllMenu(HttpServletResponse response)
    {
        JSONArray jsonArray = new JSONArray();
        JSONObject json = null;
        List<SysMenu> menus = menuService.findAll();
        for (SysMenu zNode : menus)
        {
            json = new JSONObject();
            json.put("id", zNode.getMenu_id());
            json.put("pId", zNode.getParent_id());
            json.put("name", zNode.getMenu_name());
            json.put("open", false);
            jsonArray.add(json);
        }
        String s = jsonArray.toString();
        return jsonArray.toString();
    }

    /**
     * 查询所有部门
     * @param response
     * @return
     */
    @RequestMapping(value = "/findAllDept", produces = "application/json;charset=UTF-8")
    public @ResponseBody
    Map<String, Object> findAllDept(HttpServletResponse response)
    {
        Map<String, Object> map = new HashMap<String, Object>();
        JSONArray jsonArray = JSONArray.fromObject(DEPT_NAME);
        map.put("result",jsonArray);
        return map;
    }
}

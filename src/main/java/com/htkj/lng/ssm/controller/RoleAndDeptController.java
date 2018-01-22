package com.htkj.lng.ssm.controller;

import com.htkj.lng.common.util.DateUtils;
import com.htkj.lng.ssm.model.Dept;
import com.htkj.lng.ssm.model.Role;
import com.htkj.lng.ssm.service.DeptService;
import com.htkj.lng.ssm.service.MenuService;
import com.htkj.lng.ssm.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * Created by Awary001 on 2018/1/18.
 */
@Controller
@RequestMapping("/role")
public class RoleAndDeptController {

    /**
     * 角色service
     */
    @Autowired
    private RoleService roleService;

    /**
     *  菜单service
     */
    @Autowired
    private MenuService menuService;

    /**
     *  机构service
     */
    @Autowired
    private DeptService deptService;
    /**
     * 查询角色
     * @return 结果
     */
    @RequestMapping("/findAll")
    public String findAll(HttpServletRequest request, Model model)
    {
        List<Role> roleList= roleService.findAll();
        model.addAttribute("roleList",roleList);
        return "show-role";
    }

    /**
     *
     * @param r 角色
     * @param request 请求
     * @return 结果
     */
    @RequestMapping("/insertRole")
    public @ResponseBody
    String insertRole(@RequestBody Role r, HttpServletRequest request)
    {
        String startTime = DateUtils.getCurrentDate("yyyy-MM-dd HH:mm:ss");
        try
        {
            roleService.insertSysRole(r);
        }
        catch (Exception e)
        {
            return "error";
        }
        return "success";
    }

    /**
     * 查询所有部门
     * @param request
     * @param model
     * @return
     */
    @RequestMapping("/showDept")
    public String showDept(HttpServletRequest request,Model model){
        List<Dept> deptList = deptService.queryAllDept();
        model.addAttribute("deptList",deptList);
        return "show-dept";
    }

    /**
     *
     * @param d 机构
     * @param request 请求
     * @return 结果
     */
    @RequestMapping("/insertDept")
    public @ResponseBody
    String insertDept(@RequestBody Dept d, HttpServletRequest request)
    {
        String startTime = DateUtils.getCurrentDate("yyyy-MM-dd HH:mm:ss");
        try
        {
            deptService.insertDept(d);
        }
        catch (Exception e)
        {
            return "error";
        }
        return "success";
    }


    @RequestMapping("/addDept")
    public String addDept(HttpServletRequest request,
                          @RequestParam("depart_id") String depart_id){

        return "add-dept";
    }
}

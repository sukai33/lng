package com.htkj.lng.ssm.controller;

import com.htkj.lng.ssm.service.UserService;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by hecs
 */
@Controller
@RequestMapping("/admin")
public class LoginController {
    private Logger log = Logger.getLogger(LoginController.class);
    @Resource
    private UserService userService;

    /**
     * 登录功能判断
     *
     * @param tel     手机号（作用户名登陆使用）
     * @param pwd     密码
     * @param request
     * @return
     */
    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public @ResponseBody
    Map<String, String> login(@RequestParam("tel") String tel,
                              @RequestParam("pwd") String pwd, HttpServletRequest request) {
        Map<String, String> map = userService.adminLogin(tel, pwd);
        HttpSession session = request.getSession(true);
        return map;
    }

    @RequestMapping("/loginSuccess")
    public String loginSuccess(HttpServletRequest request, Model model) {
        log.info("登录成功跳转");
        return "index";
    }
}

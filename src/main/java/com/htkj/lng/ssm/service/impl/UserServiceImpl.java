package com.htkj.lng.ssm.service.impl;

import com.htkj.lng.common.Constant.ExceptionInfo;
import com.htkj.lng.ssm.dao.UserDao;
import com.htkj.lng.ssm.model.User;
import com.htkj.lng.ssm.service.UserService;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by hecs
 */

@Service
@Transactional(rollbackFor = Exception.class)
public class UserServiceImpl implements UserService {

    @Resource
    private UserDao userDao;

    /**
     * 暂存登陆状态
     */
    private static Map<String, String> map = new HashMap<String, String>();

    public static Map<String, String> getMap() {
        return map;
    }

    public User getUserById(String tel) {
        return userDao.selectUserById(tel);
    }

    public User getUserByTel(String tel,String pwd) {
        return userDao.selectUserByTel(tel,pwd);
    }

    public List<User> getAllUser() {
        return userDao.selectAllUser();
    }

    /**
     * 登录
     * @param tel
     * @param pwd
     * @return
     */
    public synchronized Map<String,String> adminLogin(String tel,String pwd){
        //调用shiro进行登陆授权
        Subject subject = SecurityUtils.getSubject();
        UsernamePasswordToken token = new UsernamePasswordToken(tel,pwd);
        Map<String,String> message = new HashMap<String, String>();
        try {
            subject.login(token);
            message.put("resultcode","200");
            if (UserServiceImpl.map.get(tel) == null ||
                    !UserServiceImpl.map.get(tel).equals(pwd)) {
                message.put("resultcode","500");
                message.put("result","请输入正确的账户名或密码！");
            }

        } catch (Exception e){
            message.put("resultcode", "500");
            message.put("result", ExceptionInfo.PASSWORD_NOT_CORRECT);
            e.printStackTrace();
        }
        return message;
    }
}

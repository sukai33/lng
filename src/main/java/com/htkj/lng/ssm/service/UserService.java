package com.htkj.lng.ssm.service;

import com.htkj.lng.ssm.model.User;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * Created by Zhangxq on 2016/7/15.
 */
public interface UserService {

    User getUserByTel(String tel, String pwd);

    User getUserById(String tel);

    List<User> getAllUser();

    Map<String,String> adminLogin(String tel, String pwd);

}
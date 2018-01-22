package com.htkj.lng.common.shiro;

import com.htkj.lng.ssm.model.Role;
import com.htkj.lng.ssm.model.User;
import com.htkj.lng.ssm.service.RoleService;
import com.htkj.lng.ssm.service.UserService;
import com.htkj.lng.ssm.service.impl.UserServiceImpl;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

/**
 * Created by Awary001
 */
public class MyShiroRealm extends AuthorizingRealm {

    @Resource
    private UserService userService;
    @Resource
    private RoleService roleService;
    /**
     * 提供用户信息返回权限信息
     */
    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals){
        String username = (String) principals.getPrimaryPrincipal();
        SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();
        User user = userService.getUserById(username);
        int roleId = user.getRoleId();
        Role role = roleService.getRoleById(roleId);
        String[] array = role.getMenu_id().split(",");
        List<String> permissions = new ArrayList<String>();
        permissions = Arrays.asList(array);
        info.addRole(role.getRole_code());
        info.addStringPermissions(permissions);
        return info;
    }

    /**
     * 提供帐号返回信息
     */
    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authcToken){
        UsernamePasswordToken token = (UsernamePasswordToken) authcToken;
        User user = userService.getUserByTel((String)token.getUsername(),String.valueOf(token.getPassword()));
        if (null != user) {
            UserServiceImpl.getMap().put(user.getUserPhone(),user.getUserPwd());
            return new SimpleAuthenticationInfo(user.getUserPhone(),user.getUserPwd(),getName());
        }else {
            System.out.print("认证失败！");
            return null;
        }
    }
}

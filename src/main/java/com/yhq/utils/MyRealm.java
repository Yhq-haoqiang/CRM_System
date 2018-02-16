package com.yhq.utils;

import java.util.HashSet;
import java.util.Set;

import javax.annotation.Resource;

import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.authz.UnauthenticatedException;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;

import com.yhq.pojo.Menu;
import com.yhq.pojo.Role;
import com.yhq.pojo.User;
import com.yhq.service.IUserService;

public class MyRealm extends AuthorizingRealm {

	@Resource
	private IUserService ius;

	
	// 为当前登陆成功的用户授予权限和角色，已经登陆成功了
	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
		String username = (String) principals.getPrimaryPrincipal();
		User user = ius.findByUsername(username);
		SimpleAuthorizationInfo authorizationInfo = new SimpleAuthorizationInfo();
		Set<String> role = new HashSet<>();
		Set<String> Permissions = new HashSet<>();
		Set<Role> set = user.getRoles();
		for (Role role2 : set) {
			role.add(role2.getRname());
			for (Menu menu : role2.getMenus()) {
				Permissions.add(menu.getName());
			}
		}
		authorizationInfo.setRoles(role);
		authorizationInfo.setStringPermissions(Permissions);
		return authorizationInfo;
	}

	// 验证当前登录的用户，获取认证信息
	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
		String username = (String) token.getPrincipal();
		User user = ius.findByUsername(username);
		if (user != null) {
			return new SimpleAuthenticationInfo(user.getUsername(), user.getPassword(), getName());
		} else {
			throw new UnauthenticatedException();
		}
	}

}

package com.yhq.controller;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.crypto.hash.Sha256Hash;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.yhq.pojo.User;
import com.yhq.service.IUserService;

@Controller
public class LoginController {
	
	
	@Autowired
	private IUserService ius;
	
	@RequestMapping("/login")
	public String login(User user,Model m){
		if(user == null){
			m.addAttribute("error", "用户名/密码不正确");
			return "error";
		}
		Subject subject = SecurityUtils.getSubject();
		String password = new Sha256Hash(user.getPassword(),"yhq").toString();
        UsernamePasswordToken token = new UsernamePasswordToken(user.getUsername(), password);
        try {
			subject.login(token);
			Session session = subject.getSession(true);
			User u = ius.findByUsername(user.getUsername());
			session.setAttribute("name", u.getName());
			session.setAttribute("uid", u.getId());
			//subject.
		} catch (AuthenticationException e) {
			m.addAttribute("error", "用户名/密码不正确");
			return "error";
		}
		return "index";
	}
	
	@RequestMapping("/tologin")
	public String toLoginPage(){
		return "login";
	}
	
//	@RequestMapping("/logout")
//	public String logout(){
//		if(subject != null){
//			subject.logout();
//			subject = null;
//		}
//		return "login";
//	}
}

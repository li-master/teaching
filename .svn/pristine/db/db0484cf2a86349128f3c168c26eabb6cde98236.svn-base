package com.hiphop.common.base.controller;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hiphop.common.base.domin.SysUser;
import com.hiphop.common.base.service.SysUserService;
import com.hiphop.common.util.BaseSession;
import com.hiphop.common.util.R;
import com.hiphop.common.util.ResultModel;

import com.hiphop.common.base.service.SysUserMenuSerivce;
import com.hiphop.common.util.UserMenuUtil;


@Controller
public class LoginController {
	
	@Autowired
	HttpServletRequest request;
	
	@Autowired
	HttpServletResponse respone;
	
	@Autowired
	private SysUserService userService;

	@Autowired
	private SysUserMenuSerivce sysUserMenuSerivce;
	
	@GetMapping("/index")
	String index(HttpServletRequest request){
		request.setAttribute("menus", request.getSession().getAttribute(BaseSession.BASE_USER_SESSION));
		request.setAttribute("doLog", SecurityUtils.getSubject().getPrincipal());
		return "index";
	}
	
	@GetMapping("/main")
	String main(HttpServletRequest request){
		request.setAttribute("menus", UserMenuUtil.tree(sysUserMenuSerivce.list(1L),null));
		request.setAttribute("doLog", new SysUser());
		return "index";
	}

	@RequestMapping("/user-login")
	@ResponseBody
	public ResultModel login(String username, String password,HttpServletRequest request) {
		UsernamePasswordToken token = new UsernamePasswordToken(username, password);
		Subject subject = SecurityUtils.getSubject();
		try {
			subject.login(token);
			SysUser user=(SysUser) subject.getPrincipal();
			request.getSession().setAttribute(BaseSession.BASE_USER_SESSION, UserMenuUtil.tree(sysUserMenuSerivce.list(user.getId()),null));
		} catch (AuthenticationException e) {
			return new ResultModel(R.USER_LOGIN_ERROR);
		}
		return new ResultModel(R.OK);
	}

	@RequestMapping("/login")
	public String login() {
		return "login";
	}
	
	@RequestMapping("")
	public String login1() {
		return "login";
	}
	
	@GetMapping("/logout")
	public String logout() {
		Subject subject = SecurityUtils.getSubject();
		SecurityUtils.getSecurityManager().logout(subject);
		return "login";
	}
	
	
	@GetMapping("/welcome")
	String welcome(){
		return "welcome";
	}
}

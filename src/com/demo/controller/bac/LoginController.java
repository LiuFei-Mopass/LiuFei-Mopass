package com.demo.controller.bac;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.demo.backstage.doman.Right;
import com.demo.backstage.doman.Role;
import com.demo.backstage.doman.User;
import com.demo.backstage.service.rightService;
import com.demo.backstage.service.roleService;
import com.demo.backstage.service.impl.rightServiceImpl;
import com.demo.backstage.service.impl.roleServiceImpl;
import com.demo.backstage.service.impl.userServiceImpl;



@Controller
public class LoginController {
	private userServiceImpl userserviceimpl = new userServiceImpl();
	private roleService roleservice = new roleServiceImpl();
	private rightService rightservice = new rightServiceImpl();
	
	/**
	 * 方法描述- 后台用户登陆
	 * @param session
	 * @param name
	 * @param password
	 * @return
	 * @author  LIUFEI
	 * @date  2016-6-20
	 */
	 
	@RequestMapping(value="/login.html",method=RequestMethod.POST)
	public ModelAndView loginPost(HttpSession session,@RequestParam String name,@RequestParam String password){
		ModelAndView mv = new ModelAndView();
		User user = userserviceimpl.getUser(name, password);
		if(user!=null){
			Role role = roleservice.findAllRole(user.getId());
			if(role!=null){
				List<Right> rights = rightservice.findAllRights(role.getId());
				user.setRights(rights);
			}
			for (int i = 0; i < user.getRights().size() ; i++) {
				List<Right> chRights = rightservice.findAllRights(role.getId(),user.getRights().get(i).getId());
				user.getRights().get(i).setChRights(chRights);
			}
			mv.addObject("user", user);
			mv.setViewName("backstage/menu");
		}else{
			mv.setViewName("redirect:baclogin.html");
		}
		return mv;
	}
	
	
	@RequestMapping(value="/login.html",method=RequestMethod.GET)
	public ModelAndView loginPost(){
		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:baclogin.html");
		return mv;
	}

}

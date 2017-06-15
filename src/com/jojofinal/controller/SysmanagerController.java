package com.jojofinal.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.jojofinal.po.Restaurant;
import com.jojofinal.po.Sysmanager;
import com.jojofinal.po.User;
import com.jojofinal.service.RestaurantService;
import com.jojofinal.service.SysmanagerService;
import com.jojofinal.service.UserService;

@Controller
@RequestMapping("/sys")
public class SysmanagerController {

	@Autowired
	private RestaurantService rs;

	@Autowired
	private UserService us;

	@Autowired
	private SysmanagerService ss;

	@RequestMapping("/slogin")
	public ModelAndView showsys() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/sysmanager/slogin");
		return mv;
	}

	@RequestMapping("/doslogin")
	public ModelAndView doslogin(Sysmanager sys, HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		List<Sysmanager> syslist = ss.findChecksys(sys);
		if (null != syslist & !syslist.isEmpty()) {
			request.getSession().setAttribute("sys", syslist.get(0));
			mv.setViewName("/sysmanager/smain");
		} else {
			mv.setViewName("/sysmanager/slogin");
		}
		return mv;

	}

	@RequestMapping("/deleteuser")
	public ModelAndView dodeleteuser(HttpServletRequest request) {
		int uid = Integer.parseInt(request.getParameter("uid"));
		ModelAndView mv = new ModelAndView();
		us.deleteUserById(uid);
		List<User> ulist = us.showall();
		request.getSession().setAttribute("ulist", ulist);
		mv.setViewName("/sysmanager/umanage");
		return mv;
	}

	@RequestMapping("/deleteres")
	public ModelAndView dodeleteres(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		int rid = Integer.parseInt(request.getParameter("rid"));
		rs.deleteRes(rid);
		List<Restaurant> rlist = rs.showAll();
		request.getSession().setAttribute("rlist", rlist);
		mv.setViewName("/sysmanager/rmanage");
		return mv;
	}

	@RequestMapping("/umanage")
	public ModelAndView umanage(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		List<User> ulist = us.showall();
		request.getSession().setAttribute("ulist", ulist);
		mv.setViewName("/sysmanager/umanage");
		return mv;
	}

	@RequestMapping("/rmanage")
	public ModelAndView rmanage(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		List<Restaurant> rlist = rs.showAll();
		request.getSession().setAttribute("rlist", rlist);
		mv.setViewName("/sysmanager/rmanage");
		return mv;
	}

	@RequestMapping("/changerpass")
	public ModelAndView changerpass(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		int rid = Integer.parseInt(request.getParameter("rid"));
		Restaurant res = rs.findById(rid).get(0);
		request.getSession().setAttribute("res", res);
		mv.setViewName("/sysmanager/rpasschange");
		return mv;
	}

	@RequestMapping("/changeupass")
	public ModelAndView changeupass(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		int uid = Integer.parseInt(request.getParameter("uid"));
		User u = us.findUser(uid).get(0);
		request.getSession().setAttribute("u", u);
		mv.setViewName("/sysmanager/upasschange");
		return mv;
	}

	@RequestMapping("/dochangeupass")
	public ModelAndView dochangeupass(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		int uid = Integer.parseInt(request.getParameter("uid"));
		String pass = request.getParameter("upassword");

		User u = new User();
		u.setUid(uid);
		u.setUpassword(pass);
		us.updatepass(u);
		List<User> ulist = us.showall();
		request.getSession().removeAttribute("ulist");
		request.getSession().setAttribute("ulist", ulist);
		mv.setViewName("/sysmanager/umanage");
		return mv;
	}

	@RequestMapping("/dochangerpass")
	public ModelAndView dochangerpass(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		int rid = Integer.parseInt(request.getParameter("rid"));
		String pass = request.getParameter("rpassword");
		Restaurant res = new Restaurant();
		res.setRid(rid);
		res.setRpassword(pass);
		rs.updatepass(res);
		List<Restaurant> rlist = rs.showAll();
		request.getSession().removeAttribute("rlist");
		request.getSession().setAttribute("rlist", rlist);
		mv.setViewName("/sysmanager/rmanage");
		return mv;
	}
}

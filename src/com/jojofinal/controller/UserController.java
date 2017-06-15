package com.jojofinal.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSON;
import net.sf.json.JSONArray;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.jojofinal.po.Msg;
import com.jojofinal.po.Restaurant;
import com.jojofinal.po.User;
import com.jojofinal.service.DishService;
import com.jojofinal.service.MsgService;
import com.jojofinal.service.RestaurantService;
import com.jojofinal.service.UserService;

@Controller
@RequestMapping("/user")
public class UserController {

	@Autowired
	private UserService us;

	@Autowired
	private RestaurantService rs;

	@Autowired
	private DishService ds;

	@Autowired
	private MsgService ms;

	@RequestMapping("/ulogin")
	public ModelAndView welcomlogin() {
		System.out.println("欢迎用户登录");
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/user/ulogin");
		return mv;
	};

	@RequestMapping("/uregist")
	public ModelAndView welcomregist() {
		System.out.println("欢迎学生注册");
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/user/uregist");
		return mv;
	};

	@RequestMapping("/doulogin")
	public ModelAndView doulogin(User user, HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		System.out.println("用户名是：" + user.getUname() + "密码是："
				+ user.getUpassword());
		List<User> ulist = us.findIsExist(user);
		if (null != ulist & !ulist.isEmpty()) {
			User u = ulist.get(0);
			int uid = u.getUid();
			System.out.println("---------用户id");
			System.out.println(u.getUid());
			request.getSession().setAttribute("user", u);
			List<Restaurant> rlist = rs.showAll();
			request.getSession().setAttribute("rlist", rlist);
			request.getSession().setAttribute("uid", uid);
			mv.setViewName("/mainpage/mainpage");
		} else {
			request.getSession().setAttribute("error", "密码错误！");
			request.getSession().setAttribute("name", user.getUname());
			mv.setViewName("/user/ulogin");
		}
		return mv;
	}

	@RequestMapping("/checkisexist")
	public @ResponseBody
	String showPartStitle(HttpServletRequest request) {
		String uname = request.getParameter("uname");
		System.out.println("检查用户名:" + uname + "是否已被占用");
		List<User> ulist = us.findNameIsexist(uname);
		if (null != ulist & !ulist.isEmpty()) {
			System.out.println("用户名已有");
			return "yes";
		} else {
			System.out.println("可以注册");
			return "no";
		}
	}

	@RequestMapping("/douregist")
	public ModelAndView dorregist(User user, HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		System.out.println("注册用户名为：" + user.getUname() + "注册密码为:"
				+ user.getUpassword());
		us.addUser(user);
		mv.setViewName("/user/ulogin");
		return mv;
	}

	@RequestMapping("/doaddgnum")
	public @ResponseBody
	String doaddgnum(HttpServletRequest request) {
		int did = Integer.parseInt(request.getParameter("did"));
		ds.addgnum(did);
		int gnum = ds.getgnum(did);
		return gnum + "";
	}

	@RequestMapping("/doaddbnum")
	public @ResponseBody
	String doaddbnum(HttpServletRequest request) {
		int did = Integer.parseInt(request.getParameter("did"));
		ds.addbnum(did);
		int bnum = ds.getbnum(did);
		return bnum + "";
	}

	@RequestMapping(value = "/doshowcom", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	public @ResponseBody
	String doshowcom(HttpServletRequest request) {
		System.out.println("正在请求评论");
		int did = Integer.parseInt(request.getParameter("did"));
		List<Msg> mlist = ms.findMsgByDish(did);
		JSONArray mjson = JSONArray.fromObject(mlist);
		String mjsons = mjson.toString();
		System.out.println(mjsons);
		return mjsons;
	}

	@RequestMapping(value = "/doaddcom", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	public @ResponseBody
	String doaddcom(HttpServletRequest request) {
		System.out.println("正在添加评论");
		int did = Integer.parseInt(request.getParameter("did"));
		String msg = request.getParameter("msg");
		int uid = Integer.parseInt(request.getParameter("uid"));
		Msg m = new Msg();
		m.setDid(did);
		m.setMmsg(msg);
		m.setUid(uid);
		ms.addMsg(m);
		int mid=m.getMid();
		System.out.println("评论ID："+mid+"----");
		return ""+mid;
	}

	@RequestMapping("/changepass")
	public ModelAndView changepass() {
		System.out.println("修改密码");
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/user/changepass");
		return mv;
	};

	@RequestMapping("/dochangepass")
	public ModelAndView dochangepass(String upassword,
			HttpServletRequest request, HttpSession session) {
		System.out.println("确认修改密码");
		ModelAndView mv = new ModelAndView();
		User u = (User) (session.getAttribute("user"));
		u.setUpassword(upassword);
		us.updatepass(u);
		session.removeAttribute("user");
		session.removeAttribute("error");
		mv.setViewName("/user/ulogin");
		return mv;
	};
	
	
	@RequestMapping("/deletemsg")
	public @ResponseBody String deletemsg(HttpServletRequest request, HttpSession session) {
		int mid=Integer.parseInt(request.getParameter("mid"));	
		ms.deleteMsgById(mid);
		return null;
	};
}

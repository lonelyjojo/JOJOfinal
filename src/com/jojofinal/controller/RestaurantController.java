package com.jojofinal.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.jojofinal.po.Dish;
import com.jojofinal.po.Restaurant;
import com.jojofinal.service.DishService;
import com.jojofinal.service.RestaurantService;
/**
 * 
 * @author jojo
 *管理与食堂用户相关操作，根据用户请求路径进入不同方法
 *controller注解标识了这是控制器类
 *requestmapping注解标识了请求的路径映射
 */
@Controller
@RequestMapping("/restaurant")
public class RestaurantController {

	/**
	 * 相关的service 
	 */
	@Autowired
	private RestaurantService rs;

	@Autowired
	private DishService ds;

	/**
	 * 用户的登录操作
	 * 
	 * @return 登录界面
	 */
	@RequestMapping("/rlogin")
	public ModelAndView welcomlogin() {
		System.out.println("欢迎食堂登录");
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/restaurant/rlogin");
		return mv;
	};

	/**
	 * 用户的注册请求
	 * @return 注册界面
	 */
	@RequestMapping("/rregist")
	public ModelAndView welcomregist() {
		System.out.println("欢迎食堂注册");
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/restaurant/rregist");
		return mv;
	};
/**
 * 添加菜的请求
 * @return 添加菜的页面
 */
	@RequestMapping("/adddish")
	public ModelAndView adddish() {
		System.out.println("跳转添加菜品页面!");
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/restaurant/adddish");
		return mv;
	};
	/**
	 * 登录验证
	 * @param res 食堂用户
	 * @param request request请求
	 * @return 主界面或登录界面
	 */
	@RequestMapping("/dorlogin")
	public ModelAndView dorlogin(Restaurant res, HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		System.out.println(res.getRname() + "      " + res.getRpassword());
		System.out.println("验证身份");
		List<Restaurant> reses = rs.findIsexist(res);
		System.out.println(reses.size());
		if (null != reses & !reses.isEmpty()) {
			Restaurant r = reses.get(0);
			System.out.println(r.getRname() + "           " + r.getRpassword());
			System.out.println(reses.size());
			mv.setViewName("/restaurant/resmanager");
			List<Dish> dishs = ds.showByRID(r.getRid());
			request.getSession().setAttribute("ruser", reses.get(0));
			request.getSession().setAttribute("dishlist", dishs);
		} else {
			request.getSession().setAttribute("error", "密码错误!");
			request.getSession().setAttribute("name", res.getRname());
			mv.setViewName("/restaurant/rlogin");
		}
		return mv;
	}
		
	 @RequestMapping("/showhotrank")
	 public ModelAndView showhotrank(HttpServletRequest request) {
	 System.out.println("展示热门菜");
	 ModelAndView mv = new ModelAndView();
	 List<Dish> dishs = ds.showHotRank();
	 mv.setViewName("/restaurant/hotdish");
	 request.getSession().setAttribute("dishs", dishs);
	 return mv;
	 }

	 @RequestMapping("/showbadrank")
	 public ModelAndView showbadrank(HttpServletRequest request) {
	 System.out.println("展示差评菜");
	 ModelAndView mv = new ModelAndView();
	 List<Dish> dishs = ds.showBadRank();
	 mv.setViewName("/restaurant/hotdish");
	 request.getSession().setAttribute("dishs", dishs);
	 return mv;
	 }
	 
	@RequestMapping("/checkisexist")
	public @ResponseBody
	String showPartStitle(HttpServletRequest request) {
		String rname = request.getParameter("rname");
		System.out.println("检查用户名:" + rname + "是否已被占用");
		List<Restaurant> rlist = rs.findNameIsexist(rname);
		if (null != rlist & !rlist.isEmpty()) {
			System.out.println("用户名已有");
			return "yes";
		} else {
			System.out.println("可以注册");
			return "no";
		}
	}

	@RequestMapping("/dorregist")
	public ModelAndView dorregist(Restaurant res, HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		System.out.println("注册用户名为：" + res.getRname() + "注册密码为:"
				+ res.getRpassword());
		rs.addRes(res);
		System.out.println("测试是否自动赋值"+res.getRid());
		mv.setViewName("/restaurant/rlogin");
		return mv;
	}

	@RequestMapping("/showoneres")
	public ModelAndView showoneres(int rid, int uid, HttpServletRequest request) {
		System.out.println("进入显示一家菜的方法");
		ModelAndView mv = new ModelAndView();
		List<Dish> dishs = ds.showByRID(rid);
		List<Restaurant> rlist = rs.findById(rid);
		System.out.println("展示" + rlist.get(0).getRname() + "的菜");
		System.out.println("菜总共有" + dishs.size() + "种");
		request.getSession().setAttribute("rname", rlist.get(0).getRname());
		request.getSession().setAttribute("dishs", dishs);
		mv.setViewName("mainpage/oneres");
		return mv;
	}

	@RequestMapping("/dodeletedish")
	public ModelAndView dodeletedish(int did, int rid,
			HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		ds.deleteDish(did);
		ds.showByRID(rid);
		List<Restaurant> rlist = rs.findById(rid);
		List<Dish> dishs = ds.showByRID(rid);
		request.getSession().removeAttribute("ruser");
		request.getSession().removeAttribute("dishlist");
		request.getSession().setAttribute("ruser", rlist.get(0));
		request.getSession().setAttribute("dishlist", dishs);
		mv.setViewName("/restaurant/resmanager");
		return mv;
	}

	@RequestMapping("/doadddish")
	public ModelAndView addDish(String dname, MultipartFile dpicture,
			HttpServletRequest request) throws IllegalStateException,
			IOException {
		ModelAndView mv = new ModelAndView();
		int rid = ((Restaurant) request.getSession().getAttribute("ruser")).getRid();
		String dpicName = UUID.randomUUID()
				+ dpicture.getOriginalFilename().substring(
						dpicture.getOriginalFilename().lastIndexOf("."));
		String dpicPath = "D:/jojofinalpic/" + dpicName;
//		String dpicPath = "/root/pic/" + dpicName;//云配置
		File dpic = new File(dpicPath);
		dpicture.transferTo(dpic);
		System.out.println("图片地址是:");
		System.out.println(dpic);
		System.out.println("菜名是:");
		System.out.println(dname);
		Dish dish = new Dish();
		dish.setDname(dname);
		dish.setRid(rid);
		dish.setDpic(dpicName);
		ds.addDish(dish);
		List<Restaurant> rlist = rs.findById(rid);
		List<Dish> dishs = ds.showByRID(rid);
		request.getSession().removeAttribute("ruser");
		request.getSession().removeAttribute("dishlist");
		request.getSession().setAttribute("ruser", rlist.get(0));
		request.getSession().setAttribute("dishlist", dishs);
		mv.setViewName("/restaurant/resmanager");
		return mv;
	}
	@RequestMapping("changedish")
	public ModelAndView changedish(int did,int rid,HttpServletRequest request
			) {
		System.out.println("跳转修改菜品页面!");
		ModelAndView mv = new ModelAndView();
		List<Restaurant> rlist = rs.findById(rid);
		List<Dish> dishs = ds.findById(did);
		request.getSession().removeAttribute("ruser");
		request.getSession().removeAttribute("dishlist");
		request.getSession().setAttribute("ruser", rlist.get(0));
		request.getSession().setAttribute("dish", dishs.get(0));
		mv.setViewName("/restaurant/changedish");
		return mv;
	};
	
	@RequestMapping("/dochangedish")
	public ModelAndView dochangedish(int did,String dname, MultipartFile dpicture,
			HttpServletRequest request) throws IllegalStateException, IOException {
		int rid = ((Restaurant) request.getSession().getAttribute("ruser"))
				.getRid();
		String dpicName;
		Dish dish=ds.findById(did).get(0);
		System.out.println(dish);
		dish.setDname(dname);
		System.out.println("文件是否为空呢?:"+dpicture.isEmpty());
		if(!dpicture.isEmpty())
		{
			 dpicName = UUID.randomUUID()
					+ dpicture.getOriginalFilename().substring(
							dpicture.getOriginalFilename().lastIndexOf("."));
			String dpicPath = "D:/jojofinalpic/" + dpicName;
//			 String dpicPath = "/root/pic/" + dpicName;
			 File dpic = new File(dpicPath);
			dpicture.transferTo(dpic);
			dish.setDpic(dpicName);
		}
		System.out.println("修改菜品!"+dish);
		ds.updateDish(dish);
		List<Restaurant> rlist = rs.findById(rid);
		List<Dish> dishs = ds.showByRID(rid);
		request.getSession().removeAttribute("ruser");
		request.getSession().removeAttribute("dishlist");
		request.getSession().setAttribute("ruser", rlist.get(0));
		request.getSession().setAttribute("dishlist", dishs);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/restaurant/resmanager");
		return mv;
	};
	
	@RequestMapping("/showdishcom")
	public ModelAndView showdishcom(HttpServletRequest request) {
		System.out.println("查看菜品评论");
		Restaurant res=(Restaurant)(request.getSession().getAttribute("ruser"));
		List<Dish> dishlist=ds.showByRID(res.getRid());
		request.getSession().setAttribute("dishs", dishlist);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/restaurant/mydishcom");
		return mv;
	};
	
	
	@RequestMapping("/gomanage")
	public ModelAndView gomanage(HttpServletRequest request) {
		System.out.println("返回菜品管理...");
		Restaurant res=(Restaurant)(request.getSession().getAttribute("ruser"));
		List<Dish> dishlist=ds.showByRID(res.getRid());
		request.getSession().setAttribute("dishs", dishlist);
		ModelAndView mv = new ModelAndView();
		request.getSession().removeAttribute("ruser");
		request.getSession().setAttribute("ruser", res);
		request.getSession().setAttribute("dishlist", dishlist);
		mv.setViewName("/restaurant/resmanager");
		return mv;
	};
	
		
	@RequestMapping("/changepass")
	public ModelAndView changepass(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		System.out.println("进入修改密码界面...");
		mv.setViewName("/restaurant/changepass");
		return mv;
	};
	
	@RequestMapping("/dochangerpass")
	public ModelAndView dochangerpass(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		int rid = Integer.parseInt(request.getParameter("rid"));
		String pass = request.getParameter("rpassword");
		Restaurant res = new Restaurant();
		res.setRid(rid);
		res.setRpassword(pass);
		rs.updatepass(res);
		request.getSession().removeAttribute("ruser");
		request.getSession().removeAttribute("error");
		mv.setViewName("/restaurant/rlogin");
		return mv;
	}
	
}

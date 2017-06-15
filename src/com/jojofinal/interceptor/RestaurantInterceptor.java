package com.jojofinal.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.jojofinal.po.Restaurant;
import com.jojofinal.po.User;

public class RestaurantInterceptor implements HandlerInterceptor {

	@Override
	public void afterCompletion(HttpServletRequest arg0,
			HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1,
			Object arg2, ModelAndView arg3) throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response,
			Object arg2) throws Exception {
		
			String url=request.getRequestURI();
	        Restaurant r = (Restaurant)request.getSession().getAttribute("ruser");
	        if(null!=r){
	            return true;
	        }
	        else{
	            request.getRequestDispatcher("/WEB-INF/jsp/restaurant/rlogin.jsp").forward(request, response);
	            return false;
	        }
	}

}

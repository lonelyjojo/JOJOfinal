package com.jojofinal.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.jojofinal.po.Sysmanager;
import com.jojofinal.po.User;

public class SysmanagerInterceptor implements HandlerInterceptor {

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
	        Sysmanager s = (Sysmanager)request.getSession().getAttribute("sys");
	        if(null!=s){
	            return true;
	        }
	        else{
	            request.getRequestDispatcher("/WEB-INF/jsp/sysmanager/slogin.jsp").forward(request, response);
	            return false;
	        }
	}

}

package com.br.law.interceptor;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;

public class AdminSessionInterceptor implements HandlerInterceptor{
	
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception /*ModelAndViewDefiningException*/{
		
		System.out.println("인터셉터 확인용");
		if(request.getSession().getAttribute("admin") == null) {
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.print("<script>alert('관리자 로그인이 필요합니다 !'); location.href='../user/main' </script> ");
			out.flush();
			out.close();
			
			return false;
		}
		return true;
	}
	//
}

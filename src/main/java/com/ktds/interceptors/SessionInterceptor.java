package com.ktds.interceptors;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.ktds.member.constants.Member;

public class SessionInterceptor extends HandlerInterceptorAdapter{

	private final Logger logger = 
			LoggerFactory.getLogger(SessionInterceptor.class);
	
	 @Override
	 public boolean preHandle(HttpServletRequest request,
			 				  HttpServletResponse response, Object controller)
			throws Exception{
		 
		 String contextPath = request.getContextPath();
		 
		 if( request.getSession().getAttribute(Member.USER) == null ) {
			 logger.info(request.getRequestURI() + " 안돼, 돌아가.");
			 response.sendRedirect( contextPath + "/login" ); //이러면 일일이 해줄 필요X
			 return false; //어떤의미? 로그인 하지 않았을때 걸려서, login페이지 무한반복
			 			   //세션이 없는 페이지: Main, 회원가입, 회원가입 처리, 로그인, 로그인 처리 페이지
		 }
		 return true;
	 }
	 
	 
	 
	 
	 
}

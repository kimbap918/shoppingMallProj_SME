package com.example.common.logger;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Component
public class LoginInterceptor extends HandlerInterceptorAdapter {
	protected Log log = LogFactory.getLog(LoggerInterceptor.class);
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) {
        log.info("sessionCheck : " + request.getSession().getAttribute("userInfo"));
        try {
            //userInfo 세션key를 가진 정보가 널일경우 로그인페이지로 이동
            if(request.getSession().getAttribute("userInfo") == null){
                log.error("can not search session ... ");
                response.sendRedirect("login.do");
                return false;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return true;
    }
}
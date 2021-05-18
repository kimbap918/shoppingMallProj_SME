package com.example.common.logger;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


@Component
public class AdminInterceptor extends HandlerInterceptorAdapter {
	protected Log log = LogFactory.getLog(LoggerInterceptor.class);
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws IOException {

    	 try {
             if(request.getSession().getAttribute("admin") == null){
                 log.error("can not search session ... ");
                 response.sendRedirect("index.do");
                 return false;
             }
         } catch (Exception e) {
             e.printStackTrace();
         }
         return true;
     }
 }	
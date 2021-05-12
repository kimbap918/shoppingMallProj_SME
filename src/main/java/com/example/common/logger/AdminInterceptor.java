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
             //userData 세션key를 가진 정보가 널일경우 로그인페이지로 이동
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
    /*	log.info("AdminCheck : " + request.getSession().getAttribute("admin"));
    	  HttpSession s = request.getSession();
          String adminCheck = (String) s.getAttribute("admin");
          if(adminCheck == null){
            response.sendRedirect("index.do");
            return false;
          }
          return true;
        }
}*/
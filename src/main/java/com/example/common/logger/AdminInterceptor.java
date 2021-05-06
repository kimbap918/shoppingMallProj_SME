package com.example.common.logger;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import java.io.IOException;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@Component
public class AdminInterceptor extends HandlerInterceptorAdapter {
	protected Log log = LogFactory.getLog(LoggerInterceptor.class);
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws IOException {
    
    	
   /* 	HttpSession session = request.getSession();
    	if(session.getAttribute("userInfo") != "admin") {
    		response.sendRedirect("index.do");
            return false;
    	} else {
    		return true;
    	}
    }
} */
 
    	log.info("AdminCheck : " + request.getParameter("AdminUserInfo"));
    	 	try {
             //userData 세션key를 가진 정보가 널일경우 로그인페이지로 이동
             if(request.getParameter("AdminUserInfo") == null){
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
 
       /* log.info("adminCheck : " + request.getSession().getAttribute("userInfo"));
        HttpSession s = request.getSession();
       String adminCheck = (String) s.getAttribute("adminCheck");
       if(adminCheck == null) {
    	   response.sendRedirect("login.do");
        }
        return true;
    }
} */
    	
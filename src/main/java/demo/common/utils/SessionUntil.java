package demo.common.utils;


import demo.domain.Whitelist;

import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public class SessionUntil {
    public static Whitelist getLoginUser(){
        return (Whitelist) getSession().getAttribute("loginUser");
    }

    public static HttpSession getSession(){
        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
        return request.getSession();
    }

    public static void setLoginUser(Whitelist loginUser){
        getSession().setAttribute("loginUser", loginUser);
    }
}

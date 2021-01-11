package demo.common.utils;


import demo.domain.WhitelistSetting;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public class SessionUntil {
    public static WhitelistSetting getLoginUser(){
        return (WhitelistSetting) getSession().getAttribute("loginUser");
    }

    public static HttpSession getSession(){
        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
        return request.getSession();
    }

    public static void setLoginUser(WhitelistSetting loginUser){
        getSession().setAttribute("loginUser", loginUser);
    }
}

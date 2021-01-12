package demo.common.utils;


import com.github.pagehelper.PageInfo;
import demo.domain.Batch;
import demo.domain.Whitelist;

import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

public class SessionUntil {
    public static HttpSession getSession() {
        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
        return request.getSession();
    }

    public static Whitelist getLoginUser() {
        return (Whitelist) getSession().getAttribute("loginUser");
    }

    public static void setLoginUser(Whitelist loginUser) {
        getSession().setAttribute("loginUser", loginUser);
    }

    public static void setBatchList(PageInfo pageInfo) {
        getSession().setAttribute("batchPageInfo", pageInfo);
    }
    public static List<Batch> getBatchList(){
        return (List<Batch>) getSession().getAttribute("batchPageInfo");
    }

}

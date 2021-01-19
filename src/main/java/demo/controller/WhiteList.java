package demo.controller;


import demo.common.JsonResult;
import demo.common.utils.SessionUntil;
import demo.domain.Whitelist;
import demo.service.LoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.io.UnsupportedEncodingException;

import static demo.common.utils.SessionUntil.setLoginUser;
@RequestMapping("/whitelist")
@Controller
public class WhiteList {
    @Autowired
    private LoginService loginService;

    @RequestMapping("/login")
    public String login(@RequestParam(value = "username")String username, @RequestParam(value = "sn")String sn,@RequestParam(value = "roleId")Integer roleId) {
        try {
            String gbk = new String(username.getBytes("ISO-8859-1"), "UTF-8");
            System.out.println(gbk);
            if(roleId==1){
                Whitelist studentlogin = loginService.studentLogin(gbk, sn);
                System.out.println(studentlogin.getRoleId());
                setLoginUser(studentlogin);
            }
            if (roleId==2){
                Whitelist teacherlogin = loginService.teacherLogin(gbk,sn);
                System.out.println(teacherlogin);
                setLoginUser(teacherlogin);
            }
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        return "forward:/batch/list";
    }
    @RequestMapping(value = "/setByAjax" ,method = RequestMethod.POST)
    @ResponseBody
    public JsonResult setByAjax(Whitelist whitelist){
        Whitelist login = loginService.login(whitelist.getSn());
        SessionUntil.setLoginUser(login);
        return JsonResult.ok(true);
    }
}

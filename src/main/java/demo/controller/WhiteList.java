package demo.controller;


import demo.common.JsonResult;
import demo.common.utils.SessionUntil;
import demo.domain.Role;
import demo.domain.Whitelist;
import demo.service.LoginService;
import demo.service.RoleService;
import demo.service.WhileListService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.io.UnsupportedEncodingException;
import java.util.List;

import static demo.common.utils.SessionUntil.setLoginUser;
@RequestMapping("/whitelist")
@Controller
public class WhiteList {
    @Autowired
    private LoginService loginService;
    @Autowired
    private WhileListService whileListService;
    @Autowired
    private RoleService roleService;

    @RequestMapping("/login")
    public String login(@RequestParam(value = "username")String username, @RequestParam(value = "sn")String sn,@RequestParam(value = "roleId")Integer roleId) {
        try {
            String gbk = new String(username.getBytes("ISO-8859-1"), "UTF-8");
            if(roleId==1){
                Whitelist studentlogin = loginService.studentLogin(gbk, sn);
                List<Role> list = roleService.list();
                studentlogin.setRoles(list);
                setLoginUser(studentlogin);
            }
            if (roleId==2){
                Whitelist teacherlogin = loginService.teacherLogin(gbk,sn);
                System.out.println(teacherlogin);
                List<Role> list = roleService.list();
                teacherlogin.setRoles(list);
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
    @RequestMapping(value = "selectBySn", method = RequestMethod.POST)
    @ResponseBody
    public JsonResult selectBySn(String sn){
        return JsonResult.ok(whileListService.selectBySn(sn));
    }

    @RequestMapping("list")
    public String list(Model model){
        List<Whitelist> list = whileListService.list();
        model.addAttribute("user",list);
        return "userlist";
    }
    @RequestMapping(value = "/insert", method = RequestMethod.POST)
    @ResponseBody
    public JsonResult insert(String sn) {
        return JsonResult.ok(whileListService.insert(sn));
    }

    @RequestMapping(value = "/changeRole", method = RequestMethod.POST)
    @ResponseBody
    public JsonResult changeRole(Long roleId) {
        Whitelist curUser = SessionUntil.getLoginUser();
        curUser.setRoleId(roleId);
        System.out.println(roleId);
        SessionUntil.setLoginUser(curUser);
        return JsonResult.ok(true);
    }
}

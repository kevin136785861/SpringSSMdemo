package demo.controller;

import demo.domain.UserManage;
import demo.service.LoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class WhileList {
    @Autowired
    private LoginService loginService;

    @RequestMapping("/login")
    public String login(@RequestParam(value = "username")String username, @RequestParam(value = "password")String password) {
        System.out.println(username);
        System.out.println(password);
        UserManage login = loginService.login(username, password);
        System.out.println(login);
        return "main";
    }
}

package demo.service;


import demo.domain.Whitelist;


public interface LoginService {
    Whitelist studentLogin(String username, String sn);
    Whitelist teacherLogin(String username,String sn);
    Whitelist login(String sn);
}

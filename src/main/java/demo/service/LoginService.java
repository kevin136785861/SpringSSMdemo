package demo.service;

import demo.domain.UserManage;

public interface LoginService {
    UserManage login(String username,String password);
}

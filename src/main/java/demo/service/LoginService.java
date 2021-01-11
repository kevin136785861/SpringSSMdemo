package demo.service;


import demo.domain.WhitelistSetting;

public interface LoginService {
    WhitelistSetting login(String username, String password);
}

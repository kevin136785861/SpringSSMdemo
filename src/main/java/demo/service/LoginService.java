package demo.service;


import demo.domain.Whitelist;


public interface LoginService {
    Whitelist login(String username, String password);
}

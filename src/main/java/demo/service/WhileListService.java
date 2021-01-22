package demo.service;

import demo.domain.UserManage;
import demo.domain.Whitelist;

import java.util.List;

public interface WhileListService {
    UserManage selectBySn(String sn);
    List<Whitelist> list();
    Boolean insert(String sn);
}

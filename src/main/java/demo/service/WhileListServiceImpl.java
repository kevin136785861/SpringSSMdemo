package demo.service;

import demo.domain.UserManage;
import demo.domain.UserRole;
import demo.domain.Whitelist;
import demo.mapper.WhitelistMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;

@Service
public class WhileListServiceImpl implements WhileListService {
    @Autowired
    private UserRoleService userRoleService;
    @Autowired
    private WhitelistMapper whitelistMapper;
    @Autowired
    private UserManageService userManageService;
    @Override
    public UserManage selectBySn(String sn) {
        return userManageService.selectBySn(sn);
    }

    @Override
    public List<Whitelist> list() {
        return whitelistMapper.selectByExample(null);
    }

    @Override
    public Boolean insert(String sn) {
        List<UserManage> userManages = userManageService.selectByUserSn(sn);
        Whitelist user = new Whitelist(userManages.get(0).getUsersn(), userManages.get(0).getUsername());
        whitelistMapper.insertSelective(user);
        Set<Long> collect = userManages.stream().map(x -> x.getRoleid()).collect(Collectors.toSet());
        List<UserRole> userRoles = collect.stream().map(x -> new UserRole(user.getId(), x)).collect(Collectors.toList());
        userRoleService.insert(userRoles);
        return true;
    }
}

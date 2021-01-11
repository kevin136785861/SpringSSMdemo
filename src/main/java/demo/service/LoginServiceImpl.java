package demo.service;


import demo.domain.UserManage;
import demo.domain.UserManageExample;
import demo.mapper.UserManageMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class LoginServiceImpl implements LoginService {

    @Autowired
    private UserManageMapper userManageMapper;
    @Override
    public UserManage login(String username, String password) {
        UserManageExample ume = new UserManageExample();
        ume.createCriteria().andUsernameEqualTo(username);
        List<UserManage> userManages = userManageMapper.selectByExample(ume);
        if(userManages.size()!=0){
            UserManage um = userManages.get(0);
            if (password.equals(um.getUsersn())){
                UserManage userManage = new UserManage();
                userManage.setUsername(username);
                userManage.setUsersn(um.getUsersn());
                return userManage;
            }
        }
        return null;
    }
}

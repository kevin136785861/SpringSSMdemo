package demo.service;


import demo.controller.WhileList;
import demo.domain.UserManage;
import demo.domain.UserManageExample;
import demo.domain.WhitelistSetting;
import demo.domain.WhitelistSettingExample;
import demo.mapper.UserManageMapper;
import demo.mapper.WhitelistSettingMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class LoginServiceImpl implements LoginService {

    @Autowired
    private WhitelistSettingMapper wlsm;
    @Override
    public WhitelistSetting login(String username, String password) {
        WhitelistSettingExample ume = new WhitelistSettingExample();
        ume.createCriteria().andNameEqualTo(username);
        List<WhitelistSetting> wss = wlsm.selectByExample(ume);
        if(wss.size()!=0){
            WhitelistSetting wls = wss.get(0);
            if (password.equals(wls.getSn())){
                return wls;
            }
        }
        return null;
    }
}

package demo.service;


import demo.controller.WhileList;
import demo.domain.*;
import demo.mapper.WhitelistMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class LoginServiceImpl implements LoginService {

    @Autowired
    private WhitelistMapper wlsm;
    @Override
    public Whitelist login(String username, String password) {
        WhitelistExample ume = new WhitelistExample();
        ume.createCriteria().andNameEqualTo(username);
        List<Whitelist> wss = wlsm.selectByExample(ume);
        if(wss.size()!=0){
            Whitelist wls = wss.get(0);
            if (password.equals(wls.getSn())){
                return wls;
            }
        }
        return null;
    }
}

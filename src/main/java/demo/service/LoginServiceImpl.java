package demo.service;


import demo.domain.*;
import demo.mapper.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class LoginServiceImpl implements LoginService {

    @Autowired
    private WhitelistMapper wlsm;
    @Autowired
    private StudentInfoMapper sim;
    @Autowired
    private UserManageMapper umm;
    @Autowired
    private KnrdInfoMapper knrdInfoMapper;
    @Autowired
    private RoleMapper roleMapper;
    @Override
    public Whitelist studentLogin(String username, String sn) {
        StudentInfoExample sie = new StudentInfoExample();
        sie.createCriteria().andSnEqualTo(sn).andNameEqualTo(username);
        List<StudentInfo> studentInfos = sim.selectByExample(sie);
        if (studentInfos.size()>0){
            KnrdInfoExample kie = new KnrdInfoExample();
            kie.createCriteria().andNameEqualTo(username).andStudentIdEqualTo(sn);
            List<KnrdInfo> knrdInfos = knrdInfoMapper.selectByExample(kie);
            if (knrdInfos.size()>0){
                WhitelistExample ume = new WhitelistExample();
                ume.createCriteria().andNameEqualTo(username);
                List<Whitelist> wss = wlsm.selectByExample(ume);
                if(wss.size()!=0){
                    Whitelist wls = wss.get(0);
                    if (sn.equals(wls.getSn())){
                        return wls;
                    }
                }
            }
        }
        return null;
    }

    @Override
    public Whitelist teacherLogin(String username, String sn) {
        UserManageExample userManageExample = new UserManageExample();
        userManageExample.createCriteria().andUsersnEqualTo(sn).andUsernameEqualTo(username);
        List<UserManage> userManages = umm.selectByExample(userManageExample);
        if (userManages.size()>0){
            WhitelistExample whitelist = new WhitelistExample();
            whitelist.createCriteria().andNameEqualTo(username);
            List<Whitelist> whitelists = wlsm.selectByExample(whitelist);
            if (whitelists.size()>0){
                Whitelist wls1 = whitelists.get(0);
                if (sn.equals(wls1.getSn())){
                    return wls1;
                }
            }
        }
        return null;
    }

    @Override
    public Whitelist login(String sn) {
        WhitelistExample whitelistExample = new WhitelistExample();
        whitelistExample.createCriteria().andSnEqualTo(sn);
        List<Whitelist> whitelists = wlsm.selectByExample(whitelistExample);
        if(whitelists.size()>0){
            Whitelist whitelist = whitelists.get(0);
            return whitelist;
        }
        return null;
    }
}

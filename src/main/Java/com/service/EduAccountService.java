package com.service;

import com.mapper.EduAccountMapper;
import com.mapper.UserMapper;
import com.pojo.EduAccount;
import com.pojo.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Service
public class EduAccountService {
    @Autowired
   private EduAccountMapper eduAccountMapper;
    public void addEduAccount(String userName,String eduName,String password){//添加一个绑定账号
        EduAccount eduAccount=new EduAccount();
        eduAccount.setBindUser(userName);
        eduAccount.setEduUserName(eduName);
        eduAccount.setEduPassword(password);
          eduAccountMapper.addEduAccount(eduAccount);
    }
    public void deleteEduAccount(String  bindUser){//删除一个绑定账号
        eduAccountMapper.deleteEduAccount(bindUser);
    }
    public EduAccount findEduAccount(String bindUser){//查找一个绑定账号
       return eduAccountMapper.findEduAccount(bindUser);
    }
}

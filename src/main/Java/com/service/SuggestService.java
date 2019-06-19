package com.service;

import com.mapper.AnimaMapper;
import com.mapper.SuggestMapper;
import com.pojo.Anima;
import com.pojo.Suggest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class SuggestService {
    @Autowired
    private SuggestMapper suggestMapper;
    public void addSuggest(String userName,String text){//添加一条建议
        Suggest suggest=new Suggest();
        suggest.setUserName(userName);
        suggest.setSuggestText(text);
        suggestMapper.addSuggest(suggest);
    }
}

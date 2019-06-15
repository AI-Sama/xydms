package com.Test;

import net.sf.json.JsonConfig;
import net.sf.json.processors.JsonValueProcessor;

import java.text.SimpleDateFormat;
import java.util.Date;

public class JsonDateValueProcessor  implements JsonValueProcessor {//设置一个自定义类,用来转化date
    private  String dataPattern="yy-MM-dd";//转换的样式
    public JsonDateValueProcessor() {//构造方法
        super();
    }

    @Override
    public Object processArrayValue(Object o, JsonConfig jsonConfig) {//实现转换方法,将date转化为指定格式
        if(o instanceof Date){//如果传入的类属于date,进行转换
        SimpleDateFormat simpleDateFormat=new SimpleDateFormat(dataPattern);
        Date date=(Date)o;
        return simpleDateFormat.format(date);
        }
        return o==null?null:o.toString();
    }

    @Override
    public Object processObjectValue(String s, Object o, JsonConfig jsonConfig) {
        return processArrayValue(o,jsonConfig);
    }

    public String getDataPattern() {
        return dataPattern;
    }

    public void setDataPattern(String dataPattern) {
        this.dataPattern = dataPattern;
    }
}

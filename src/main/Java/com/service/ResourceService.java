package com.service;

import com.mapper.ResourceMapper;
import com.pojo.Resource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.List;

@Service
public class ResourceService {
    @Autowired
    ResourceMapper resourceMapper;
    public List<Resource> findAllSrc(Integer pageNum) {//查找指定页数的资源
        int num = pageNum == 1 ? 0 : ((pageNum - 1) * 6);
        return resourceMapper.selectAllSrc(num);
    }

    public Integer findAllSrcPageNum() {//查找所有页数
        int a = resourceMapper.selectAllSrcPage();
        int page = a % 6 == 0 ? (a / 6) : ((a / 6) + 1);
        return page;
    }
    public void insertSrc(Resource resource, MultipartFile files[], String name) {//上传资源
        String  pathName = resourceMapper.selectLastSrcImg();//查找最后一张图片
        String text = resource.getSrcText();
        text = text.replaceAll("\r\n", "<br>");
        text = text.replaceAll(" ", "&nbsp;");
        resource.setSrcText(text);
        int num;
        if(pathName!=null){
            num = Integer.parseInt(pathName.split("-")[0]);
        }else {
            num=0;
        }
        num+=1;
        saveFile(files, num);
        resource.setUpUser(name);
        int y = 1;
        for (int x = 0; x < files.length; x++) {
            if (!files[x].isEmpty()) {
                if (x == 0) {
                    resource.setSrcImg01(String.valueOf(num) +"-"+y+ ".jpg");
                } else if (x == 1) {
                    resource.setSrcImg02(String.valueOf(num) +"-"+y+".jpg");
                } else if (x == 2) {
                    resource.setSrcImg03(String.valueOf(num )+"-"+y+ ".jpg");
                }
                y++;
            }
        }
        resourceMapper.insertSrc(resource);
    }

    public void saveFile(MultipartFile files[], int num) {//储存资源
        int y = 1;
        for (int x = 0; x < files.length; x++) {
            if (!files[x].isEmpty()) {//储存图片
                try {
                    String fileName = String.valueOf(num) +"-"+y+ ".jpg";
                    String filepath = "D:\\showImg\\SrcImg\\" + fileName;
//                    String filepath = "/home/BigImg/SrcImg/" + fileName;
                    File f = new File(filepath);
                    files[x].transferTo(f);
                    y++;
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }
}

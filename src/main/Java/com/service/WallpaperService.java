package com.service;
import com.mapper.WallpaperMapper;
import com.pojo.Wallpaper;
import net.coobird.thumbnailator.Thumbnails;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import java.io.File;
import java.io.IOException;
import java.util.List;

@Service
public class WallpaperService {
    @Autowired
   WallpaperMapper wallpaperMapper;

    public List<Wallpaper> selectHotImgList(Integer nowPageCount) {//根据页数查找热门图片
        int page = (nowPageCount == 1 ? 0 : (nowPageCount - 1) * 15);
        return wallpaperMapper.selectHotImgList(page);
    }

    public List<Wallpaper> selectNewImgList(Integer nowPageCount) {//根据页数查找最新图片
        int page = nowPageCount == 1 ? 0 : (nowPageCount - 1) * 15;
        return wallpaperMapper.selectNewImgList(page);
    }

    public int selectWallpaperCount() { //查找全部页数
        int a = wallpaperMapper.selectWallpaperCount();
        return a % 15 == 0 ? (a / 15) : ((a / 15) + 1);
    }

    public void clickImg(String addr) {//更新图片点击率
        wallpaperMapper.clickImg(addr);
    }

    public void upImg(MultipartFile files[], String name, String imgMessage[]) {//上传图片
        Integer imgTypeNum;
        for (int x = 0; x < files.length; x++) { //上传图片
            String str = wallpaperMapper.findLastImg();
            int addr;
            if (str != null) {
                addr = Integer.parseInt(str.split("\\.")[0]);
            } else {
                addr = 0;
            }
            addr += 1;
            String fileName = String.valueOf(addr) + ".jpg";
            saveFile(fileName, files[x], name, imgMessage[x]);
        }
    }

    public void saveFile(String fileName, MultipartFile file, String name, String imgMessage) {
        if (!file.isEmpty()) {//储存图片
            try {
                Wallpaper img = new Wallpaper();
                img.setImgAddr(fileName);
                img.setUpUser(name);
                if (imgMessage.trim().length() > 0) {
                    img.setImgMsg(imgMessage);
                } else {
                    img.setImgMsg("图片来自于网络");
                }
                wallpaperMapper.upImg(img);
                   String filepath = "D:\\showImg\\BigImg\\" + fileName;
//                String filepath = "/home/BigImg/BigImg/" + fileName;
                File f = new File(filepath);
                file.transferTo(f);
                   Thumbnails.of(filepath).scale(0.4f).toFile("D:\\showImg\\SmallImg\\" + fileName);
//                Thumbnails.of(filepath).scale(0.4f).toFile("/home/BigImg/SmallImg/" + fileName);
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

}

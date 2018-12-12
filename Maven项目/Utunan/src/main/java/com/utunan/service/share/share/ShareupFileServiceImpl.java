package com.utunan.service.share.share;

import com.utunan.mapper.share.ShareuploadMapper;
import com.utunan.pojo.base.share.File;
import com.utunan.service.share.ShareupFileService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;

@Service("ShareupFileService")
public class ShareupFileServiceImpl implements ShareupFileService {
    @Autowired
    private ShareuploadMapper shareuploadMapper;

    //查询对应标签ID
    @Override
    public Long getSuffix(String filetype) {
        return shareuploadMapper.getSuffix(filetype);
    }

    @Override
    public void insertfile(String sourcetype, String title, String school, Long userId, String path, Long suffixId, Long integral) {
        File file=new File();
        file.setFileSchool(school);
        file.setFileTime(new Date());
        file.setFileTitle(title);
        file.setSuffixId(suffixId);
        file.setFileUrl(path);
        file.setFileCredit(integral);
        file.setFileType(sourcetype);
        file.setUserId(userId);
        this.shareuploadMapper.insertfile(file);

    }
}

package com.utunan.mapper.share;

import com.utunan.pojo.base.school.Direction;
import com.utunan.pojo.base.share.File;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface ShareIndexMapper {
    List<File> listFileByTime();
    List<File> listHotFile();
}

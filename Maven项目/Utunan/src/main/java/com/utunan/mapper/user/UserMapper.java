package com.utunan.mapper.user;

import com.utunan.pojo.base.user.User;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Mapper
@Repository
public interface UserMapper {
    //插入用户
    int insert(User user);
    //通过
    User selectByPermit(User user);
    User selectByPorE(User user);
    int updateUser(User user);
    int updateUserPassword(User user);
    int updateUserHeadImg(@Param("userId")Long userId, @Param("userHeadImg")String userHeadImg);
}


package com.utunan.mapper.school;


import com.utunan.pojo.school.School;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface SchoolMapper {
    School queryByName(String schoolName);
    List<School> queryBy();
}

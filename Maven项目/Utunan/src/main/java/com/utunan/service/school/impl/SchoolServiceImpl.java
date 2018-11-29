package com.utunan.service.school.impl;

import com.utunan.mapper.school.SchoolMapper;
import com.utunan.pojo.base.school.School;
import com.utunan.service.school.SchoolService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service("schoolService")
public class SchoolServiceImpl  implements SchoolService {

    @Autowired
    private SchoolMapper schoolMapper;

    /*
     * @author  王碧云
     * @description 查询所有的学校
     * @date  20:12 2018/11/27/027
     * @param  []
     * @return  java.util.List<com.utunan.pojo.base.school.School>
     */
    @Override
    public List<School> findAllSchool() {
        return this.schoolMapper.findAllSchool();
    }

    /*
     * @author  王碧云
     * @description 根据省份检索学校(通过学校找到该校的研究方向)
     * @date  10:07 2018/11/28/028
     * @param  [schoolProvince]
     * @return  java.util.List<com.utunan.pojo.base.school.School>
     */
    @Override
    public List<School> findSchoolBySchoolProvince(String[] schoolProvinceList) {

       List<School> directionlist = new ArrayList<School>();

        for(String schoolProvince:schoolProvinceList){
            if(schoolProvince==null || "".equals(schoolProvince) || schoolProvince.equals("null")){
                directionlist = this.schoolMapper.findAllSchool();
                break;
            }else {
                directionlist = this.schoolMapper.findSchoolBySchoolProvince(schoolProvinceList);
            }
        }

        return directionlist;
    }
    /*
     * @author  王碧云
     * @description 根据学校类型检索学校(通过学校找到该校的研究方向)
     * @date  16:17 2018/11/28/028
     * @param  [schoolType]
     * @return  java.util.List<com.utunan.pojo.base.school.School>
     */
    @Override
    public List<School> findSchoolBySchoolType(String[] schoolTypeList) {
        System.out.println("[000]"+schoolTypeList);
        List<School> directionlist = new ArrayList<>();
        directionlist = this.schoolMapper.findSchoolBySchoolType(schoolTypeList);
        return directionlist;
    }
    /*
     * @author  王碧云
     * @description 根据所有参数检索所有学校
     * @date  22:51 2018/11/28/028
     * @param  [schoolProvinceList, schoolType]
     * @return  java.util.List<com.utunan.pojo.base.school.School>
     */
    @Override
    public List<School> findSchoolByAllParam(String[] schoolProvinceList, String[] schoolType) {
        List<School> directionlist = this.schoolMapper.findSchoolByAllParam(schoolProvinceList, schoolType);
        return directionlist;
    }


}

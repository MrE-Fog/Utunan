package com.utunan.controller.school;

import com.utunan.pojo.base.school.School;

import com.utunan.pojo.inherit.school.PublishDirection;
import com.utunan.service.school.DirectionService;
import com.utunan.service.school.PublishDirectionService;
import com.utunan.service.school.SchoolService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

/**
 * @author 王碧云
 * @description: 院校库首页
 * @date 2018/11/27/027 20:34
 */
@Controller
public class SchoolSearchController {

    @Autowired
    private PublishDirectionService publishDirectionService;

    /*
     * @author  王碧云
     * @description 显示院校库初始页面
     * @date  23:21 2018/11/27/027
     * @param  [request]
     * @return  java.lang.String
     */
    @RequestMapping("/displaySchool")
    public String displaySchool(HttpServletRequest request){
        List<PublishDirection> schoolList = this.publishDirectionService.findAllSchool();
        request.setAttribute("schoolList", schoolList);
        return "/school/schoolIndex";
    }

    /*
     * @author  王碧云
     * @description 根据搜索条件返回结果
     * @date  21:36 2018/11/27/027
     * @param  []
     * @return  java.lang.String
     */
    @RequestMapping("/displaySchoolBySearch")
    public String displaySchoolBySearch(@RequestParam(value = "schoolProvince",required = false) String[] schoolProvinceList,
                                        HttpServletRequest request,
                                        @RequestParam(value = "schoolType",required = false) String[] schoolTypeList,
                                        @RequestParam(value = "degreeType",required = false) String[] degreeTypeList,
                                        @RequestParam(value = "math",required = false) String[] mathList,
                                        @RequestParam(value = "english",required = false) String[] englishList,
                                        @RequestParam(value = "directionName",required = false) String directionName){
        String aaa = Arrays.toString(schoolTypeList);
        String bbb = Arrays.toString(schoolProvinceList);
        String ccc = Arrays.toString(degreeTypeList);
        String ddd = Arrays.toString(mathList);
        String eee = Arrays.toString(englishList);

        List<PublishDirection> schoolList = new ArrayList<>();
        schoolList = this.publishDirectionService.findSchoolByAllParam(schoolProvinceList, schoolTypeList,degreeTypeList,mathList,englishList,directionName);
        request.setAttribute("schoolList", schoolList);

        System.out.println("[schoolProvinceList]"+bbb);
        System.out.println("[schoolTypeList]"+aaa);
        System.out.println("[degreeTypeList]"+ccc);
        System.out.println("[math]"+ddd);
        System.out.println("[english]"+eee);
        System.out.println("[directionName]"+directionName);

        System.out.println(schoolList);
        return "/school/schoolIndex";
    }
}


package com.utunan.controller.school;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/school")
public class SchoolController {

    @RequestMapping("")
    public String school(){
        System.out.println("666");
        return "/school/school";
    }

}

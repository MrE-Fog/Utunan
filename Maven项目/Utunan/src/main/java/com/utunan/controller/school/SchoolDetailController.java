package com.utunan.controller.school;

import com.github.pagehelper.PageInfo;
import com.utunan.pojo.base.questionbank.DirectionCommentGreat;
import com.utunan.pojo.base.share.File;
import com.utunan.pojo.base.user.User;
import com.utunan.pojo.inherit.school.PublishDirection;
import com.utunan.service.questionbank.DirectionCommentGreatService;
import com.utunan.service.questionbank.PublishDirectionCommentService;
import com.utunan.service.school.DirectionService;
import com.utunan.service.school.PublishDirectionService;
import com.utunan.service.school.SchoolDetailFileService;
import com.utunan.service.user.UserService;
import com.utunan.util.SchoolOther;
import org.apache.http.HttpResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * @author 王碧云
 * @description: 学校详情控制
 * @date 2018/12/7/007 21:19
 */
@Controller
@RequestMapping("/school")
public class SchoolDetailController {

    @Autowired
    private PublishDirectionService publishDirectionService;
    @Autowired
    private PublishDirectionCommentService publishDirectionCommentService;
    @Autowired
    private DirectionService directionService;
    @Autowired
    private SchoolDetailFileService schoolDetailFileService;
    @Autowired
    private UserService userService;
    @Autowired
    private DirectionCommentGreatService directionCommentGreatService;

    /*
     * @author  王碧云
     * @description 显示页面详情页
     * @date  16:26 2018/12/16/016
     * @param  [request, directionId, sort, schoolName, session]
     * @return  java.lang.String
     */
    @RequestMapping("/displayDirectionDetail")
    public String displayDirectionDetail(HttpServletRequest request,
                                         @RequestParam(value = "directionId") String directionId,
                                         @RequestParam(value = "sort",required = false) String sort,
                                         @RequestParam("schoolName") String schoolName,
                                         HttpSession session){
        //获取当前用户
        User user = (User) session.getAttribute("User");

        //根据排序方式显示页面详情
        PublishDirection publishDirection = this.publishDirectionService.findDirectionByDirectionId(directionId,sort);
        //获取评论的长度
        int directionCommentCount =publishDirection.getDirectionComments().size();
        //获取页面浏览次数
        this.directionService.updateviewCount(Long.parseLong(directionId));
        Long viewCount = this.directionService.findDirectionByDirectionId(Long.parseLong(directionId)).getViewCount();
        //设置招生简章年份
        SchoolOther so = new SchoolOther();
        String year = so.theYear();
        //搜索招生简章文件和招生专业目录
        String fileType1 = "招生简章";
        String fileType2 = "招生专业目录";
        File EGfile = this.schoolDetailFileService.findEGThisYear(fileType1,schoolName);
        File AGfile = this.schoolDetailFileService.findEGThisYear(fileType2,schoolName);
        //查找该学校下载量最多的前九的文件
        List<File> top9file = this.schoolDetailFileService.findTop9SchoolFile(schoolName);

        //返回数据
        request.setAttribute("publishDirection", publishDirection);
        request.setAttribute("directionCommentCount", directionCommentCount);
        request.setAttribute("viewCount",viewCount);
        request.setAttribute("EGfile", EGfile);
        request.setAttribute("AGfile", AGfile);
        request.setAttribute("year", year);
        request.setAttribute("top9file", top9file);
        request.setAttribute("user", user);
        return "/school/schooldetail";
    }
    /*
     * @author  王碧云
     * @description 插入评论
     * @date  8:28 2018/12/13/013
     * @param  [directionId, directionCommentContent, schoolName, session, attr]
     * @return  java.lang.String
     */
    @RequestMapping("/insertDirectionComment")
    public String insertDirectionComment(@RequestParam(value = "directionId",required = false) Long directionId,
                                         @RequestParam(value = "content",required = false) String directionCommentContent,
                                         @RequestParam("schoolName") String schoolName,
                                         HttpSession session,
                                         RedirectAttributes attr){
        //获取当前用户
        User user = (User) session.getAttribute("User");
        Long userId = null;
        if(user != null){
            //用户已登录
            userId = user.getUserId();
            //插入评论
        }else {
            //用户未登录
            System.out.println("用户没登录！！");
        }
        //将评论插入评论表
        this.publishDirectionCommentService.insertDirectionComment(userId, directionId, directionCommentContent);

        //添加地址栏参数
        attr.addAttribute("directionId", directionId);
        attr.addAttribute("schoolName", schoolName);

        //转去显示页面详情页
        return "redirect:/school/displayDirectionDetail";
    }
    /*
     * @author  王碧云
     * @description 删除评论（管理员或用户本人）
     * @date  16:27 2018/12/16/016
     * @param  [request, directionCommentId, directionId, schoolName, attr]
     * @return  java.lang.String
     */
    @RequestMapping("/deleteDirectionComment")
    public String deleteDirectionComment(HttpServletRequest request,
                                         @RequestParam("directionCommentId") String directionCommentId,
                                         @RequestParam(value = "directionId",required = false) Long directionId,
                                         @RequestParam("schoolName") String schoolName,
                                         RedirectAttributes attr){
        //删除评论
        this.publishDirectionCommentService.deleteDirectionComment(Long.parseLong(directionCommentId));

        //添加地址栏参数
        attr.addAttribute("directionId", directionId);
        attr.addAttribute("schoolName", schoolName);

        //转去显示页面详情页
        return "redirect:/school/displayDirectionDetail";
    }

    /*
     * @author  王碧云
     * @description 弹窗的登录（判断用户名密码）
     * @date  15:42 2018/12/17/017
     * @param  [request, account, session]
     * @return  java.lang.String
     */
    @RequestMapping(value = "/popsupLogin", method = RequestMethod.POST)
    public void popsupLogin(HttpServletRequest request, User account, HttpSession session, HttpServletResponse response) throws IOException {
        String permit = request.getParameter("permit");
        account.setUserEmail(permit);
        account.setUserTelephone(permit);
        User user = userService.getUser(account);
        if (user != null) {
            request.removeAttribute("reply");
            session.setAttribute("User", user);

           response.getWriter().print("true");
        } else {
            response.getWriter().print("false");
        }
    }


    /*
     * @author  王碧云
     * @description 修改点赞数
     * @date  16:26 2018/12/16/016
     * @param  [directionCommentId, directionId]
     * @return  java.lang.String
     */
    @ResponseBody
    @RequestMapping("/updateDCPraiseCount")
    public String updateDirectionCommentPraiseCount(HttpSession session,HttpServletRequest request){
        String directionCommentId = request.getParameter("directionCommentId");
        User user = (User) session.getAttribute("User");
        System.out.println("[directionCommentId]"+directionCommentId);
        System.out.println("[user]"+user);
        //到院校评论点赞表进行查询是否有记录
        DirectionCommentGreat directionCommentGreat = this.directionCommentGreatService.findDCGreat(Long.parseLong(directionCommentId),user.getUserId());
        if(directionCommentGreat==null){
            //可以点赞
            this.directionCommentGreatService.insertDCGreat(Long.parseLong(directionCommentId),user.getUserId());
            this.publishDirectionCommentService.addDCPraiseCount(Long.parseLong(directionCommentId));
            System.out.println("点赞啦");
            return "ok";
        }else {
            //不能点赞
            this.directionCommentGreatService.deleteDCGreat(Long.parseLong(directionCommentId),user.getUserId());
            this.publishDirectionCommentService.delDCPraiseCount(Long.parseLong(directionCommentId));
            System.out.println("取消赞！！！");
            return "no";
        }
        /*
        return "redirect:/school/displayDirectionDetail?directionId="+directionId;*/
    }

}

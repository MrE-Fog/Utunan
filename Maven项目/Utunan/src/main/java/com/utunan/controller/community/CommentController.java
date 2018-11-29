package com.utunan.controller.community;

import com.utunan.pojo.base.user.User;
import com.utunan.service.community.CommentService;
import com.utunan.service.community.QuizService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.UnsupportedEncodingException;

/**
 * @author 张正扬
 * @description: 回答控制
 * @date 2018/11/22 15:53
 */
@Controller
public class CommentController {
    @Autowired
    private CommentService commentService;

    @Autowired
    private QuizService quizService;


    /*
     * @author  张正扬
     * @description 将回答插入数据库
     * @date  9:49 2018/11/28
     * @param  [request, session]
     * @return  java.lang.String
     */
    @RequestMapping(value = "/comment", method = RequestMethod.POST)
    public String insertComment(HttpServletRequest request, HttpSession session) throws UnsupportedEncodingException {
        request.setCharacterEncoding("UTF-8");
        String quizId = request.getParameter("quizId");
        String content = request.getParameter("textarea");
        Object ob = session.getAttribute("User");
        this.quizService.addCommentCount(Long.parseLong(quizId));
        Long cid = this.commentService.getMaxCid();
        cid += 1;
        if (ob != null) {
            User user = (User) ob;
            Long uid = user.getUserId();
            this.commentService.saveComment(cid, Long.parseLong(quizId), content, uid);

        }
        return "redirect:/displayQuizByQuizId?quizId=" + quizId;
    }


    @RequestMapping(value = "/comment1", method = RequestMethod.POST)
    /*
     * @author  张正扬
     * @description 向评论表中插入评论
     * @date  20:48 2018/11/29
     * @param  [request, session]
     * @return  java.lang.String
     */
    public String insertComment1(HttpServletRequest request, HttpSession session) throws
            UnsupportedEncodingException {
        request.setCharacterEncoding("UTF-8");
        String commentId = request.getParameter("commentId");
        String content = request.getParameter("text");
        Object ob = session.getAttribute("User");
        Long cid = this.commentService.getMaxCid();

        cid += 1;
        if (ob != null) {
            User user = (User) ob;
            Long uid = user.getUserId();

            this.commentService.saveComment1(cid, Long.parseLong(commentId), content, uid);



        }
        return "redirect:/displayChildComment?commentId=" + commentId;
    }
}

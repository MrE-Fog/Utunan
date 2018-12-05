package com.utunan.controller.community;

import com.utunan.pojo.base.community.Answer;
import com.utunan.pojo.base.community.Quiz;
import com.utunan.pojo.base.community.QuizTag;

import com.utunan.pojo.inherit.community.PublishQuiz;

import com.utunan.pojo.inherit.community.BigQuiz;

import com.utunan.pojo.util.Page;
import com.utunan.service.community.AnswerService;
import com.utunan.service.community.PublishQuizService;
import com.utunan.service.community.QuizService;
import com.utunan.service.community.QuizTagService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * @author 王碧云
 * @description: 问题页面控制
 * @date 2018/11/24 16:44
 */
@Controller
public class QuizCommentController {

    @Autowired
    private QuizService quizService;
    @Autowired
    private QuizTagService quizTagService;
    @Autowired
    private AnswerService answerService;

    @Autowired
    private PublishQuizService publishQuizService;
    /*
     * @author  王碧云
     * @description 返回对应QuizId对应的问题页面的值(默认按照时间排序)(分页)
     * @date  12:50 2018/11/25/025
     * @param  [request]
     * @return  java.lang.String
     */
    @RequestMapping("/displayQuizByQuizId")
    public String displayQuizByQuizId(HttpServletRequest request, HttpSession session){
        String url = "displayQuizByQuizId";
        String quizId = request.getParameter("quizId");
        //根据quizId返回quiz
        Quiz quiz = this.quizService.findQuizById(Long.parseLong(quizId));
        //根据quizId返回标签
        List<QuizTag> quizTagList =this.quizTagService.findQuizTagByQuizId(Long.parseLong(quizId));
        //根据quizId返回评论数量
        Long answerCountByQuizId = this.publishQuizService.countAnswerByQuizId(Long.parseLong(quizId));
        //根据quizId返回评论列表(根据时间排序)
        PublishQuiz ans = this.publishQuizService.findAnswerListByQuizId(Long.parseLong(quizId));
        if (ans!=null){
            List<Answer> answer= ans.getAnswers();
            request.setAttribute("answer", answer);
        }


        //获取页数
        String pageNum=request.getParameter("pageNum");
        //提问评论的数量(quizId父级为null的评论数)
        Long quizNumber = this.quizService.countAnswerByQuizId(Long.parseLong(quizId));
        //判断当前页
        int num=0;
        if(pageNum==null || pageNum.equals("")){
            num=1;
        }else{
            num=Integer.parseInt(pageNum);
        }
        //封装分页
        Page<BigQuiz> p = new Page<>(num, 6);
        p.setTotalCount(quizNumber);
        request.setAttribute("quizTagList", quizTagList);
        session.setAttribute("quiz", quiz);
        request.setAttribute("answerCountByQuizId", answerCountByQuizId);
        request.setAttribute("url", url);
        request.setAttribute("timeselect","selected=\"selected\"");
    
        return "community/quizcommentpage";
    }
    
    /*
     * @author  王碧云
     * @description 跳转返回子评论
     * @date  21:23 2018/11/25/025
     * @param  [request]
     * @return  java.lang.String
     */
    @RequestMapping("/displayChildComment")
    public String displayChildComment(HttpServletRequest request){
        String commentId = request.getParameter("commentId");
        //根据commentId返回子评论
        List<Answer> childAnswerList = this.answerService.findChildAnswerListByAnswerId(Long.parseLong(commentId));
    
        request.setAttribute("childAnswerList", childAnswerList);
        System.out.println("[childComment]"+ childAnswerList);
    
        return "community/childcomment";
    }
    
    /*
     * @author  王碧云 
     * @description 评论根据热度排序
     * @date  10:59 2018/11/26/026 
     * @param  [request]
     * @return  java.lang.String
     */
    @RequestMapping("/displayCommentByPraiseCount")
    public String displayCommentByPraiseCount(HttpServletRequest request){
        String quizId = request.getParameter("quizId");
        //根据quizId返回quiz
        Quiz quiz = this.quizService.findQuizById(Long.parseLong(quizId));
        //根据quizId返回标签
        List<QuizTag> quizTagList =this.quizTagService.findQuizTagByQuizId(Long.parseLong(quizId));
        //根据quizId返回评论数量
        Long answerCountByQuizId = this.publishQuizService.countAnswerByQuizId(Long.parseLong(quizId));
        //根据quizId返回评论列表(根据热度排序)
        PublishQuiz ans = this.publishQuizService.findAnswerListByPraiseCount(Long.parseLong(quizId));
        if (ans!=null){
            List<Answer> answer= ans.getAnswers();
            request.setAttribute("answer", answer);
        }
    
        request.setAttribute("quizTagList", quizTagList);
        request.setAttribute("quiz", quiz);
        request.setAttribute("answerCountByQuizId", answerCountByQuizId);
        request.setAttribute("praiseselect","selected=\"selected\"");
    
        return "community/quizcommentpage";
    }
}

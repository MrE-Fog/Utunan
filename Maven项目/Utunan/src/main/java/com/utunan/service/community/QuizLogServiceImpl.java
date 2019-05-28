package com.utunan.service.community.impl;

import com.utunan.pojo.util.QuizLog;
import com.utunan.service.community.QuizLogService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * @author 唐溪
 * @description: TODO
 * @date 2019/5/28 11:38
 */
@Service("QuizLogService")
public class QuizLogServiceImpl implements QuizLogService {

    @Override
    public void printLog(Long quizId, Long userId) {
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String time =df.format(new Date());
        QuizLog quizLog =new QuizLog();
        quizLog.setQuizId(quizId);
        quizLog.setUserId(userId);
        quizLog.setTime(time);
        quizLog.logsth();
    }
}

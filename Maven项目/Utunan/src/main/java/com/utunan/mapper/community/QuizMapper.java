package com.utunan.mapper.community;

import com.utunan.pojo.community.Quiz;
import com.utunan.pojo.community.QuizTag;
import com.utunan.pojo.community.Tag;
import com.utunan.pojo.user.User;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Mapper
@Repository
public interface QuizMapper {
    List<Quiz> listQuizByTime();
    List<Quiz> listQuizByPraise();
    Long countAllQuiz();
    User findUserByQuizId(@Param("quizId") Long quizId);
	Long countCommentByQuizId(@Param("quizId") Long quizId);
	List<Tag> selectTagByQuizId(@Param("quizId") Long quizId);
    void toInsert(Quiz quiz);
    Quiz getQuiz1();
    /*王碧云 通过quizId查找问题*/
    Quiz findQuizById(@Param("quizId") Long quizId);

	List<Quiz> listQuizByTimeWithTagName(@Param("quizId") List<Long> quizId);
	List<Quiz> listQuizByPraiseWithTagName(@Param("quizId") List<Long> quizId);
	Long countQuizWithTagName(@Param("tagName") String tagName);
	List<Long> selectQuizIdByTagName(@Param("tagName") String tagName);
	List<Quiz> findQuizBySearch(@Param("searchValue") String searchValue);
	Long countQuizBySearch(@Param("searchValue") String searchValue);
	
	/*
	 * @author  张正扬
	 * @description 点赞更新
	 * @date  21:36 2018/11/27
	 * @param  quizId
	 * @return  void
	 */
	void updatePraiseCount(@Param("quizId") Long quizId);


	/**
	 * @author  yanzhengwei
	 * 功能:	通过用户Id 查询帖子
	 */
	List<Quiz> selectQuizByUserId(User user);
	
	/*
	 * @author  张正扬
	 * @description 获取最大quizId
	 * @date  17:40 2018/11/28
	 * @param  null
	 * @return  Long
	 */
	Long getMax();


​    List<Quiz> selectQuizByUserId(User user);

}
